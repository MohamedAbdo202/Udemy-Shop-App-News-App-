import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Shared/components/components.dart';
import '../../cubit.dart';
import '../../states.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Newscubit,NewStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list3= Newscubit.get(context).articlesSports;
        return aritcleBuilder(list3);
      },

    );
  }
}
