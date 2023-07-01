//
// import 'package:conditional_builder/conditional_builder.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutttter/modules/login/Login.dart';
//
//
// import '../../Graduation project/CubitReg/CubitReg.dart';
// import '../../Graduation project/CubitReg/statereg.dart';
// import '../../Shared/components/components.dart';
//
// class salahRegisterScreen extends StatefulWidget {
//   @override
//   State<salahRegisterScreen> createState() => _salahRegisterScreenState();
// }
//
// class _salahRegisterScreenState extends State<salahRegisterScreen> {
//   var formKey = GlobalKey<FormState>();
//
//   var nameController = TextEditingController();
//
//   var emailController = TextEditingController();
//
//   var passwordController = TextEditingController();
//
//   var ConfimPassword = TextEditingController();
//
//
//   bool isPassword = true;
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => SocialRegisterCubit(),
//       child: BlocConsumer<SocialRegisterCubit, SocialRegisterStates>(
//         listener: (context, state) {
//           if (state is SocialCreateUserSuccessState) {
//             // Navigator.of(context).push(MaterialPageRoute(builder: (context) => SocialLayout()));
//
//
//           }
//         },
//         builder: (context, state) {
//           return Container(
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.8),
//
//
//
//               image: DecorationImage(
//                 fit: BoxFit.cover,
//                 colorFilter: ColorFilter.mode(CupertinoColors.activeOrange.withOpacity(0.3), BlendMode.lighten),
//
//
//                 // repeat: ImageRepeat.repeat,
//
//                 image: AssetImage('assets/images/sgw.png'),
//
//               ),
//
//             ),
//             child: Scaffold(
//               appBar: AppBar(),
//               body: Center(
//                 child: SingleChildScrollView(
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Form(
//                       key: formKey,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Image(image:AssetImage('assets/images/sga.png'),)
//
//                           ,SizedBox(
//                             height: 7.0.h,
//                           ),
//                           defaultFormField22(
//                             controller: nameController,
//                             type: TextInputType.name,
//                             validator: ( value)
//                             {
//                               if(value== null || value.isEmpty)
//                               {
//                                 return 'name must not be empty';
//                               }
//
//                               return null;
//                             },
//                             label: 'User Name',
//                             prefix: Icons.person,
//                           ),
//                           SizedBox(
//                             height: 15.0.h,
//                           ),
//                           defaultFormField22(
//                             controller: emailController,
//                             type: TextInputType.emailAddress,
//                             validator: ( value)
//                             {
//                               if(value== null || value.isEmpty)
//                               {
//                                 return 'email must not be empty';
//                               }
//
//                               return null;
//                             },
//                             label: 'Email Address',
//                             prefix: Icons.email_outlined,
//                           ),
//                           SizedBox(
//                             height: 15.0.h,
//                           ),
//                           defaultFormField22(
//                             controller: passwordController,
//                             label: 'Password',
//                             prefix: Icons.lock,
//                             suffix: isPassword ? Icons.visibility : Icons.visibility_off,
//
//                             isPassword: SocialRegisterCubit.get(context).isPassword,
//                             suffixPressed: () {
//                               SocialRegisterCubit.get(context)
//                                   .changePasswordVisibility();
//                             },
//                             type: TextInputType.visiblePassword,
//                             validator: ( value)
//                             {
//                               if(value== null || value.isEmpty)
//                               {
//                                 return 'password must not be empty';
//                               }
//
//                               return null;
//                             },
//                           ),
//                           SizedBox(
//                             height: 15.0.h,
//                           ),
//                           defaultFormField22(
//                             controller: ConfimPassword,
//                             label: 'Password',
//                             prefix: Icons.lock,
//                             suffix: isPassword ? Icons.visibility : Icons.visibility_off,
//
//                             isPassword: SocialRegisterCubit.get(context).isPassword,
//                             suffixPressed: () {
//                               SocialRegisterCubit.get(context)
//                                   .changePasswordVisibility();
//                             },
//                             type: TextInputType.visiblePassword,
//                             validator: ( value)
//                             {
//                               if(value== null || value.isEmpty)
//                               {
//                                 return 'password must not be empty';
//                               }
//
//                               return null;
//                             },
//                           ),
//                           SizedBox(
//                             height: 15.0.h,
//                           ),
//
//
//                           SizedBox(
//                             height: 30.0.h,
//                           ),
//                           ConditionalBuilder(
//                             condition: state is! SocialRegisterLoadingState,
//                             builder: (context) => defaultButton22(
//                               function: () {
//                                 if (formKey.currentState!.validate()) {
//                                   SocialRegisterCubit.get(context).userRegister(
//                                       name: nameController.text,
//                                       email: emailController.text,
//                                       password: passwordController.text,
//
//                                   );
//                                 }
//                               },
//                               text: 'register',
//                               isUpperCase: true,
//                             ),
//                             fallback: (context) =>
//                                 Center(child: CircularProgressIndicator()),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }