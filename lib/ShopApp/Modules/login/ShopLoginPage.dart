import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutttter/Shared/components/components.dart';

import '../../../Graduation project/Compenent/constant.dart';
import '../../../Graduation project/network/local/cache_helper.dart';
import '../../Shoplogincubit/ShopLoginCubit.dart';
import '../home/HomeScreeen.dart';
import '../../Shoplogincubit/ShopLoginStats.dart';
import '../products/product_screen.dart';



class ShopLoginScreen extends StatelessWidget {
  var formKey=GlobalKey<FormState>();
  var emailControl=TextEditingController();
  var passwordControl=TextEditingController();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ShopLoginCubit(ShopLoginInitialState),
      child: BlocConsumer<ShopLoginCubit,ShopLoginStates>(
        listener:(context,state){
          if(state is ShopLoginSuccessState)
          {
            if(state.loginModel.status==true)
            {
              print(state.loginModel.message);
              print(state.loginModel.data!.token);
              CacheHelper.saveData(
                  key: 'token',
                  value:state.loginModel.data!.token
              ).then((value) {
                token=state.loginModel.data!.token!;
                showToast(text:(state.loginModel.message)! , state: ToastState.Success);


                Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeLogin ()));
                             });
            }
            else
            {
              showToast(text: (state.loginModel.message)!,
                  state: ToastState.Error);
              print(state.loginModel.message.toString()+'this is login error');

            }
          }

        } ,
        builder:(context,state){
          return Container(

              decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),



          image: DecorationImage(
            fit: BoxFit.cover ,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.lighten),


          // repeat: ImageRepeat.repeat,

          image: AssetImage('assets/images/aqw.jpg'),

          ),
          boxShadow: [
          BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 20,
          offset: Offset(0, 10,
          ),
          )],
          ),



          child: Scaffold(

            backgroundColor: Colors.transparent,


            appBar: AppBar(
              backgroundColor: Colors.white,
                automaticallyImplyLeading: false,

                elevation: 0,

            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      [
                        Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 40.0.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),
                        ),
                        SizedBox(
                          height: 40.0.h,
                        ),
                        defaultFormField(
                          controller: emailControl,
                          label: 'Email',
                          prefix: Icons.email,
                          type: TextInputType.emailAddress,
                          validator: ( value)
                          {
                            if(value== null || value.isEmpty)
                            {
                              return 'email must not be empty';
                            }

                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15.0.h,
                        ),
                        defaultFormField(

                          controller: passwordControl,
                          label: 'Password',
                          prefix: Icons.lock,
                          suffix: isPassword ? Icons.visibility : Icons.visibility_off,
                          isPassword: isPassword,
                          suffixPressed: ()
                          {
                            // setState(()
                            // {
                            //   isPassword = !isPassword;
                            // });
                          },
                          type: TextInputType.visiblePassword,
                          validator: ( value)
                          {
                            if(value== null || value.isEmpty)
                            {
                              return 'password must not be empty';
                            }

                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20.0.h,
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopLoginLoadingState,
                          builder: (context) => defaultButton(
                            background:Colors.lightBlueAccent,
                            function: ()
                            {
                              if (formKey.currentState!.validate()) {
                                ShopLoginCubit.get(context).userLogin(
                                  email: emailControl.text,
                                  password: passwordControl.text,
                                );
                              }
                            },
                            text: 'login',
                            isUpperCase: true,

                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 15.0.h,
                        ),
                        // Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // children: [
                        //
                        // TextButton(
                        // onPressed: () {},
                        // child: Text(
                        // 'Forget Password>>?!',
                        // ),
                        //
                        // //   FirebaseFirestore.instance.collection("users").doc( SocialLoginCubit.get(context).x).get().then((value) {
                        // //   print('hi');
                        // //
                        // //   String role = (value['role']);
                        // //   print('hi');
                        // //
                        // //   if(role=="ADMIN")
                        // //   {
                        // //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => SocialLayout()));
                        // //
                        // //   }else if(role=="USER")
                        // //   {
                        // //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => SocialLayout2()));
                        // //
                        // //   }
                        // //   });
                        // //
                        // // };
                        //
                        //
                        //
                        //
                        //
                        //
                        //
                        //
                        //
                        //
                        //
                        //
                        //
                        //
                        //
                        //
                        //
                        //
                        //
                        //
                        //
                        //
                        //
                        //         ),
                        // ],
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ));
        },
      ),
    );
  }
}