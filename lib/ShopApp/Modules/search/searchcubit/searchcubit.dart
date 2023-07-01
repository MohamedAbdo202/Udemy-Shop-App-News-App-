
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutttter/Graduation%20project/network/end_points.dart';
import 'package:flutttter/ShopApp/Modules/search/searchcubit/searchstats.dart';

import '../../../../Graduation project/Compenent/constant.dart';
import '../../../../Graduation project/network/remote/dio.dart';
import '../../../ShopAppModel/SearchModel.dart';

class SearchCubit extends Cubit<SearchStates>{
  SearchCubit(initialState) : super(ShopSearchInitialState());
  static SearchCubit get(context)=>BlocProvider.of(context);
  late SearchModel searchModel;
  void getSearch(String text){
    emit(ShopSearchLoadingState());
    DioHelper.postData(
        url: SEARCH,
        token: token,
        data: {
          'text':text
        }).then((value) {
      searchModel=SearchModel.fromJson(value.data);
      emit(ShopSearchSuccessState(searchModel));
    }).catchError((error){
      print(error);
      emit(ShopSearchErrorState(error));
    });
  }
}