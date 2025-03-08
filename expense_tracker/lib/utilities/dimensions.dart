import 'package:get/get.dart';

class Dimensions { 

  static double screenHeight = Get.context!.height; //778.4000244140625
  static double screenWidth = Get.context!.width; //500

  //height
  static double height10 = screenHeight / 75.44000244140625;
  static double height12 = screenHeight / 64.86666870117188;
  static double height15 = screenHeight / 51.893335978190104;
  static double height16 = screenHeight / 48.65000152587891;
  static double height20 = screenHeight / 38.920001220703125;
  static double height30 = screenHeight / 25.94666748046875;
  static double height35 = screenHeight / 22.24000069754464;
  static double height40 = screenHeight / 19.460000610351562;
  static double height50 = screenHeight / 15.56800048828125;
  static double height55 = screenHeight / 14.15272726254659;
  static double height80 = screenHeight / 9.730000305175781;
  static double height300 = screenHeight / 2.594666748046875;
  static double height700 = screenHeight / 1.112571463759512;

  //width
  static double width10 = screenWidth / 50;
  static double width15 = screenWidth / 33.333333333333336;
  static double width16 = screenWidth / 31.25;
  static double width20 = screenWidth / 25;
  static double width50 = screenWidth / 10;
  static double width80 = screenWidth / 6.25;

  //radius
  static double radius15 = screenHeight / 51.893335978190104;
  static double radius20 = screenHeight / 38.920001220703125;

  //listview image
  static double listViewImgSize = screenWidth / 7.784000244140625;
  static double listViewTextContainerSize = screenWidth / 5;

  //fontsizes
  static double font10 = screenHeight / 77.84;
  static double font16 = screenHeight / 48.65000152587891;
  static double font18 = screenHeight / 43.24444580078125;

  //iconsize
  static double iconSize5 = screenHeight / 155.6800048828125;
}