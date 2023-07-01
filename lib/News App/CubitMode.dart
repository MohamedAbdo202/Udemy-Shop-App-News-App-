import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutttter/Graduation%20project/network/local/cache_helper.dart';

import 'CubitStats.dart';

class Modecubit extends Cubit<ModeStats> {
  Modecubit() :super(Newinitstates());
  static Modecubit get(context) => BlocProvider.of(context);

  ThemeMode appMode =ThemeMode.dark;
  bool isDark=false;
  void changeAppMode({ bool? fromshared}){
    if(fromshared!= null) {
      isDark = fromshared;
      emit(AppChangeModeStats());

    }else{
    isDark= !isDark;
    CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
      emit(AppChangeModeStats());
    }
    );};
}

}