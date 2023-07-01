import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ShopCubit/Shopcubit.dart';
import '../../ShopCubit/shopstats.dart';
import '../search/search_screen.dart';


class HomeLogin extends StatelessWidget {
  const HomeLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStats>(
      listener: (context,state){},
      builder: (context,state){
        var cubit =ShopCubit.get(context);
        return Scaffold(
          appBar:AppBar(title: Text('Salla App'),
              actions: [
                IconButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchScreen ()));


                }, icon:Icon(Icons.search
                )),

              ]) ,
          bottomNavigationBar: BottomNavigationBar(items:cubit.bottomitemss,
              currentIndex: cubit.currentIndex,
              onTap: (index){
                cubit.changeBottom(index);
              }),
          body: cubit.bottomScreens[cubit.currentIndex],
        );

      },


    );
  }
}
