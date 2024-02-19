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
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../modules/chats.dart';
import '../../../modules/login_screen.dart';
import '../../../Widgets/user_card.dart';
import '../../components/components/my_main_components.dart';

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
        if (value.data() == null) {
          print('value.data() == null');
          CacheHelper.saveData(key: "uId", value: "");
          uId = "";
        } else {
          // CacheHelper.saveData(key: "uId", value: "");
          // uId = ;
          print(uId);
          userModel = UserModel.fromJson(value.data());
          // userModel.followingList.addAll({});
          getMyFollowingList().then((value) {
            emit(GetUserSuccessState());
          });
        }
        emit(GetUserSuccessState());
      });
    } catch (error) {
      print(error.toString());
      emit(GetUserErrorState(error.toString()));
    }
  }

  Future<void> getMyFollowingList() async {
    emit(GetMyFollowingListLoadingState());
    userModel.followingList = {};
    var usersCollection =  FirebaseFirestore.instance.collection('users');
    var userDoc = await usersCollection.doc(userModel.uId).get();
    var data = userDoc.data();
    print( data?['following-list'].runtimeType);
    print(data?['following-list']);
    // print( data?['following-list'].);
    List<dynamic> tempList = data?['following-list'];
    for (var uId in tempList) {
      print('xxxxxxxxxxxxxxx');
     UserModel tempUser =await getAnyUser(uId);
      userModel.followingList.addAll({
        uId:tempUser
      });
    }
    print(userModel.followingList.length);
    emit(GetMyFollowingListSuccessState());
  }

  Future<UserModel> getAnyUser(String uid) async {
    var usersCollection =  FirebaseFirestore.instance.collection('users');
    var userDoc = await usersCollection.doc(userModel.uId).get();

    return UserModel.fromJson(userDoc.data());
  }

// var late allResults;
  List<UserCard> usersCards = [];
  TextEditingController searchController = TextEditingController();
  String searchedName = '';

  Future<void> searching() async {
    usersCards = [];
    emit(NameSearchingLoadingState());
    // usersCards = [];
    // if(searchController.text.isEmpty) {
    //   emit(NameSearchingState());
    //   return;
    // }
    // emit(NameSearchingLoadingState());
    searchedName = searchController.text;
    var data = await FirebaseFirestore.instance
        .collection('users')
        .orderBy('name')
        .get();
    for (var element in data.docs) {
      var userTemp = element.data();
      if (userTemp['name'].toString().startsWith(searchController.text)) {
        UserModel model = UserModel.fromJson(userTemp);
        var temp = UserCard(model: model);

        if (usersCards.contains(temp)) {
          continue;
        }
        usersCards.add(temp);
      }
    }

    emit(NameSearchingState());
  }

  Future<void> followUser(UserModel followingUser) async {
    emit(FollowingSomebodyLoadingState());
    userModel.followingList.addAll({followingUser.uId: followingUser});
   print(followingUser.uId);
   print( userModel.followingList.keys.toList());
    var usersCollection = FirebaseFirestore.instance.collection('users');
    var userDoc = usersCollection.doc(uId);
   await userDoc
        .update({'following-list':  userModel.followingList.keys.toList()});

    getMyFollowingList().then((value) {
      emit(FollowingSomebodySuccessState());
    });
  }

  Future<void> unfollowUser(UserModel followingUser) async {
    emit(FollowingSomebodyLoadingState());
    userModel.followingList.addAll({followingUser.uId: followingUser});
    var usersCollection = FirebaseFirestore.instance.collection('users');
    var userDoc = usersCollection.doc(followingUser.uId);
   await userDoc
        .update({'following-list': followingUser.followingList.keys.toList()});
    // var friendsCollection=userDoc.collection('friendsList');
    // friendsDoc.add({
    //   'followingUserId':followingUserId.uId
    // });
    // getMyFollowingList().then((value) {
      emit(FollowingSomebodySuccessState());
    // });
  }
}
