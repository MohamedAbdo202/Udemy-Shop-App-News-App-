
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutttter/News%20App/modules/module.bussiness/BussinesScreen.dart';
import 'package:flutttter/News%20App/modules/module.sport/SportScreen.dart';
import 'package:flutttter/News%20App/modules/moudle.sceince/ScienceScreen.dart';
import 'package:flutttter/News%20App/states.dart';


class Newscubit extends Cubit<NewStates> {
  Newscubit() :super(Newinitstates());

  static Newscubit get(context) => BlocProvider.of(context);


  int currentindex = 0;
  List<BottomNavigationBarItem>bottomitems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.business,),
        label: 'Business'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports,),
        label: 'Sports'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.science,),
        label: 'Science'
    ),
    // BottomNavigationBarItem(
    //     icon: Icon(Icons.settings,),
    //     label: 'Setting'
    // )

  ];


  List<Widget>Screens = [
    BussinesScreen(),
    SportScreen(),
    ScienceScreen(),
    // SettingScreen()
  ];

  void changebottomnavbar(int index) {
    currentindex = index;
    if(index==1)
      getSport();
    if(index==2)
      getScience();
    emit(bottomstates());
  }

  List<dynamic> articlesbusiness=[];
  void getBusiness() async {
    Dio dio = Dio();
    String url = 'https://newsapi.org/v2/top-headlines';
    String apiKey = 'e8f8c8958627446895800541288ba635';

    try {
      emit(NewGetBusinessloadingState());
      Response response = await dio.get(url, queryParameters: {
        'country': 'us',
        'category': 'business',
        'apiKey': apiKey,
      });

      if (response.statusCode == 200) {
        emit(NewGetBusinessSuccesState());
        articlesbusiness = response.data['articles'];

        // Print the titles of the articles
        for (var article in articlesbusiness) {
          print(article['title']);
        }
      } else {
        print('Request failed with status code ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
      emit(NewGetBusinessErrorState(error.toString()));

    }
  }
  List<dynamic> articlesSports=[];

  void getSport() async {
    Dio dio = Dio();
    String url = 'https://newsapi.org/v2/top-headlines';
    String apiKey = 'e8f8c8958627446895800541288ba635';

    if(articlesSports.length==0){
      try {
        emit(NewGetSportsloadingState());
        Response response = await dio.get(url, queryParameters: {
          'country': 'us',
          'category': 'sport',
          'apiKey': apiKey,
        });

        if (response.statusCode == 200) {
          articlesSports = response.data['articles'];
          emit(NewGetSportsSuccesState());
          // Print the titles of the articles
          for (var article in articlesSports) {
            print(article['title']);
          }
        } else {
          print('Request failed with status code ${response.statusCode}');
        }
      } catch (error) {
        print('Error: $error');
        emit(NewGetSportsErrorState(error.toString()));

      }
    }else{
      emit(NewGetSportsSuccesState());
    }

  }
  List<dynamic> articlesScience=[];

  void getScience() async {
    Dio dio = Dio();
    String url = 'https://newsapi.org/v2/top-headlines';
    String apiKey = 'e8f8c8958627446895800541288ba635';

    if(articlesScience.length==0){
      try {
        emit(NewGetScienceloadingState());
        Response response = await dio.get(url, queryParameters: {
          'country': 'us',
          'category': 'science',
          'apiKey': apiKey,
        });

        if (response.statusCode == 200) {
          articlesScience = response.data['articles'];
          emit(NewGetScienceSuccesState());
          // Print the titles of the articles
          for (var article in articlesScience) {
            print(article['title']);
          }
        } else {
          print('Request failed with status code ${response.statusCode}');
        }
      } catch (error) {
        print('Error: $error');
        emit(NewGetScienceErrorState(error.toString()));

      }
    }else{
      emit(NewGetScienceSuccesState());
    }

    }
  List<dynamic> articleSearch=[];

  void getSearch( String value) async {

    Dio dio = Dio();
    String url = 'https://newsapi.org/v2/everything';
    String apiKey = 'e8f8c8958627446895800541288ba635';


      try {
        emit(NewGetSearchloadingState());

        Response response = await dio.get(url, queryParameters: {
          'q': '$value',
          'apiKey': apiKey,
        });

        if (response.statusCode == 200) {
          articleSearch = response.data['articles'];
          emit(NewGetSearchSuccesState());
          // Print the titles of the articles
          for (var article in articleSearch) {
            print(article['title']);
          }
        } else {
          print('Request failed with status code ${response.statusCode}');
        }
      } catch (error) {
        print('Error: $error');
        emit(NewGetSearchErrorState(error.toString()));

      }
    }





}