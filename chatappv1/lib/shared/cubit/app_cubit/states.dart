abstract class AppStates {}

class InitState extends AppStates {}


class GetUserLoadingState extends AppStates {}

class GetUserSuccessState extends AppStates {}

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

class EditingBioChangeTextField extends AppStates{}
class NameSearchingState extends AppStates{}
class UploadProfileImageOnStoreLoading extends AppStates{}
class UploadProfileImageOnStoreSuccess extends AppStates{}
class UploadProfileImageOnStoreError extends AppStates{}
class UploadCoverImageOnStoreLoading extends AppStates{}
class UploadCoverImageOnStoreSuccess extends AppStates{}
class UploadCoverImageOnStoreError extends AppStates{}
class NameSearchingLoadingState extends AppStates{}
class FollowingSomebodyLoadingState extends AppStates{}
class FollowingSomebodySuccessState extends AppStates{}
class UnFollowingSomebodySuccessState extends AppStates{}
class UnFollowingSomebodyLoadingState extends AppStates{}
class RemovedFriendState extends AppStates{}
class GetMyFollowingListSuccessState extends AppStates{}
class GetMyFollowingListLoadingState extends AppStates{}