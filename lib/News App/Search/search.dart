import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutttter/News%20App/cubit.dart';
import 'package:flutttter/News%20App/states.dart';
import 'package:flutttter/Shared/components/components.dart';

import '../../modules/login/Login.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Newscubit, NewStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list3 = Newscubit.get(context).articleSearch;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: defaultFormField(
                  controller: searchController,
                  onChanged: (value) {
                    Newscubit.get(context).getSearch(value);
                  },
                  type: TextInputType.text,
                  label: 'Search',
                  prefix: Icons.search,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Search must not be empty.';
                    }
                    return null;
                  },
                ),
              ),
              Expanded(child: aritcleBuilder(list3,isSearch: true,))
            ],
          ),
        );
      },
    );
  }
}
