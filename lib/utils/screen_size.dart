import 'package:flutter/cupertino.dart';

double widthScreen(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double heightScreen(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
