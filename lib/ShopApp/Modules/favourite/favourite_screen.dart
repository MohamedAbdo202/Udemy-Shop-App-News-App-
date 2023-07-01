import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Graduation project/Compenent/component.dart';
import '../../../Shared/components/components.dart';
import '../../ShopCubit/Shopcubit.dart';
import '../../ShopCubit/shopstats.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStats>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: state is! ShopLoadingGetFavouritesState,
            builder: (context) => ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildProductItems(ShopCubit.get(context).favouritesModel!.data!.data[index].product, context),
                separatorBuilder: (context, index) => dividerWidget(),
                itemCount: ShopCubit.get(context).favouritesModel!.data!.data.length),
            fallback: (context) => Center(child: CircularProgressIndicator()
            ),
          );
        });
  }



}