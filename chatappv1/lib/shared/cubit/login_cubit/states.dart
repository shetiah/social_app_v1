abstract class LoginStates {}

class InitState extends LoginStates {}

class ChangePasswordVisibility extends LoginStates{}

class LoginLoadingState extends LoginStates{}
class LoginFinishedState extends LoginStates{}
class LoginErrorState extends LoginStates{
  final String error;
  LoginErrorState(this.error);
}