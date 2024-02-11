abstract class AppStates {}

class InitState extends AppStates{}


class GetUserLoadingState extends AppStates {}

class GetUserSuccessState extends AppStates {}

class GetUserErrorState extends AppStates
{
  final String error;

  GetUserErrorState(this.error);
}
class SignOutLoadingState extends AppStates {}

class SignOutSuccessState extends AppStates {}

class SignOutErrorState extends AppStates
{
  final String error;

  SignOutErrorState(this.error);
}

// class ReachScreen extends AppStates {}
class ChangeBottomNavItems extends AppStates{}

