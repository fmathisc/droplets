import 'dart:io';
import 'package:image/image.dart';

class imageSegmentation {

  Image lancement(String file) {
    // Charger l'image à segmenter
    Image? image = decodeImage(File(file).readAsBytesSync());

    // Segmenter l'image
    Image imageSegmentee = segmenterImage(image!);

    // Enregistrer l'image segmentée
    //File('assets/images/image_segmentée.jpg').writeAsBytesSync(
     //   encodeJpg(imageSegmentee));
    return imageSegmentee;
  }

  Image segmenterImage(Image image) {
    // Convertir l'image en une matrice de pixels
    List<List<int>> pixels = [];
    for (int i = 0; i < image.height; i++) {
      List<int> row = [];
      for (int j = 0; j < image.width; j++) {
        int pixel = image.getPixel(j, i);
        row.add(pixel);
      }
      pixels.add(row);
    }

    // méthode simple de seuillage en niveaux de gris
    int seuil = 128;
    for (int i = 0; i < image.height; i++) {
      for (int j = 0; j < image.width; j++) {
        int pixel = pixels[i][j];
        int rouge = getRed(pixel);
        int vert = getGreen(pixel);
        int bleu = getBlue(pixel);
        int gris = (rouge + vert + bleu) ~/ 3;
        if (gris > seuil) {
          pixels[i][j] = getColor(255, 255, 255); // blanc
        } else {
          pixels[i][j] = getColor(0, 0, 0); // noir
        }
      }
    }

    // Convertir la matrice segmentée en une image
    Image imageSegmentee = Image(image.width, image.height);
    for (int i = 0; i < image.height; i++) {
      for (int j = 0; j < image.width; j++) {
        int pixel = pixels[i][j];
        imageSegmentee.setPixel(j, i, pixel);
      }
    }

    // Retourner l'image segmentée
    return imageSegmentee;
  }
}