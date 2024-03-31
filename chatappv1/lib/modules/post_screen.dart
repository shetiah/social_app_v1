import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatappv1/shared/components/constants/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/post_model.dart';
import '../shared/cubit/app_cubit/cubit.dart';
import '../shared/cubit/app_cubit/states.dart';

class PostScreen extends StatelessWidget {
  PostScreen({super.key});

  PostModel postModel = PostModel('no image');
  File? imgFile;

  // String img=''
  // bool imgOnPost=false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is UploadImageOnPostSuccess) {
            imgFile = state.imgFile;
          }
        },
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
              key: cubit.scaffoldKeyPostScreen,
              appBar: AppBar(
                leading: Padding(
                  padding: EdgeInsets.only(
                      left: cubit.getScreenWidth(context) * .05),
                  child: InkWell(
                    onTap: () {
                      Navigator.popUntil(context, (route) => route.isFirst);
                      cubit.changeIndex(0, context);
                    },
                    child: CircleAvatar(
                        backgroundColor: defaultColor,
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: cubit.getScreenWidth(context) * .08,
                        )),
                  ),
                ),
                title: const Text('Create Post'),
                actions: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: cubit.postIconColor,
                    ),
                    child: TextButton(
                      onPressed: () {
                        // cubit.fo
                        // if(cubit.postIconColor!=Colors.grey)

                        cubit.formKey.currentState?.validate();
                      },
                      child: const Text(
                        'POST',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: cubit.getScreenWidth(context) * .046,
                          right: cubit.getScreenWidth(context) * .046,
                          left: cubit.getScreenWidth(context) * .046),
                      child: Stack(
                        children: [
                          SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: cubit.getScreenWidth(context) * .02,
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius:
                                          cubit.getScreenWidth(context) * .08,
                                      backgroundColor: Colors.blue,
                                      backgroundImage:
                                          CachedNetworkImageProvider(
                                        (userModel.img == 'none')
                                            ? 'https://img.freepik.com/free-photo/portrait-serious-young-businessman-glasses_1262-3810.jpg?w=1800&t=st=1707831312~exp=1707831912~hmac=ca308542d839cd7364cb0739c3f9fe58f26ac5b16baee0b62ef11205fb487020'
                                            : userModel.img,
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          cubit.getScreenWidth(context) * .03,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          userModel.name,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromRGBO(11, 11, 59, 1),
                                            fontSize: 16,
                                          ),
                                        ),
                                        const Text(
                                          "On Your Timeline",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color:
                                                Color.fromRGBO(11, 11, 59, 0.6),
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: cubit.getScreenWidth(context) * .05,
                                ),
                                if (imgFile != null)
                                  Stack(
                                    children: [
                                      Center(
                                        child: ClipRect(
                                          // clipBehavior: Clip.antiAliasWithSaveLayer,
                                          child: Image.file(
                                            imgFile!,
                                            // width:
                                            // cubit.getScreenWidth(context) *
                                            //     .9,
                                            height:
                                            cubit.getScreenHeight(context) *
                                                .34,

                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment.topRight,
                                          child: IconButton(
                                  
                                            padding: EdgeInsets.only(right: 5),
                                              onPressed: () {
                                              cubit.onImagePosting();
                                              },
                                              icon: Icon(Icons.edit),
                                            iconSize: 25,
                                            color: Colors.white,
                                          ))
                                    ],
                                  ),
                                // SizedBox(
                                //   height: cubit.getScreenWidth(context) * .,
                                // ),
                                TextFormField(
                                    controller: cubit.controller,
                                    autofocus: false,
                                    key: cubit.formKey,
                                    maxLines: null,
                                    onChanged: (v) {
                                      cubit.validatePostPossibility();
                                    },
                                    decoration: const InputDecoration(
                                        hintText: "What's on your mind ?",
                                        hintStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromRGBO(11, 11, 59, 0.7),
                                          fontSize: 16,
                                        ))),
                                SizedBox(
                                  height: cubit.getScreenHeight(context) * .8,
                                )
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: AnimatedContainer(
                                height: cubit.expands
                                    ? cubit.getScreenHeight(context) * .1
                                    : cubit.getScreenHeight(context) * .2,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(200, 43, 49, 162),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                ),
                                duration: const Duration(milliseconds: 200),
                                child: !cubit.expands
                                    ? SingleChildScrollView(
                                        physics: const BouncingScrollPhysics(),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                                height: cubit.getScreenHeight(
                                                        context) *
                                                    .003),
                                            InkWell(
                                              child: Icon(
                                                  Icons.arrow_circle_down,
                                                  color: Colors.white,
                                                  size: cubit.getScreenWidth(
                                                          context) *
                                                      .09),
                                              onTap: () {
                                                cubit.bottomSheetPress();
                                              },
                                            ),
                                            SizedBox(
                                                height: cubit.getScreenHeight(
                                                        context) *
                                                    .009),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                      width:
                                                          cubit.getScreenHeight(
                                                                  context) *
                                                              .01),
                                                  Column(
                                                    // mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      InkWell(
                                                        onTap: () async {
                                                          postModel.image =
                                                              (await cubit
                                                                  .onImagePosting())!;
                                                          // cubit
                                                          // .bottomSheetPress();
                                                        },
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons.image,
                                                              size: cubit.getScreenWidth(
                                                                      context) *
                                                                  .08,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            SizedBox(
                                                                width: cubit.getScreenWidth(
                                                                        context) *
                                                                    .01),
                                                            const Text(
                                                              "Images",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          height: cubit
                                                                  .getScreenHeight(
                                                                      context) *
                                                              .008),
                                                      Row(
                                                        children: [
                                                          InkWell(
                                                            child: Icon(
                                                              Icons.camera_alt,
                                                              size: cubit.getScreenWidth(
                                                                      context) *
                                                                  .08,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            onTap: () {
                                                              cubit
                                                                  .bottomSheetPress();
                                                            },
                                                          ),
                                                          SizedBox(
                                                              width: cubit.getScreenWidth(
                                                                      context) *
                                                                  .01),
                                                          const Text(
                                                            "Camera",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                          height: cubit
                                                                  .getScreenHeight(
                                                                      context) *
                                                              .008),
                                                      Row(
                                                        children: [
                                                          InkWell(
                                                            child: Icon(
                                                              Icons.tag_sharp,
                                                              size: cubit.getScreenWidth(
                                                                      context) *
                                                                  .08,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            onTap: () {
                                                              cubit
                                                                  .bottomSheetPress();
                                                            },
                                                          ),
                                                          SizedBox(
                                                              width: cubit.getScreenWidth(
                                                                      context) *
                                                                  .01),
                                                          const Text(
                                                            "Tags",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white),
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    : SingleChildScrollView(
                                        physics: const BouncingScrollPhysics(),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                                height: cubit.getScreenHeight(
                                                        context) *
                                                    .002),
                                            InkWell(
                                              onTap: () {
                                                cubit.bottomSheetPress();
                                              },
                                              child: Icon(
                                                Icons.arrow_circle_up_rounded,
                                                color: Colors.white,
                                                size: cubit.getScreenWidth(
                                                        context) *
                                                    .08,
                                              ),
                                            ),
                                            SizedBox(
                                                height: cubit.getScreenHeight(
                                                        context) *
                                                    .009),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    cubit.bottomSheetPress();
                                                  },
                                                  child: const Icon(
                                                    Icons.image,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                SizedBox(
                                                    width:
                                                        cubit.getScreenHeight(
                                                                context) *
                                                            .01),
                                                InkWell(
                                                    onTap: () {
                                                      cubit.bottomSheetPress();
                                                    },
                                                    child: const Icon(
                                                      Icons.camera_alt_outlined,
                                                      color: Colors.white,
                                                    )),
                                                SizedBox(
                                                    width:
                                                        cubit.getScreenHeight(
                                                                context) *
                                                            .01),
                                                InkWell(
                                                  onTap: () {
                                                    cubit.bottomSheetPress();
                                                  },
                                                  child: const Icon(
                                                    Icons.tag,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )),
                            // AnimatedContainer(
                            //    height:
                            //        cubit.getScreenHeight(context) * .1,
                            //    width: double.infinity,
                            //    decoration: const BoxDecoration(
                            //      color: Colors.grey,
                            //      borderRadius: BorderRadius.all(
                            //          Radius.circular(20)),
                            //    ),
                            //    duration:
                            //        const Duration(milliseconds: 200),
                            //    child: Column(
                            //      // mainAxisSize: MainAxisSize.min,min
                            //      children: [
                            //        SizedBox(
                            //            height: cubit.getScreenHeight(
                            //                    context) *
                            //                .002),
                            //        InkWell(
                            //          onTap: () {
                            //            cubit.bottomSheetPress();
                            //          },
                            //          child: const Icon(
                            //            Icons.arrow_circle_up_rounded,
                            //            color: Colors.blueAccent,
                            //          ),
                            //        ),
                            //        SizedBox(
                            //            height: cubit.getScreenHeight(
                            //                    context) *
                            //                .009),
                            //        Row(
                            //          mainAxisAlignment:
                            //              MainAxisAlignment.center,
                            //          children: [
                            //            InkWell(
                            //              onTap: () {
                            //                cubit.bottomSheetPress();
                            //              },
                            //              child: const Icon(
                            //                Icons.image,
                            //                color: Colors.blueAccent,
                            //              ),
                            //            ),
                            //            SizedBox(
                            //                width: cubit.getScreenHeight(
                            //                        context) *
                            //                    .01),
                            //            InkWell(
                            //              onTap: () {
                            //                cubit.bottomSheetPress();
                            //              },
                            //              child: const Icon(
                            //                Icons.camera_alt_outlined,
                            //                color: Colors.blueAccent,
                            //              ),
                            //            ),
                            //            SizedBox(
                            //                width: cubit.getScreenHeight(
                            //                        context) *
                            //                    .01),
                            //            InkWell(
                            //              onTap: () {
                            //                cubit.bottomSheetPress();
                            //              },
                            //              child: const Icon(
                            //                Icons.tag,
                            //                color: Colors.blueAccent,
                            //              ),
                            //            ),
                            //          ],
                            //        )
                            //      ],
                            //    )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
