import 'dart:ffi';

import 'package:dartpy/dartpy.dart';
import 'package:ffi/ffi.dart';

void main(List<String> args) {
  dartpyc.Py_Initialize();
  const python = '''
import numpy as np
import imageio as iio
import matplotlib.pyplot as plt
from matplotlib.pyplot import imshow
import random
from sklearn.cluster import KMeans
from scipy.spatial import distance
import droppy
import scipy.io as sio
import os
import pathlib
import time

filepath = 'dataset\\wineLaland-water-DM (2)\\L\\'
os.makedirs(os.path.join(filepath, "res//algo//"), exist_ok=True)
num = 0
SKIP = 0
DeltaZ = 5
listeNoir = [17]
resultats = np.zeros((len(os.listdir(filepath)) - SKIP, 7))

tic = time.perf_counter()
for filename in pathlib.Path(filepath).glob('*video*.mat'):  # os.listdir(filepath):
    if (num < SKIP):  # or num in listeNoir
        num = num + 1
        continue

    f = os.path.join(filepath, filename)
    num += 1
    # checking if it is a file
    if os.path.isfile(f):
        print(str(num) + ' => Fichier : ' + f)

        mat = sio.loadmat(f)  # load mat-file
        pointsF = mat['data'][0][0]
        Z0 = np.transpose(mat['data'][0][5])  # 3 Z0, 5 newZ
        # Z0 = mat['data'][0][5]
        Lendr = mat['data'][0][1]
        Rendr = mat['data'][0][2]
        coef = mat['data'][0][4]
        Q = mat['data'][0][7]

        # Robust fitting
        from sklearn.cluster import KMeans

        Z02 = Z0.copy()
        data = pointsF - Z02.astype(np.float)

        h = np.abs(np.max(data[:, 1]) - np.min(data[:, 1]))
        out2 = droppy.bafits.fit_bashforth_adams(data, a=0.5, b=2)
        a = out2.x[0]
        b = out2.x[1]
        p2 = droppy.bafits.sim_bashforth_adams(h, a, b, all_the_way=False)

        # points wise errors
        dist = distance.cdist(data, p2[1][:, :])
        smallest = np.min(dist, axis=1)

        # Point filtering algorithm : Threshold based, Kmeans based or other algo based
        xdata = smallest.reshape(-1, 1)
        kmeans = KMeans(n_clusters=3, random_state=0).fit(xdata)

        # retain the lower cluster
        avg = []
        for k in range(3):
            ids = np.where(kmeans.labels_ == k)
            avg.append(np.mean(xdata[ids]))

        idInliers = np.where(kmeans.labels_ == avg.index(np.min(avg)))
        inlierspts = pointsF[idInliers][:]  # np.delete(pointsF,idOutliers, axis=0)

        # Final Robust fit
        #         Z0[0][1] = 1137
        print("==> Robust Fitting loop, starting with Z = " + str(Z0[0][1]) + " \n")
        done = False
        DeltaZ = 5
        l = 1
        while (not done):
            candidate = np.linspace(Z0[0][1] - DeltaZ / 2, Z0[0][1] + DeltaZ / 2, num=10)
            Z02 = Z0.copy()
            scores = []

            #             print("-> ItÃ©ration "+str(l)+" , Z = "+str(Z0[0][1])+" \n")
            for k in candidate:
                print(k)
                Z02[0][1] = k
                data = inlierspts - Z02.astype(np.float)
                out = droppy.bafits.fit_bashforth_adams(data, a=0.5, b=2)
                scores.append(out.fun)
            #                 print(out.fun)

            done = (np.abs(Z0[0][1] - candidate[scores.index(np.min(scores))]) < 0.5)
            if (done or l > 4):
                break

            Z0[0][1] = candidate[scores.index(np.min(scores))]
            l = l + 1

        if (l > 4 and (not done)):  # or num in listeNoir
            num = num + 1
            continue

        print("...Z0 converged. Robust Fit done; Z final = " + str(
            candidate[scores.index(np.min(scores))]) + " and score " + str(np.min(scores)))
        # savefig
        plt.plot(candidate, scores)
        plt.savefig(filepath + 'res//algo//' + f[-18:-4] + " Z0 curve " + '.png')
        plt.clf()

        #         plt.plot(candidate, scores)

        data = inlierspts - Z0.astype(np.float)
        #         plt.scatter(data[:,0],data[:,1])
        out = droppy.bafits.fit_bashforth_adams(data, a=0.5, b=2)

        h = np.abs(np.max(data[:, 1]) - np.min(data[:, 1]))
        a = out.x[0]
        b = out.x[1]
        p2 = droppy.bafits.sim_bashforth_adams(h, a, b, all_the_way=False)
        theta = np.max(p2[0])

        envergurex = np.max(data[:, 0]) - np.min(data[:, 0])
        envergurey = np.max(data[:, 1]) - np.min(data[:, 1])
        score = float(out.fun)
        normscore = score / np.sqrt(envergurex ** 2 + envergurey ** 2)

        # print(envergurex, envergurey, score, normscore)
        title = 'Q = ' + str(int(Q * 100) / 100) + 'a= ' + str(int(a * 10000) / 10000) + ' b= ' + str(
            int(b * 100) / 100) + ' theta= ' + str(int(theta * 100) / 100) + ' normscore= ' + str(
            int(normscore * 100) / 100)
        resultats[num - SKIP - 1, :] = np.array(
            [int(Q * 100) / 100, int(coef * 1000) / 1000, int(a * 10000) / 10000, int(b * 100) / 100,
             int(theta * 100) / 100, int(score * 100) / 100, int(normscore * 100) / 100])
        print(title)

        plt.scatter(p2[1][:, 0], p2[1][:, 1])
        plt.scatter(data[:, 0], data[:, 1])
        #         plt.scatter(Z0[0][0],Z0[0][1])
        plt.title(title)

        plt.savefig(filepath + 'res//algo//' + f[-18:-4] + '.png')
        plt.clf()

        scipy.io.savemat(filepath + 'resultatsalgo.mat', {'resultats': resultats})
        print(filepath, " -> Done ", str(resultats.shape))

toc = time.perf_counter()
print(f" {len(os.listdir(filepath)) - SKIP} Files processed in {toc - tic:0.4f} seconds.")
''';

  final pystring = python.toNativeUtf8();
  dartpyc.PyRun_SimpleString(pystring.cast<Int8>());
  malloc.free(pystring);
  print(dartpyc.Py_FinalizeEx());
}