import 'dart:io';

import 'package:chatappv1/models/post_model.dart';
import 'package:chatappv1/models/user_model.dart';
import 'package:chatappv1/modules/post_screen.dart';
import 'package:chatappv1/modules/profile_screen.dart';
import 'package:chatappv1/modules/user_home.dart';
import 'package:chatappv1/modules/users_search_screen.dart';
import 'package:chatappv1/shared/components/constants/const.dart';
import 'package:chatappv1/shared/cubit/app_cubit/states.dart';
import 'package:chatappv1/shared/network/local/cacheHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../modules/chats.dart';
import '../../../modules/login_screen.dart';
import '../../components/components/my_main_components.dart';
import '../../components/myWidgets/user_card.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super((InitState()));

  static AppCubit get(context) => BlocProvider.of(context);

  getScreenWidth(context) {
    return MediaQuery.of(context).size.width;
  }

  getScreenHeight(context) {
    return MediaQuery.of(context).size.height;
  }

  bool isBottomSheetShownPostScreen = false;
  var scaffoldKeyPostScreen = GlobalKey<ScaffoldState>();

  ScrollController listViewController = ScrollController();
  var bioTextFieldFocus = FocusNode();
  List<Widget> screens = [
    const UserHomeScreen(),
    const PostScreen(),
    const UsersScreen(),
    const ChatsScreen(),
    const ProfileScreen(),
  ];
  var controller = TextEditingController();
  List<Post> posts = [];
  int bottomNavIndex = 0;
  double width = 0;
  bool expands = true;

  // double containerSize=getScreenHeight(context) * .2;
  void bottomSheetPress() {
    // FirebaseFirestore.instance.collection('users').;
    expands = !expands;
    emit(BottomSheetPressed());
  }

// Widget defHomeWidget=cubit.bottomNavIndex==1? navigateTo(context,PostScreen()) :
  void changeIndex(index, context) {
    if (index == 1) {
      navigateTo(context, const PostScreen());
      emit(ChangeBottomToPostScreen());
    } else {
      bottomNavIndex = index;

      emit(ChangeBottomNavItems());
    }
  }

  late File profileImageFile;
  var picker = ImagePicker();

  Future<void> editProfilePhoto() async {
    emit(ProfileEditLoadingState());
    try {
      final XFile? image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (image != null) {
        profileImageFile = File(image.path);
        print(image.path);
       await updateProfileImageFireStorage();
        emit(ProfileEditSuccessState());
      } else {
        print('No image selected.');
        emit(ProfileEditErrorState());
      }
    } catch (error) {
      emit(ProfileEditErrorState());
    }
  }

  Future<void> updateProfileImageOnFireStore(
      {required String imagePath}) async {
    try {
      emit(ProfileUpdateLoadingState());
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .update({'img': imagePath}).then((value) {
        userModel.img = imagePath;
        emit(ProfileUpdateSuccessState());
      });
    } catch (nError) {
      emit(ProfileUpdateErrorState(nError.toString()));
    }
  }

  Future<void> updateProfileImageFireStorage() async {
    emit(UploadProfileImageOnStoreLoading());
   await storageRef
        .child(
            'users/images/${Uri.file(profileImageFile.path).pathSegments.last}')
        .putFile(profileImageFile)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        updateProfileImageOnFireStore(imagePath: value);
        emit(UploadProfileImageOnStoreSuccess());
      }).catchError((error) {
        emit(UploadProfileImageOnStoreError());
      });
    }).catchError((error) {
      emit(UploadProfileImageOnStoreError());
    });
  }

  late File coverImagePath;

  Future<void> editCoverPhoto() async {
    emit(CoverEditLoadingState());
    try {
      final XFile? image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (image != null) {
        coverImagePath = File(image.path);
        // userModel.coverImg = coverImagePath.path;
        // print(image.path);
        // await updateCoverImageOnFireStore();
        updateCoverImageOnFIreStorage();
        emit(CoverEditSuccessState());
      } else {
        print('No image selected.');
        emit(CoverEditErrorState());
      }
    } catch (error) {
      emit(CoverEditErrorState());
    }
  }

  Future<void> updateCoverImageOnFireStore({required imagePath}) async {
    try {
      emit(CoverUpdateLoadingState());
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .update({'coverImg': imagePath}).then((value) {
        userModel.coverImg = imagePath;
        emit(CoverUpdateSuccessState());
      });
    } catch (nError) {
      emit(CoverUpdateErrorState(nError.toString()));
    }
  }

  void updateCoverImageOnFIreStorage() {
    emit(UploadCoverImageOnStoreLoading());
    storageRef
        .child(
            'users/images/${Uri.file(coverImagePath.path).pathSegments.last}')
        .putFile(coverImagePath)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        updateCoverImageOnFireStore(imagePath: value);
        emit(UploadCoverImageOnStoreSuccess());
      }).catchError((error) {
        emit(UploadCoverImageOnStoreError());
      });
    }).catchError((error) {
      emit(UploadCoverImageOnStoreError());
    });
  }

  bool editingBio = false;
  Icon editingBioIcon = const Icon(Icons.edit);
  var bioEditingController = TextEditingController();

  Future<void> editBio(String bio) async {
    editingBio = !editingBio;

    if (editingBio) {
      bioTextFieldFocus.requestFocus();
      bioEditingController.text =
          (userModel.bio == 'none') ? 'This is your Bio..!' : userModel.bio;
      editingBioIcon = Icon(Icons.done_outline_rounded);
    } else {
      userModel.bio = bioEditingController.text;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .update({'bio': userModel.bio}).then((value) {
        editingBioIcon = Icon(Icons.edit);
        getUserData();
      });
    }
    emit(EditingBioChangeTextField());
  }

  // void editProfilePhoto() {}

  Future<void> signOut(context) async {
    emit(SignOutLoadingState());
    await FirebaseAuth.instance.signOut().then((value) {
      uId = '';
      cachedUid = '';
      CacheHelper.saveData(key: 'uId', value: '');
      navigateAndFinish(context, LoginScreen());
      emit(SignOutSuccessState());
    }).catchError((onError) {
      emit(SignOutErrorState(onError.toString()));
    });
  }

  void getUserData() {
    emit(GetUserLoadingState());
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .get()
          .then((value) {
        print(uId);
        if (value.data() == null) {
          CacheHelper.saveData(key: "uId", value: "");
          uId = "";
        } else {
          userModel = UserModel.fromJson(value.data());
        }
        emit(GetUserSuccessState());
      });
    } catch (error) {
      print(error.toString());
      emit(GetUserErrorState(error.toString()));
    }
  }

// var late allResults;
  List<UserCard> usersCards = [];
  TextEditingController searchController = TextEditingController();
  String searchedName = '';

  Future<void> searching(String v) async {
    usersCards = [];
    searchedName = v;
    var data = await FirebaseFirestore.instance
        .collection('users')
        .orderBy('name')
        .get();
    data.docs.forEach((element) {
      var userTemp = element.data();
      if (userTemp['name'].toString().startsWith(searchedName)) {
        usersCards.add(UserCard(
            name: userTemp['name'] as String,
            userName: userTemp['userName'] as String,
            imgUrl: userTemp['img'] as String));
      }
    });
    emit(NameSearchingState());
  }

  final storageRef = FirebaseStorage.instance.ref();
}
