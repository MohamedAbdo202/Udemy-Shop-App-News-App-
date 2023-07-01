

import '../ShopAppModel/ModelshopLogin.dart';

abstract class ShopLoginStates{
}
class ShopLoginInitialState extends ShopLoginStates{}
class ShopLoginLoadingState extends ShopLoginStates{}
class ShopLoginSuccessState extends ShopLoginStates{
  final ShopLoginModel loginModel;

  ShopLoginSuccessState(this.loginModel);
}
class ShopLoginErrorState extends ShopLoginStates{
  final String error;
  ShopLoginErrorState(this.error);
}
class ShopLoginPasswordVisibility extends ShopLoginStates{}