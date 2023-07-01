import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutttter/News%20App/cubit.dart';
import 'package:flutttter/Shared/components/components.dart';

import '../../states.dart';

class BussinesScreen extends StatelessWidget {
  const BussinesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Newscubit,NewStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list3= Newscubit.get(context).articlesbusiness;
        return aritcleBuilder(list3);
      },

    );
  }
}
