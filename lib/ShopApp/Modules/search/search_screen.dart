import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutttter/ShopApp/Modules/search/searchcubit/searchcubit.dart';
import 'package:flutttter/ShopApp/Modules/search/searchcubit/searchstats.dart';

import '../../../Graduation project/Compenent/component.dart';
import '../../../Shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  var searchController=TextEditingController();
  var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>SearchCubit(ShopSearchInitialState()),
      child: BlocConsumer<SearchCubit,SearchStates>(
        listener: (context,state){},
        builder: (context,state){
          return  Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    defaultFormField(
                        controller: searchController,
                        type: TextInputType.text,
                    validator: ( value)
                    {
                      if(value== null || value.isEmpty)
                      {
                        return 'Search must not be empty';
                      }

                      return null;
                    },
                        label: 'Search',
                        prefix: Icons.search,
                        onTap: (){},
                        onChanged: (value){},
                        onSubmit: (value){
                          if(formKey.currentState!.validate())
                          {
                            SearchCubit.get(context).getSearch(searchController.text);
                          }
                        }
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    if(state is ShopSearchLoadingState)
                      LinearProgressIndicator(),
                    SizedBox(
                      height: 20,
                    ),
                    if(state is ShopSearchSuccessState)
                      Expanded(
                        child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) => buildProductItems(SearchCubit.get(context).searchModel.data!.data[index], context,inSearch: false),
                            separatorBuilder: (context, index) => dividerWidget(),
                            itemCount: SearchCubit.get(context).searchModel.data!.data.length),
                      ),
                  ],
                ),
              ),
            ),
          )  ;
        },
      ),
    );
  }
}
