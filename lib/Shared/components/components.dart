import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../News App/modules/models.Webview/Webview.dart';
import '../../ShopApp/ShopCubit/Shopcubit.dart';
import '../cubit/cubit.dart';


Widget defaultButton({
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

Widget defaultFormField({

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
        fillColor: Colors.white,
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

Widget buildTaskItem(Map model, context) => Dismissible(
  key: Key(model['id'].toString()),
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 40.0,
          child: Text(
            '${model['time']}',
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${model['title']}',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${model['date']}',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
        IconButton(
          onPressed: ()
          {
            AppCubit.get(context).updateData(
              status: 'done',
              id: model['id'],
            );
          },
          icon: const Icon(
            Icons.check_box,
            color: Colors.green,
          ),
        ),
        IconButton(
          onPressed: () {
            AppCubit.get(context).updateData(
              status: 'archive',
              id: model['id'],
            );
          },
          icon: const Icon(
            Icons.archive,
            color: Colors.black45,
          ),
        ),
      ],
    ),
  ),
  onDismissed: (direction)
  {
    AppCubit.get(context).deleteData(id: model['id'],);
  },
);

Widget tasksBuilder({
  required List<Map> tasks,
}) => ConditionalBuilder(
  condition: tasks.length > 0,
  builder: (context) => ListView.separated(
    itemBuilder: (context, index)
    {
      return buildTaskItem(tasks[index], context);
    },
    separatorBuilder: (context, index) => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    ),
    itemCount: tasks.length,
  ),
  fallback: (context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.menu,
          size: 100.0,
          color: Colors.grey,
        ),
        const Text(
          'No Tasks Yet, Please Add Some Tasks',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  ),
);
void showToast({
  required String text,
  required ToastState state})=>  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0
);

enum ToastState{Success,Error,Warning}

Color chooseToastColor(ToastState state){
  Color color;
  switch(state){
    case ToastState.Success:
      color=Colors.green;
      break;
    case ToastState.Error:
      color=Colors.red;
      break;
    case ToastState.Warning:
      color=Colors.amber;
      break;
  }
  return color;
}
Widget buildArticleItems(article,context)=>InkWell(
  onTap: (){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => WebViewScreen(url: article['url'],)));

  },
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: article['urlToImage'] !=null
                    ?DecorationImage(
                    image:NetworkImage('${article['urlToImage']}'),
                    fit: BoxFit.cover)
                    : DecorationImage(image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png'),
                )
            )
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text('${article['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${article['publishedAt']}',
                  style: TextStyle(
                      color: Colors.grey
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);

Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);

Widget aritcleBuilder(list3,{isSearch =false})=>ConditionalBuilder(
  condition: list3.length>0,
  builder: (context) => ListView.separated(
      itemBuilder:(context,index)=>buildArticleItems(list3[index], context) ,
      separatorBuilder:(context,index)=> myDivider(),
      itemCount:7 ),
  fallback: (context)=>isSearch ? Container():Center(child: CircularProgressIndicator()),
);

Widget buildProductItems(model, context, {bool inSearch = true}) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Container(
    height: 120,
    child: Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(
              image: NetworkImage(model.image ?? ''),
              width: 120,
              height: 120,
            ),
            if (model.discount != 0 && inSearch)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                color: Colors.red,
                child: Text(
                  'Discount',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  height: 1.3,
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    model.price?.toString() ?? '',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  if (model.discount != 0 && inSearch)
                    Text(
                      model.discount.toString(),
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      ShopCubit.get(context).changeFavourites(model.id ?? '');
                    },
                    icon: CircleAvatar(
                      backgroundColor: ShopCubit.get(context).favourite[model.id ?? ''] ?? false
                          ? Colors.blueAccent
                          : Colors.grey,
                      radius: 15,
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);
