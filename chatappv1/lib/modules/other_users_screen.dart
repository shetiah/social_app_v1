import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatappv1/Widgets/cover_photo.dart';
import 'package:chatappv1/Widgets/profile_photo.dart';
import 'package:chatappv1/models/user_model.dart';
import 'package:chatappv1/shared/components/constants/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/cubit/app_cubit/cubit.dart';
import '../shared/cubit/app_cubit/states.dart';

class OtherUser extends StatelessWidget {
  const OtherUser({super.key, required this.model});

  final UserModel model;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {},
        builder: (BuildContext context, AppStates state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            CoverPhoto(imgUrl: model.coverImg),
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
                                          height:
                                              cubit.getScreenWidth(context) *
                                                  .125,
                                        ),
                                        Text(
                                          model.name,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20),
                                        ),
                                        Text(
                                          model.userName,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              cubit.getScreenWidth(context) *
                                                  .03,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                          const  Column(
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
                                              width: cubit
                                                      .getScreenWidth(context) *
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
                                        if(userModel.userName!=model.userName)
                                        SizedBox(
                                          height:
                                              cubit.getScreenWidth(context) *
                                                  .03,
                                        ),

                                        (userModel.followingList.containsKey(model.uId)&&! (userModel.userName==model.userName))?
                                        InkWell(
                                          onTap: () {
                                            // userModel.friendsList.addAll({model.uId:model});
                                            cubit.unfollowUser(model);
                                          },
                                          child: Container(
                                              decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(40)),
                                                  color: Colors.blueAccent),
                                              child: Padding(
                                                padding: EdgeInsets.all(
                                                    cubit.getScreenWidth(
                                                            context) *
                                                        .03),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Icon(Icons.done,color: Colors.white,size:cubit.getScreenWidth(
                                                        context) *
                                                        .06 ,),
                                                    SizedBox(width:cubit.getScreenWidth(
                                                        context) *
                                                        .01 ,),
                                                    const Text(
                                                      'Following',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                        ):
                                        !(userModel.userName==model.userName)?
                                        InkWell(
                                          onTap: () {
                                            cubit.followUser(model);

                                            // userModel.friendsList.addAll({model.uId:model});
                                          },
                                          child: Container(
                                              decoration: const BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(40)),
                                                  color: Colors.blueAccent),
                                              child: Padding(
                                                padding: EdgeInsets.all(
                                                    cubit.getScreenWidth(
                                                        context) *
                                                        .03),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Icon(Icons.add,color: Colors.white,size:cubit.getScreenWidth(
                                                        context) *
                                                        .06 ,),
                                                    SizedBox(width:cubit.getScreenWidth(
                                                        context) *
                                                        .01 ,),
                                                    const Text(
                                                      'Follow',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 17,
                                                          fontWeight:
                                                          FontWeight.w700),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                        ):SizedBox(),
                                        SizedBox(
                                          height:
                                              cubit.getScreenWidth(context) *
                                                  .06,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: cubit
                                                      .getScreenWidth(context) *
                                                  .01),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  (model.bio == 'none')
                                                      ? Text(
                                                          'This is your Bio..!',
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .bodyLarge!
                                                              .copyWith(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                        )
                                                      : Expanded(
                                                          child: Text(
                                                            model.bio,
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
                                                ],
                                              ),
                                              SizedBox(
                                                height: cubit.getScreenWidth(
                                                        context) *
                                                    .03,
                                              ),
                                              Container(
                                                width: double.infinity,
                                                height: 1,
                                                color: Colors.grey,
                                              ),
                                              SizedBox(
                                                height: cubit.getScreenWidth(
                                                        context) *
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
                                                height: cubit.getScreenWidth(
                                                        context) *
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
                                                    bottom:
                                                        cubit.getScreenWidth(
                                                                context) *
                                                            .03,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      CircleAvatar(
                                                        radius: cubit
                                                                .getScreenWidth(
                                                                    context) *
                                                            .08,
                                                        backgroundColor:
                                                            Colors.blue,
                                                        backgroundImage:
                                                            const CachedNetworkImageProvider(
                                                                'https://img.freepik.com/free-photo/portrait-serious-young-businessman-glasses_1262-3810.jpg?w=1800&t=st=1707831312~exp=1707831912~hmac=ca308542d839cd7364cb0739c3f9fe58f26ac5b16baee0b62ef11205fb487020'),
                                                      ),
                                                      SizedBox(
                                                        width: cubit
                                                                .getScreenWidth(
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
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: cubit.getScreenWidth(
                                                        context) *
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
                              top: cubit.getScreenWidth(context) * .37,
                              right: cubit.getScreenWidth(context) * .31,
                              child: ProfilePhoto( imgUrl: model.img,),
                            ),
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
      ),
    );
  }
}
