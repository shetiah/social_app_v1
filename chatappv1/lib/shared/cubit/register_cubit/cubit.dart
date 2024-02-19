import 'dart:core';
import 'dart:io';

import 'package:chatappv1/layout/home_layout.dart';
import 'package:chatappv1/models/user_model.dart';
import 'package:chatappv1/shared/components/components/my_main_components.dart';
import 'package:chatappv1/shared/components/constants/const.dart';
import 'package:chatappv1/shared/cubit/register_cubit/states.dart';
import 'package:chatappv1/shared/network/local/cacheHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super((InitState()));

  static RegisterCubit get(context) => BlocProvider.of(context);

  var formRegisterKey = GlobalKey<FormState>();
  var nameRegisterController = TextEditingController();
  var emailRegisterController = TextEditingController();
  var passwordRegisterController = TextEditingController();
  var phoneRegisterController = TextEditingController();
  late File profileImageFile;
  var picker = ImagePicker();
  bool firstTime = true;

  Future<void> chooseProfilePhoto() async {
    emit(ProfileImagePickedLoadingState());
    try {
      final XFile? image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (image != null) {
        profileImageFile = File(image.path);
        print(image.path);
        await chooseProfileImageFireStorage();
        firstTime = false;
        emit(ProfileImagePickedSuccessState());
      } else {
        // print('No image selected.');
        emit(ProfileImagePickedErrorState('No image selected.'));
      }
    } catch (error) {
      emit(ProfileImagePickedErrorState(error.toString()));
    }
  }

  Future<void> chooseProfileImageOnFireStore(
      {required String imagePath}) async {
    try {
      emit(ProfileImageUploadFireStoreSuccessState());
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .update({'img': imagePath}).then((value) {
        userModel.img = imagePath;
        userImg=userModel.img;
        emit(ProfileImageUploadFireStoreSuccessState());
      });
    } catch (nError) {
      emit(ProfileImageUploadFireStoreErrorState(nError.toString()));
    }
  }

  Future<void> chooseProfileImageFireStorage() async {
    emit(ProfileImageUploadFireStoreLoadingState());
    // var imgFile=(profileImageFile==null)?
    await storageRef
        .child(
            'users/images/${Uri.file(profileImageFile.path).pathSegments.last}')
        .putFile(profileImageFile)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        chooseProfileImageOnFireStore(imagePath: value);
        emit(ProfileImageUploadFireStoreSuccessState());
      }).catchError((error) {
        emit(ProfileImageUploadFireStoreErrorState(error.toString()));
      });
    }).catchError((error) {
      emit(ProfileImageUploadFireStoreErrorState(error.toString()));
    });
  }

  getScreenWidth(context) {
    return MediaQuery.of(context).size.width;
  }

  getScreenHeight(context) {
    return MediaQuery.of(context).size.height;
  }

  int registerStage = 1;
  var Controller = TextEditingController();
  var formRegisterKey2 = GlobalKey<FormState>();

  bool result = false;

  Future<bool> isUserNameTaken(String username) async {
    bool isTaken = false;
    var y;
    int count = 0;
    emit(CheckingUNameLoading());
    await FirebaseFirestore.instance
        .collection('users')
        .where('userName', isEqualTo: username)
        .get()
        .then((x) {
      count = x.size;
      if (x.size > 0) {
        print(x.size);
        isTaken = true;
        y = x;
      }
    });
    print(count);
    emit(CheckingUserNameState());
    return (count > 0) ? true : false;
  }

  late String userEmail;
  late String userPassword;
  late String name;
  late String userName;
  String userImg = 'none';

  // bool F
  bool registered = false;

  Future<void> userRegister({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(RegisterLoadingState());

    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((v) {
        userCreate(
                uId: v.user!.uid,
                email: email,
                name: name,
                userName: 'none',
                img: userImg,
                coverImg: 'none',
                bio: 'none')
            .then((user) {
          CacheHelper.saveData(key: 'uId', value: v.user?.uid);
          uId = v.user!.uid;
          userModel = user;
          // registerStage = 2;
          registered = true;
          registerStage = 2;
          userEmail = email;
          userPassword = password;
          this.name = name;
          emit(RegisterFinishedState());
        });
      });
    } catch (nError) {
      registered = false;
      emit(RegisterErrorState(nError.toString()));
    }
  }

  Future<void> userRegisterUserName() async {
    emit(RegisterLoadingState());
    try {
      if (firstTime) {
        await chooseProfileImageOnFireStore(
            imagePath:
                'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?size=626&ext=jpg&ga=GA1.1.1408831830.1708179560&semt=ais');
      }
      // else{
      //   await chooseProfileImageFireStorage();
      // }

      await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .update({'userName': userName}).then((value) {
        userModel.userName = userName;
        emit(RegisterFinishedState());
      });
    } catch (nError) {
      emit(RegisterErrorState(nError.toString()));
    }
  }

  Future<UserModel> userCreate(
      {required String uId,
      required String email,
      required String name,
      required String userName,
      required String img,
      required String coverImg,
      required String bio}) async {
    emit(UserCreationLoadingState());
    UserModel model = UserModel(name, email, uId, userName, img, coverImg, bio);
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .set(model.toMap());
      emit(UserCreationFinishedState());
    } catch (error) {
      emit(UserCreationErrorState(error.toString()));
    }
    return model;
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ChangePasswordVisibility());
  }
}
