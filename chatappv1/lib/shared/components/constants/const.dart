import 'package:chatappv1/models/user_model.dart';
import 'package:flutter/material.dart';

getHeight(context) {
  return MediaQuery.of(context).size.height;
}

getWidth(context) {
  return MediaQuery.of(context).size.width;
}
String ?cachedUid;

String ?uId;

Widget ?startScreen;

late UserModel userModel;