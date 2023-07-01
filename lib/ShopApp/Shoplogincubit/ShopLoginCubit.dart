import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../Graduation project/network/end_points.dart';
import '../../Graduation project/network/remote/dio.dart';
import '../ShopAppModel/ModelshopLogin.dart';
import 'ShopLoginStats.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>{
  ShopLoginCubit(initialState) : super(ShopLoginInitialState());
  static ShopLoginCubit get(context)=>BlocProvider.of(context);
  late ShopLoginModel  loginModel;

  void userLogin({
    required String email,
    required String password
  }){
    emit(ShopLoginLoadingState());
    DioHelper.postData(
        lang: 'en',
        token: '',
        url: LOGIN,
        data: {
          'email':email,
          'password':password,
        }).then((value) {
      loginModel= ShopLoginModel.formJson(value.data);
      print(loginModel.status);
      emit(ShopLoginSuccessState(loginModel));
    }).catchError((error){
      print(error.toString());
      emit(ShopLoginErrorState(error.toString()));
    });
  }

  IconData suffix=Icons.visibility_outlined;
  bool isPassword=false;
  void changePasswordVisibility()
  {
    isPassword=!isPassword;
    suffix=isPassword ? Icons.visibility_outlined:Icons.visibility_off;
    emit(ShopLoginPasswordVisibility());
  }
}