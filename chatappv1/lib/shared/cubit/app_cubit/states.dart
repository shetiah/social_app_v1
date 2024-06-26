import 'dart:io';

import '../../../models/user_model.dart';

abstract class AppStates {}

class InitState extends AppStates {}

class GetUserLoadingState extends AppStates {}

class GetUserSuccessState extends AppStates {}

class ValidatePostPossibilityState extends AppStates {}

class GetUserErrorState extends AppStates {
  final String error;

  GetUserErrorState(this.error);
}

class SignOutLoadingState extends AppStates {}

class SignOutSuccessState extends AppStates {}

class SignOutErrorState extends AppStates {
  final String error;

  SignOutErrorState(this.error);
}

// class ReachScreen extends AppStates {}
class ChangeBottomNavItems extends AppStates {}

class ChangeBottomToPostScreen extends AppStates {}

class BottomSheetPressed extends AppStates {}

class CoverEditLoadingState extends AppStates {}

class CoverEditSuccessState extends AppStates {}

class CoverEditErrorState extends AppStates {}

class ProfileEditLoadingState extends AppStates {}

class ProfileEditSuccessState extends AppStates {}

class ProfileEditErrorState extends AppStates {}

class ProfileUpdateLoadingState extends AppStates {}

class ProfileUpdateSuccessState extends AppStates {}

class ProfileUpdateErrorState extends AppStates {
  final String error;

  ProfileUpdateErrorState(this.error);
}

class CoverUpdateLoadingState extends AppStates {}

class CoverUpdateSuccessState extends AppStates {}

class CoverUpdateErrorState extends AppStates {
  final String error;

  CoverUpdateErrorState(this.error);
}

class EditingBioChangeTextField extends AppStates {}

class NameSearchingState extends AppStates {}

class UploadProfileImageOnStoreLoading extends AppStates {}

class UploadProfileImageOnStoreSuccess extends AppStates {}

class UploadProfileImageOnStoreError extends AppStates {}

class UploadCoverImageOnStoreLoading extends AppStates {}

class UploadCoverImageOnStoreSuccess extends AppStates {}

class UploadCoverImageOnStoreError extends AppStates {}

class NameSearchingLoadingState extends AppStates {}

class FollowingSomebodyLoadingState extends AppStates {}

class FollowingSomebodySuccessState extends AppStates {}

class UnFollowingSomebodySuccessState extends AppStates {}

class UnFollowingSomebodyLoadingState extends AppStates {}

class RemovedFriendState extends AppStates {}

class GetMyFollowingListSuccessState extends AppStates {}

class GetMyFollowingListLoadingState extends AppStates {}

class GetAnyUserListsLoadingState extends AppStates {}

class GetAnyUserListsSuccessState extends AppStates {
  final UserModel model;

  GetAnyUserListsSuccessState(this.model);
}


class UploadImageOnPostSuccess extends AppStates{
final File imgFile;

  UploadImageOnPostSuccess({required this.imgFile});

}
class UploadImageOnPostLoading extends AppStates{
}

class UploadImageOnPostSuccessFirebaseStorage extends AppStates{
  final String? imgPath;

  UploadImageOnPostSuccessFirebaseStorage({required this.imgPath});

}
class UploadImageOnPostLoadingFirebaseStorage extends AppStates{

}