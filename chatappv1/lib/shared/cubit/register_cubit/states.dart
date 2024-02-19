abstract class RegisterStates {}

class InitState extends RegisterStates {}

class ChangePasswordVisibility extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterFinishedState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  final String error;
  RegisterErrorState(this.error);
}



class UserCreationFinishedState extends RegisterStates {}
class UserCreationLoadingState extends RegisterStates {}
class CheckingUserNameState extends RegisterStates {}
class CheckingUNameLoading extends RegisterStates {}
class ProfileImagePickedSuccessState extends RegisterStates {}
class ProfileImagePickedLoadingState extends RegisterStates {}
class ProfileImagePickedErrorState extends RegisterStates {
  final String error;
  ProfileImagePickedErrorState(this.error);
}class ProfileImageUploadFireStoreSuccessState extends RegisterStates {}
class ProfileImageUploadFireStoreLoadingState extends RegisterStates {}
class ProfileImageUploadFireStoreErrorState extends RegisterStates {
  final String error;
  ProfileImageUploadFireStoreErrorState(this.error);
}class ProfileImageUploadedFireStorageSuccessState extends RegisterStates {}
class ProfileImageUploadedFireStorageLoadingState extends RegisterStates {}
class ProfileImageUploadedFireStorageErrorState extends RegisterStates {
  final String error;
  ProfileImageUploadedFireStorageErrorState(this.error);
}
class UserCreationErrorState extends RegisterStates {
  final String error;
  UserCreationErrorState(this.error);
}

