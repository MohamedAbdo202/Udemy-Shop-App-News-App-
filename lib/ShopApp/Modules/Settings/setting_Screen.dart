
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutttter/Graduation%20project/network/local/cache_helper.dart';

import '../../../Shared/components/components.dart';
import '../../ShopCubit/Shopcubit.dart';
import '../../ShopCubit/shopstats.dart';
import '../login/ShopLoginPage.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    var nameController=TextEditingController();
    var emailController=TextEditingController();
    var phoneController=TextEditingController();
    var formKey=GlobalKey<FormState>();
    return BlocConsumer<ShopCubit,ShopStats>(
      listener:(context,state){
        if(state is ShopSuccessUpdateDataState){
          showToast(text: 'User Information Updated Successfully ',
              state: ToastState.Success
          );
        }
        if(state is ShopErrorUpdateDataState){
          showToast(text: 'User Information don\'t Updated',
              state: ToastState.Success
          );
        }
      } ,
      builder:(context,state){
        var model=ShopCubit.get(context).userData;
        if(model !=null){
          nameController.text=model.data!.name !;
          phoneController.text=model.data!.phone!;
          emailController.text=model.data!.email!;
          print(nameController.text+' new one 2');
        }
        return ConditionalBuilder(
          condition: ShopCubit.get(context).userData !=null,
          builder: (context)=>Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    if(state is ShopLoadingUpdateDataState)
                      LinearProgressIndicator(),
                    SizedBox(
                      height: 20,),
                    defaultFormField(
                        onTap: (){},
                        onChanged: (value){print(value);},

                        controller: nameController,
                        type: TextInputType.name,
                        validator: ( value)
                        {
                          if(value== null || value.isEmpty)
                          {
                            return 'name must not be empty';
                          }

                          return null;
                        },
                        label: 'Name',
                        prefix: Icons.person
                    ),
                    SizedBox(
                      height: 20,
                    ),
                defaultFormField(
                        onTap: (){},
                    onChanged: (value){print(value);},
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validator: ( value)
                        {
                          if(value== null || value.isEmpty)
                          {
                            return 'email  must not be empty';
                          }

                          return null;
                        },
                        label: 'Email',
                        prefix: Icons.email
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultFormField(
                        onTap: (){},
                        onChanged: (value){print(value);},
                        controller: phoneController,
                        type: TextInputType.phone,
                        validator: ( value)
                        {
                          if(value== null || value.isEmpty)
                          {
                            return 'phone  must not be empty';
                          }

                          return null;
                        },
                        label: 'Phone',
                        prefix: Icons.phone
                    ), 
                    SizedBox(
                      height: 20,
                    ),
                    defaultButton(text: 'Update',function:  ()
                    {
                      if(formKey.currentState!.validate())
                      {
                        ShopCubit.get(context).updateUserData(
                          name: nameController.text,
                          phone: phoneController.text,
                          email: emailController.text,
                        );
                        print(nameController.text+' new one');
                      }
                    },
                        ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultButton( text: 'Logout', function: (){
                      CacheHelper.removeData(key: 'token');

                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShopLoginScreen ()));

                    }),

                  ],
                ),
              ),
            ),
          ),
          fallback: (context)=>Center(child: CircularProgressIndicator()),
        );
      } ,
    );
  }
}
