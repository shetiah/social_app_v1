import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatappv1/shared/components/constants/const.dart';
import 'package:chatappv1/shared/cubit/app_cubit/cubit.dart';
import 'package:chatappv1/shared/cubit/app_cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Widgets/cover_photo.dart';
import '../Widgets/profile_photo.dart';
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
                          CoverPhoto(
                            imgUrl: userModel.coverImg,
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
                                                "Followers",
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
                                                "Following",
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
                                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                                                  style: ButtonStyle(
                                                                    backgroundColor:MaterialStateColor.resolveWith((states) => defaultColor.withOpacity(.9)) ,
                                                                  ),
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
                                                // if (!cubit.editingBio) const Spacer(),
                                                if (!cubit.editingBio)
                                                  SizedBox(
                                                    height:
                                                        cubit.getScreenWidth(
                                                                context) *
                                                            .08,
                                                    width:
                                                        cubit.getScreenWidth(
                                                                context) *
                                                            .08,
                                                    child: IconButton.filled(
                                                        style: ButtonStyle(
                                                          backgroundColor:MaterialStateColor.resolveWith((states) => defaultColor.withOpacity(.9)) ,
                                                        ),
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
                          Positioned(top: cubit.getScreenWidth(context) * .37,
                            right: cubit.getScreenWidth(context) * .32,
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                ProfilePhoto(imgUrl: userModel.img,),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width * .08,
                                  width:
                                      MediaQuery.of(context).size.width * .08,
                                  child: IconButton.filled(
                                    // highlightColor: defaultColor,
                                    style: ButtonStyle(
                                      backgroundColor:MaterialStateColor.resolveWith((states) => defaultColor.withOpacity(.9)) ,
                                    ),
                                      color: Colors.white,

                                      padding: const EdgeInsets.all(0),
                                      iconSize:
                                          MediaQuery.of(context).size.width *
                                              .05,
                                      onPressed: () {
                                        cubit.editProfilePhoto();
                                      },
                                      icon: const Icon(Icons.edit)),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                              top: cubit.getScreenWidth(context) * .55,
                              right: cubit.getScreenWidth(context) * .006,
                              child: SizedBox(
                                height: cubit.getScreenWidth(context) * .08,
                                width: cubit.getScreenWidth(context) * .08,
                                child: IconButton.filled(
                                    color: Colors.white,
                                    style: ButtonStyle(
                                      backgroundColor:MaterialStateColor.resolveWith((states) => defaultColor.withOpacity(.9)) ,
                                    ),
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
