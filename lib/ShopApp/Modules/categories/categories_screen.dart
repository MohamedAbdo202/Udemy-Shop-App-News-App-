import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Graduation project/Compenent/component.dart';
import '../../ShopAppModel/CategoriesModel.dart';
import '../../ShopCubit/Shopcubit.dart';
import '../../ShopCubit/shopstats.dart';


class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStats>(
      listener: (context,state){},
      builder: (context,state)=>ListView.separated(
          physics: BouncingScrollPhysics() ,
          itemBuilder: (context,index)=>catList(ShopCubit.get(context).categoriesModel!.data.data[index]),
          separatorBuilder:(context,index)=> dividerWidget(),
          itemCount: ShopCubit.get(context).categoriesModel!.data.data.length),
    );
  }
  Widget catList(DataModel model)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Image(
          image: NetworkImage(model.image),
          height: 80,
          width: 80,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 40,),
        Text(
          model.name,
          style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 20
          ),
        ),
        Spacer(),
        IconButton(onPressed: (){},
            icon: Icon(Icons.arrow_forward_ios))
      ],
    ),
  );
}
