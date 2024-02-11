import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../cubit/app_cubit/cubit.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required Function onSubmit,
  required Function onChange,
  required Function onTap,
  bool isPassword = false,
  required Function validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
  required dynamic context,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: (s) {
        onSubmit(s);
      },
      onChanged: (s) {
        onChange(s);
      },
      onTap: () {
        onTap();
      },
      validator: (s) {
        return validate(s);
      },
      decoration: InputDecoration(
        prefixIconColor: Colors.amber,
        suffixIconColor: Colors.black,
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.amber,
        ),
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixPressed!();
                },
                icon: Icon(
                  suffix,
                  size: 20,
                ),
              )
            : null,
        border: const OutlineInputBorder(),
      ),
    );

Widget defaultTextButton({
  required Function function,
  required String text,
}) =>
    TextButton(
      onPressed: () {
        function();
      },
      child: Text(
        text.toUpperCase(),
      ),
    );

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 30,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

void navigateAndFinish(
  context,
  widget,
) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) {
        return false;
      },
    );

void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

// ignore: constant_identifier_names
enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }

  return color;
}

Widget customBottomNavbar1(context) {
  // var width;
  return Positioned(
    left: AppCubit.get(context).getScreenWidth(context) * .02,
    right: AppCubit.get(context).getScreenWidth(context) * .02,
    bottom: AppCubit.get(context).getScreenWidth(context) * .06,
    child: Container(
      // width: AppCubit.get(context).getScreenWidth(context) * .94,
      height: AppCubit.get(context).getScreenWidth(context) * .155,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(.13),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(50),
        // border: Border.all(color:const Color.fromARGB(200, 43, 49, 162),width: 2)
      ),
      child: ListView.builder(
          controller: AppCubit.get(context).listViewController,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            if(index==4) {
              AppCubit.get(context).width= AppCubit.get(context).getScreenWidth(context) * .293;
            }
            else{
              AppCubit.get(context).width= AppCubit.get(context).getScreenWidth(context) * .27;
            }
            return InkWell(
              onTap: () {
                AppCubit.get(context).changeIndex(index, context);
                if (index == 4) {
                  AppCubit.get(context).listViewController.animateTo(
                      AppCubit.get(context)
                          .listViewController
                          .position
                          .maxScrollExtent,
                      duration: const Duration(seconds: 1),
                      curve: Curves.bounceInOut);
                  // width=AppCubit.get(context).getScreenWidth(context) * .29;
                }

                if (index == 0) {
                  AppCubit.get(context).listViewController.animateTo(
                      AppCubit.get(context)
                          .listViewController
                          .position
                          .minScrollExtent,
                      duration: const Duration(seconds: 1),
                      curve: Curves.bounceInOut);
                }
              },
              splashColor: Colors.transparent,
              highlightColor: const Color.fromRGBO(0, 0, 0, 0),
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == AppCubit.get(context).bottomNavIndex
                        ? AppCubit.get(context).width
                        : AppCubit.get(context).getScreenWidth(context) * .001,
                    alignment: Alignment.center,
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: index == AppCubit.get(context).bottomNavIndex
                          ? AppCubit.get(context).getScreenWidth(context) * .13
                          : 0,
                      width: index == AppCubit.get(context).bottomNavIndex
                          ? AppCubit.get(context).getScreenWidth(context) * .24
                          : 0,
                      decoration: BoxDecoration(
                        color: index == AppCubit.get(context).bottomNavIndex
                            ? Colors.blueAccent.withOpacity(0.3)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == AppCubit.get(context).bottomNavIndex
                        ? AppCubit.get(context).width
                        : AppCubit.get(context).getScreenWidth(context) * .18,
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width:
                                  index == AppCubit.get(context).bottomNavIndex
                                      ? AppCubit.get(context)
                                              .getScreenWidth(context) *
                                          .1
                                      : 0,
                            ),
                            AnimatedOpacity(
                              opacity:
                                  index == AppCubit.get(context).bottomNavIndex
                                      ? 1
                                      : 0,
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: Text(
                                index == AppCubit.get(context).bottomNavIndex
                                    ? listOfStrings[index]
                                    : '',
                                style: const TextStyle(
                                  color: Color.fromARGB(200, 43, 49, 162),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width:
                                  index == AppCubit.get(context).bottomNavIndex
                                      ? AppCubit.get(context)
                                              .getScreenWidth(context) *
                                          .03
                                      : 20,
                            ),
                            Icon(
                              listOfIcons[index],
                              size: AppCubit.get(context)
                                      .getScreenWidth(context) *
                                  .06,
                              color:
                                  index == AppCubit.get(context).bottomNavIndex
                                      ?const Color.fromARGB(200, 43, 49, 162)
                                      : const Color.fromARGB(200, 43, 49, 162).withOpacity(0.4),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            );
          }),
    ),
  );
}

List<IconData> listOfIcons = [
  Icons.home,
  Icons.post_add,
  Icons.supervised_user_circle_sharp,
  Icons.chat_sharp,
  Icons.settings,
];

List<String> listOfStrings = [
  'Home',
  'Posts',
  'Users',
  'Chats',
  'Settings',
];

// Widget buildPostItem(PostModel model, context) => Card(
//   clipBehavior: Clip.antiAliasWithSaveLayer,
//   elevation: 5.0,
//   margin: EdgeInsets.symmetric(
//     horizontal: 8.0,
//   ),
//   child: Padding(
//     padding: const EdgeInsets.all(10.0),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             CircleAvatar(
//               radius: 25.0,
//               backgroundImage: NetworkImage(
//                 '${model.image}',
//               ),
//             ),
//             SizedBox(
//               width: 15.0,
//             ),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Text(
//                         '${model.name}',
//                         style: TextStyle(
//                           height: 1.4,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 5.0,
//                       ),
//                       Icon(
//                         Icons.check_circle,
//                         color: defaultColor,
//                         size: 16.0,
//                       ),
//                     ],
//                   ),
//                   Text(
//                     '${model.dateTime}',
//                     style: Theme.of(context).textTheme.caption.copyWith(
//                       height: 1.4,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               width: 15.0,
//             ),
//             IconButton(
//               icon: Icon(
//                 Icons.more_horiz,
//                 size: 16.0,
//               ),
//               onPressed: () {},
//             ),
//           ],
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(
//             vertical: 15.0,
//           ),
//           child: Container(
//             width: double.infinity,
//             height: 1.0,
//             color: Colors.grey[300],
//           ),
//         ),
//         Text(
//           '${model.text}',
//           style: Theme.of(context).textTheme.subtitle1,
//         ),
//         if(model.postImage != '')
//           Padding(
//             padding: const EdgeInsetsDirectional.only(
//                 top: 15.0
//             ),
//             child: Container(
//               height: 140.0,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(
//                   4.0,
//                 ),
//                 image: DecorationImage(
//                   image: NetworkImage(
//                     '${model.postImage}',
//                   ),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//         Padding(
//           padding: const EdgeInsets.symmetric(
//             vertical: 5.0,
//           ),
//           child: Row(
//             children: [
//               Expanded(
//                 child: InkWell(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                       vertical: 5.0,
//                     ),
//                     child: Row(
//                       children: [
//                         Icon(
//                           IconBroken.Heart,
//                           size: 16.0,
//                           color: Colors.red,
//                         ),
//                         SizedBox(
//                           width: 5.0,
//                         ),
//                         Text(
//                           '0',
//                           style: Theme.of(context).textTheme.caption,
//                         ),
//                       ],
//                     ),
//                   ),
//                   onTap: () {},
//                 ),
//               ),
//               Expanded(
//                 child: InkWell(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                       vertical: 5.0,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Icon(
//                           IconBroken.Chat,
//                           size: 16.0,
//                           color: Colors.amber,
//                         ),
//                         SizedBox(
//                           width: 5.0,
//                         ),
//                         Text(
//                           '0 comment',
//                           style: Theme.of(context).textTheme.caption,
//                         ),
//                       ],
//                     ),
//                   ),
//                   onTap: () {},
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(
//             bottom: 10.0,
//           ),
//           child: Container(
//             width: double.infinity,
//             height: 1.0,
//             color: Colors.grey[300],
//           ),
//         ),
//         Row(
//           children: [
//             Expanded(
//               child: InkWell(
//                 child: Row(
//                   children: [
//                     CircleAvatar(
//                       radius: 18.0,
//                       backgroundImage: NetworkImage(
//                         '${SocialCubit.get(context).userModel.image}',
//                       ),
//                     ),
//                     SizedBox(
//                       width: 15.0,
//                     ),
//                     Text(
//                       'write a comment ...',
//                       style:
//                       Theme.of(context).textTheme.caption.copyWith(),
//                     ),
//                   ],
//                 ),
//                 onTap: () {},
//               ),
//             ),
//             InkWell(
//               child: Row(
//                 children: [
//                   Icon(
//                     IconBroken.Heart,
//                     size: 16.0,
//                     color: Colors.red,
//                   ),
//                   SizedBox(
//                     width: 5.0,
//                   ),
//                   Text(
//                     'Like',
//                     style: Theme.of(context).textTheme.caption,
//                   ),
//                 ],
//               ),
//               onTap: () {},
//             ),
//           ],
//         ),
//       ],
//     ),
//   ),
// );