import 'package:chatappv1/models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
final storageRef = FirebaseStorage.instance.ref();
final Color defaultColor= const Color.fromARGB(200, 43, 49, 162).withOpacity(0.8);
