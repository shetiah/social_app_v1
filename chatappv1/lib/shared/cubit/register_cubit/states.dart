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
class TakeUserNameState extends RegisterStates {}
class ProfileImagePickedSuccessState extends RegisterStates {}
class ProfileImagePickedErrorState extends RegisterStates {}
class ProfileImagePickedLoadingState extends RegisterStates {}

class UserCreationErrorState extends RegisterStates {
  final String error;
  UserCreationErrorState(this.error);
}
