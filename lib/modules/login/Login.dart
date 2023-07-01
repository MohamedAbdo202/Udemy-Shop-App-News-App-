
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutttter/Graduation%20project/screens/student%20show.dart';
import '../../Graduation project/Compenent/constant.dart';
import '../../Graduation project/logincubit/logincubit.dart';
import '../../Graduation project/logincubit/loginstate.dart';
import '../../Graduation project/network/local/cache_helper.dart';
import '../../Shared/components/components.dart';

class loginScreeen   extends StatefulWidget {
  const loginScreeen({Key? key}) : super(key: key);


  @override
  State<loginScreeen> createState() => _loginScreeenState();
}

class _loginScreeenState extends State<loginScreeen>
{
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocialLoginCubit(),
      child: BlocConsumer<SocialLoginCubit, SocialLoginStates>(
        listener: (context, state) {
          if (state is SocialLoginErrorState) {
            showToast(
              text: state.error,
              state: ToastState.Error,
            );
          }
          if(state is SocialLoginSuccessState){

            CacheHelper.saveData(
              key: 'uId',
              value: state.uId,
            ).then((value)
            {
              uId=state.uId;


            });
          }},
        builder: (context, state) {


          return Container(

              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),



                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(CupertinoColors.activeOrange.withOpacity(0.3), BlendMode.lighten),


                  // repeat: ImageRepeat.repeat,

                  image: AssetImage('assets/images/sgw.png'),

                ),

              ),



              child: Scaffold(
                backgroundColor: Colors.transparent,

                //       appBar: AppBar(
                //     automaticallyImplyLeading: false,
                //
                //     elevation: 0,
                //
                // ),
                body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:
                          [Image(image:AssetImage('assets/images/sga.png'),),

                            SizedBox(
                              height: 5.0.h,
                            ),
                            defaultFormField22(
                              controller: emailController,
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
                            defaultFormField22(

                              controller: passwordController,
                              label: 'Password',
                              prefix: Icons.lock,
                              suffix: isPassword ? Icons.visibility : Icons.visibility_off,
                              isPassword: isPassword,
                              suffixPressed: ()
                              {
                                setState(()
                                {
                                  isPassword = !isPassword;
                                });
                              },
                              type: TextInputType.visiblePassword,
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
                              height: 20.0.h,
                            ),
                            ConditionalBuilder(
                              condition: state is! SocialLoginLoadingState,
                              builder: (context) => defaultButton22(
                                background:CupertinoColors.activeOrange.withOpacity(.3),
                                function: ()
                                {
                                  if (formKey.currentState!.validate()) {
                                    SocialLoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
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
                            Row(
mainAxisAlignment: MainAxisAlignment.center,
                                children:[ Text('Dont have Account?'),TextButton(onPressed: (){},
                                    child: Text('Sign Up',style: TextStyle(color:CupertinoColors.activeOrange ),)
                                )])
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


Widget defaultFormField22({

  required TextEditingController controller,
  required TextInputType type,
  required String label,
  bool isPassword = false,
  bool isClickable = true,
  int? maxLength,


  void Function(String)? onSubmit,
  void Function(String)? onChanged,
  void Function()? onTap,
  String? Function(String?)? validator,
  required IconData prefix,
  IconData? suffix,
  void Function()? suffixPressed,
}) =>
    TextFormField(
      maxLength: maxLength,


      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,cursorColor: Colors.black,

      onFieldSubmitted: onSubmit,
      onChanged: onChanged,
      onTap: onTap ,style: TextStyle(color: Colors.black),
      validator: validator,
      decoration: InputDecoration(
        fillColor: CupertinoColors.activeOrange.withOpacity(0.3),
        filled: true,

        labelText: label,
        prefixIcon: Icon(color: Colors.black,
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(color: Colors.black,
          onPressed: (){
            suffixPressed!();
          },
          icon: Icon(color: Colors.black,
            suffix,
          ),
        )
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        labelStyle: TextStyle(color: Colors.black),

      ),
    );


Widget defaultButton22({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0.h,
      child: MaterialButton(
        onPressed: (){
          function();
        },
        child: Padding(padding: EdgeInsets.symmetric(horizontal:16 ),
          child: Text(
            isUpperCase ? text.toUpperCase() : text,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );