import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutttter/Graduation%20project/network/end_points.dart';
import 'package:flutttter/ShopApp/Modules/Settings/setting_Screen.dart';
import 'package:flutttter/ShopApp/Modules/categories/categories_screen.dart';
import 'package:flutttter/ShopApp/Modules/favourite/favourite_screen.dart';
import 'package:flutttter/ShopApp/Modules/products/product_screen.dart';
import 'package:flutttter/ShopApp/ShopCubit/shopstats.dart';

import '../../Graduation project/Compenent/constant.dart';
import '../../Graduation project/network/remote/dio.dart';
import '../ShopAppModel/CategoriesModel.dart';
import '../ShopAppModel/ChangeFavouriteModel.dart';
import '../ShopAppModel/FavouriteModel.dart';
import '../ShopAppModel/HomeModel.dart';
import '../ShopAppModel/ModelshopLogin.dart';

class ShopCubit extends Cubit<ShopStats>
{
  ShopCubit(): super(ShopInitialStats());
  static ShopCubit get(context)=> BlocProvider.of(context);


  int currentIndex=0;
  List<BottomNavigationBarItem>bottomitemss = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home,),
        label: 'Home'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.apps,),
        label: 'Categories'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.favorite,),
        label: 'Favourites'
    ),


    BottomNavigationBarItem(
        icon: Icon(Icons.settings,),
        label: 'Setting'
    )

  ];


  List<Widget>bottomScreens = [
    ProductScreen(),
    CategoryScreen(),
    FavouriteScreen(),
    SettingsScreen()
  ];
  void changeBottom(int index){
    currentIndex=index;
    emit(ShopBottomNavState());
  }
  HomeModel? homeModel;

  Map<int,bool>favourite= {};
  void getHomeData(){
    emit(ShopLoadingDataState());
    DioHelper.getData(
        path: HOME,
        token: token).then((value) {
      homeModel=HomeModel.fromJson(value.data);
      homeModel!.data.products.forEach((element) {
        favourite.addAll({element.id:element.favorites});
      });
      // printFullText(homeModel!.data.banners.toString());
      // print(homeModel!.status);
      // print(favourite);

      emit(ShopSuccessHomeDataState());
    }).
    catchError((error)
    {
      emit(ShopErrorHomeDataState());
      print(error.toString());
    });
  }


  CategoriesModel? categoriesModel;
  void getCategoriesData(){
    DioHelper.getData(
        path: GET_CATEGORIES,
        token: token).then((value) {
      categoriesModel=CategoriesModel.fromJson(value.data);
      emit(ShopSuccessCategoriesState());
    }).
    catchError((error)
    {
      emit(ShopErrorCategoriesState());
      print(error.toString());
    });
  }

  ChangeFavoritesModel? changeFavouritesModel;
  void changeFavourites(int productId)
  {
    favourite[productId] = !favourite[productId]!;
    emit( ShopChangeFavouritesState());
    DioHelper.postData(
        url: FAVORITES,
        data:{
          'product_id':productId
        } ,
        token: token
    ).then((value) {
      changeFavouritesModel=ChangeFavoritesModel.fromJson(value.data);
      if(!changeFavouritesModel!.status!){
        favourite[productId] = !favourite[productId]!;
      }else{
        getFavouriteData();
      }
      emit( ShopSuccessFavouritesState(changeFavouritesModel!));
    }).catchError((error){
      favourite[productId] = !favourite[productId]!;
      ShopErrorFavouritesState();
    });
  }

  FavouritesModel? favouritesModel;
  void getFavouriteData(){
    DioHelper.getData(
        path: FAVORITES,
        token: token).then((value) {
      emit(ShopLoadingGetFavouritesState());
      favouritesModel=FavouritesModel.fromJson(value.data);
      //  printFullText(value.data.toString());
      emit(ShopSuccessGetFavouritesState());
    }).
    catchError((error)
    {
      emit(ShopErrorGetFavouritesState());
      print(error.toString());
    });
  }

  ShopLoginModel? userData;
  void getUserData(){
    DioHelper.getData(
        path: PROFILE,
        token: token).then((value) {
      emit(ShopLoadingUserDataState());
      userData=ShopLoginModel.formJson(value.data);
      printFullText((userData!.data!.name)!);
      emit(ShopSuccessUserDataState(userData!));
    }).
    catchError((error)
    {
      print(error.toString());
      emit(ShopErrorUserDataState());

    });
  }

  void updateUserData({
    required String name,
    required String phone,
    required String email,

  }){
    DioHelper.putData(
        url: UPDATE_PROFILE,
        token: token,
        data: {
          'name':name,
          'phone':phone,
          'email':email
        }).then((value) {
      emit(ShopLoadingUpdateDataState());
      userData=ShopLoginModel.formJson(value.data);
      emit(ShopSuccessUpdateDataState(userData!));
      print('update is ok');
    }).
    catchError((error)
    {
      emit(ShopErrorUpdateDataState());
      print(error.toString());
    });
  }
}