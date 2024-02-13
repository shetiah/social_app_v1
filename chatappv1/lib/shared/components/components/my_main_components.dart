import 'package:chatappv1/shared/cubit/app_cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../models/post_model.dart';

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
void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
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
              AppCubit.get(context).width= AppCubit.get(context).getScreenWidth(context) * .27;
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
  Icons.person,
];

List<String> listOfStrings = [
  'Home',
  'Posts',
  'Users',
  'Chats',
  'Profile',
];

Widget buildPostItem(Post postModel, context) =>  Card(
  clipBehavior: Clip.antiAliasWithSaveLayer,
  elevation: 5.0,
  // color: Colors.grey,
  child: Padding(
    padding: EdgeInsets.all(
        AppCubit.get(context).getScreenWidth(context) * .03),
    child: SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius:
                AppCubit.get(context).getScreenWidth(context) * .1,
                backgroundColor: Colors.blue,
                backgroundImage:  NetworkImage(
               postModel.userAvatar,
                ),
              ),
              SizedBox(
                  width: AppCubit.get(context).getScreenWidth(context) *
                      .03),
              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(postModel.userName,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      )),
                  Text('2021-11-17 ',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey[500])),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(
                AppCubit.get(context).getScreenWidth(context) * .03),
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 5.0,
              child: Image(
                image: NetworkImage(
                  'https://img.freepik.com/free-photo/metaverse-concept-collage-design_23-2149419860.jpg?w=1800&t=st=1707645438~exp=1707646038~hmac=9fa4dc3adaf790326c80c5d46261b4d4e420eefcd88e915f24e6541c12cc40b6',
                ),
                fit: BoxFit.cover,
                height:
                AppCubit.get(context).getScreenHeight(context) * .32,
                width: double.infinity,
              ),
            ),
          ),  SizedBox(
            height: AppCubit.get(context).getScreenWidth(context) * .04,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Abdelrahaman shetiah', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                  )),
                ],
              ),
              SizedBox(
                height: AppCubit.get(context).getScreenWidth(context) * .03,
              ),
              Wrap(
                children: [
                  Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
                ],
              ),
            ],
          ),
          SizedBox(
            height: AppCubit.get(context).getScreenWidth(context) * .04,
          ),
          Row(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.heart_broken_sharp,
                  ),
                  SizedBox(
                    width: AppCubit.get(context).getScreenWidth(context) *
                        .03,
                  ),
                  const Text(
                    '273',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: AppCubit.get(context).getScreenWidth(context) *
                        .01,
                  ),
                  Text(
                    'Likes',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                width:
                AppCubit.get(context).getScreenWidth(context) * .04,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.comment_sharp,
                  ),
                  SizedBox(
                    width: AppCubit.get(context).getScreenWidth(context) *
                        .03,
                  ),
                  const Text(
                    '23',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: AppCubit.get(context).getScreenWidth(context) *
                        .01,
                  ),
                  Text(
                    'Comments',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  Icon(
                    Icons.ios_share,
                  ),
                  SizedBox(
                    width: AppCubit.get(context).getScreenWidth(context) *
                        .01,
                  ),
                  Icon(
                    Icons.bookmark_border,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    ),
  ),
);