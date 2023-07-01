import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutttter/Graduation%20project/network/remote/dio.dart';
import 'package:flutttter/News%20App/states.dart';

import 'CubitMode.dart';
import 'Search/search.dart';
import 'cubit.dart';

class NEWSLAYOUT extends StatelessWidget {
  const NEWSLAYOUT({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Newscubit,NewStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit =Newscubit.get(context);
        DioHelper.init();
        return Scaffold(
          appBar:AppBar(title: Text('News App'),
          actions: [
            IconButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchScreen()));


            }, icon:Icon(Icons.search
            )),
            IconButton(onPressed: (){
              Modecubit.get(context).changeAppMode();
            }, icon:Icon(Icons.brightness_4_outlined
            )),
          ]) ,
          bottomNavigationBar: BottomNavigationBar(items:cubit.bottomitems,
          currentIndex: cubit.currentindex,
          onTap: (index){
            cubit.changebottomnavbar(index);
          }),
          body: cubit.Screens[cubit.currentindex],
        );

      },


    );
  }
}
