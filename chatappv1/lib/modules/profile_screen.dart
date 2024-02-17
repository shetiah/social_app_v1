import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatappv1/shared/components/constants/const.dart';
import 'package:chatappv1/shared/cubit/app_cubit/cubit.dart';
import 'package:chatappv1/shared/cubit/app_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, AppStates state) {},
      builder: (BuildContext context, AppStates state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Image(
                              image: CachedNetworkImageProvider((userModel
                                          .coverImg ==
                                      'none')
                                  ? 'https://img.freepik.com/free-photo/portrait-charming-brunet-men-white-tshirts-jeans-isolated-man-orange-jacket-show-thump-up-guy-checkered-shirt-show-peace-sign_197531-29589.jpg?w=1800&t=st=1707842534~exp=1707843134~hmac=eed91cb9cc45b18a19649e6468e0d6d768d9d4f07fff23febd39e042bddd974c'
                                  : userModel.coverImg),
                              fit: BoxFit.cover,
                              height: cubit.getScreenHeight(context) * .32,
                              width: double.infinity,
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: cubit.getScreenWidth(context) * .6,
                              ),
                              Flexible(
                                child: Container(
                                  color: Colors.white,
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: cubit.getScreenWidth(context) *
                                            .125,
                                      ),
                                      Text(
                                        userModel.name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        userModel.userName,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            cubit.getScreenWidth(context) * .03,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Column(
                                            children: [
                                              Text(
                                                "111",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Text(
                                                "Friends",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width:
                                                cubit.getScreenWidth(context) *
                                                    .04,
                                          ),
                                          const Column(
                                            children: [
                                              Text(
                                                "378",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Text(
                                                "Posts",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            cubit.getScreenWidth(context) * .06,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                cubit.getScreenWidth(context) *
                                                    .01),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                cubit.editingBio
                                                    ? Expanded(
                                                        // padding:EdgeInsets.symmetric(horizontal: 0),
                                                        child: TextFormField(
                                                          maxLines: null,
                                                          focusNode: cubit
                                                              .bioTextFieldFocus,
                                                          controller: cubit
                                                              .bioEditingController,
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .bodyLarge!
                                                              .copyWith(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                          decoration:
                                                              InputDecoration(
                                                            // border:const OutlineInputBorder(),
                                                            suffix: SizedBox(
                                                              height: cubit
                                                                      .getScreenWidth(
                                                                          context) *
                                                                  .08,
                                                              width: cubit.getScreenWidth(
                                                                      context) *
                                                                  .08,
                                                              child: IconButton
                                                                  .filled(
                                                                      padding: const EdgeInsets
                                                                          .all(
                                                                          0),
                                                                      iconSize:
                                                                          cubit.getScreenWidth(context) *
                                                                              .05,
                                                                      onPressed:
                                                                          () {
                                                                        cubit.editBio(
                                                                            userModel.bio);
                                                                      },
                                                                      icon: cubit
                                                                          .editingBioIcon),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    : (userModel.bio == 'none')
                                                        ? Text(
                                                            'This is your Bio..!',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyLarge!
                                                                .copyWith(
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                          )
                                                        : Expanded(
                                                            child: Text(
                                                              userModel.bio,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyLarge!
                                                                  .copyWith(
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                            ),
                                                          ),
                                                // if (!cubit.editingBio) Spacer(),
                                                if (!cubit.editingBio)
                                                  SizedBox(
                                                    height:
                                                        cubit.getScreenWidth(
                                                                context) *
                                                            .08,
                                                    width: cubit.getScreenWidth(
                                                            context) *
                                                        .08,
                                                    child: IconButton.filled(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0),
                                                        iconSize: cubit
                                                                .getScreenWidth(
                                                                    context) *
                                                            .05,
                                                        onPressed: () {
                                                          cubit.editBio(
                                                              userModel.bio);
                                                        },
                                                        icon: cubit
                                                            .editingBioIcon),
                                                  )
                                              ],
                                            ),
                                            if (!cubit.editingBio)
                                              SizedBox(
                                                height: cubit.getScreenWidth(
                                                        context) *
                                                    .03,
                                              ),
                                            if (!cubit.editingBio)
                                              Container(
                                                width: double.infinity,
                                                height: 1,
                                                color: Colors.grey,
                                              ),
                                            SizedBox(
                                              height: cubit
                                                      .getScreenWidth(context) *
                                                  .03,
                                            ),
                                            Text(
                                              'My Posts',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                            SizedBox(
                                              height: cubit
                                                      .getScreenWidth(context) *
                                                  .03,
                                            ),
                                            Card(
                                              color: Colors.blueAccent
                                                  .withOpacity(0.5),
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              elevation: 5.0,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  left: cubit.getScreenWidth(
                                                          context) *
                                                      .01,
                                                  right: cubit.getScreenWidth(
                                                          context) *
                                                      .03,
                                                  top: cubit.getScreenWidth(
                                                          context) *
                                                      .03,
                                                  bottom: cubit.getScreenWidth(
                                                          context) *
                                                      .03,
                                                ),
                                                child: Row(
                                                  children: [
                                                    CircleAvatar(
                                                      radius:
                                                          cubit.getScreenWidth(
                                                                  context) *
                                                              .08,
                                                      backgroundColor:
                                                          Colors.blue,
                                                      backgroundImage:
                                                          const CachedNetworkImageProvider(
                                                              'https://img.freepik.com/free-photo/portrait-serious-young-businessman-glasses_1262-3810.jpg?w=1800&t=st=1707831312~exp=1707831912~hmac=ca308542d839cd7364cb0739c3f9fe58f26ac5b16baee0b62ef11205fb487020'),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          cubit.getScreenWidth(
                                                                  context) *
                                                              .02,
                                                    ),
                                                    const Text(
                                                      "What's on your mind ?",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    Icon(Icons.edit),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: cubit
                                                      .getScreenWidth(context) *
                                                  .04,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            top: cubit.getScreenWidth(context) * .45,
                            right: cubit.getScreenWidth(context) * .37,
                            child: CircleAvatar(
                                radius: cubit.getScreenWidth(context) * .127,
                                backgroundColor: Colors.blueAccent,
                                child: Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      CircleAvatar(
                                        backgroundImage:
                                            CachedNetworkImageProvider((userModel
                                                        .img ==
                                                    'none')
                                                ? 'https://img.freepik.com/free-vector/sharing-content-social-media-with-man-smartphone_23-2148518566.jpg?size=626&ext=jpg&ga=GA1.1.1374943836.1707644974&semt=ais'
                                                : userModel.img),
                                        radius:
                                            cubit.getScreenWidth(context) * .12,
                                      ),
                                      SizedBox(
                                        height:
                                            cubit.getScreenWidth(context) * .08,
                                        width:
                                            cubit.getScreenWidth(context) * .08,
                                        child: IconButton.filled(
                                            color: Colors.white,
                                            padding: const EdgeInsets.all(0),
                                            iconSize:
                                                cubit.getScreenWidth(context) *
                                                    .05,
                                            onPressed: () {
                                              cubit.editProfilePhoto();
                                            },
                                            icon: const Icon(Icons.edit)),
                                      )
                                    ])),
                          ),
                          Positioned(
                              top: cubit.getScreenWidth(context) * .55,
                              right: cubit.getScreenWidth(context) * .006,
                              child: SizedBox(
                                height: cubit.getScreenWidth(context) * .08,
                                width: cubit.getScreenWidth(context) * .08,
                                child: IconButton.filled(
                                    color: Colors.white,
                                    padding: const EdgeInsets.all(0),
                                    iconSize:
                                        cubit.getScreenWidth(context) * .05,
                                    onPressed: () {
                                      cubit.editCoverPhoto();
                                    },
                                    icon: const Icon(Icons.edit)),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
