import 'package:chatappv1/models/post_model.dart';
import 'package:chatappv1/models/user_model.dart';
import 'package:chatappv1/modules/post.dart';
import 'package:chatappv1/modules/settings.dart';
import 'package:chatappv1/modules/user_home.dart';
import 'package:chatappv1/modules/users.dart';
import 'package:chatappv1/shared/components/constants/const.dart';
import 'package:chatappv1/shared/cubit/app_cubit/states.dart';
import 'package:chatappv1/shared/network/local/cacheHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../modules/chats.dart';
import '../../../modules/login_screen.dart';
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
var listViewController=ScrollController();
  List<Widget> screens = [
    const UserHomeScreen(),
    const PostScreen(),
    const UsersScreen(),
    const ChatsScreen(),
    const SettingsScreen(),
  ];

List<Post> posts=[];
  int bottomNavIndex = 0;
  double width=0;

  void changeIndex(index,context) {
    bottomNavIndex = index;
    // if(bottomNavIndex==3)
    //   {
    //     width=getScreenWidth(context) * .333;
    //   }
    // else{
    //   width=AppCubit.get(context).getScreenWidth(context) * .27;
    // }
    emit(ChangeBottomNavItems());
  }

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
          // came=true;
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
}
