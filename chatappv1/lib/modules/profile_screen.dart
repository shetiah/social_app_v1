import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatappv1/Widgets/post.dart';
import 'package:chatappv1/modules/other_users_screen.dart';
import 'package:chatappv1/shared/components/components/my_main_components.dart';
import 'package:chatappv1/shared/components/constants/const.dart';
import 'package:chatappv1/shared/cubit/app_cubit/cubit.dart';
import 'package:chatappv1/shared/cubit/app_cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Widgets/cover_photo.dart';
import '../Widgets/profile_photo.dart';
import '../models/post_model.dart';
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
          body: Container(
            color: Colors.white,
            child: Column(
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
                                          height:
                                              cubit.getScreenWidth(context) *
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
                                              cubit.getScreenWidth(context) *
                                                  .03,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  userModel.followersList.length
                                                      .toString(),
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                const Text(
                                                  "Followers",
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
                                            Column(
                                              children: [
                                                Text(
                                                  userModel.followingList.length
                                                      .toString(),
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                const Text(
                                                  "Following",
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
                                            Column(
                                              children: [
                                                Text(
                                                  userModel.myPosts.length
                                                      .toString(),
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                const Text(
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
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
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
                                                                    fontSize:
                                                                        18,
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
                                                                        style:
                                                                            ButtonStyle(
                                                                          backgroundColor:
                                                                              MaterialStateColor.resolveWith((states) => defaultColor.withOpacity(.9)),
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
                                                      : (userModel.bio ==
                                                              'none')
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
                                                                            FontWeight.w600),
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
                                                            backgroundColor: MaterialStateColor
                                                                .resolveWith((states) =>
                                                                    defaultColor
                                                                        .withOpacity(
                                                                            .9)),
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
                                                height: cubit.getScreenWidth(
                                                        context) *
                                                    .03,
                                              ),
                                              Text(
                                                'Following',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .copyWith(
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.w600),
                                              ),
                                              SizedBox(
                                                height: cubit.getScreenWidth(
                                                        context) *
                                                    .03,
                                              ),
                                              SizedBox(
                                                height: cubit.getScreenWidth(
                                                        context) *
                                                    .4,
                                                child: ListView.separated(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  // shrinkWrap:true,
                                                  itemBuilder:
                                                      (context, index) {
                                                    // print((userModel
                                                    //     .followingList.values
                                                    //     .elementAt(index)
                                                    //     ));
                                                    return InkWell(
                                                      onTap: () {
                                                        navigateTo(
                                                            context,
                                                            OtherUser(
                                                                uId: userModel
                                                                    .followingList
                                                                    .values
                                                                    .elementAt(
                                                                        index)
                                                                    .uId));
                                                      },
                                                      child: SizedBox(
                                                        width: cubit
                                                                .getScreenWidth(
                                                                    context) *
                                                            .25,
                                                        child: Column(
                                                          children: [
                                                            CircleAvatar(
                                                                radius: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    .1,
                                                                backgroundColor:
                                                                    Colors
                                                                        .white,
                                                                child:
                                                                    CircleAvatar(
                                                                  backgroundImage: CachedNetworkImageProvider((userModel
                                                                              .followingList
                                                                              .values
                                                                              .elementAt(
                                                                                  index)
                                                                              .img ==
                                                                          'none')
                                                                      ? 'https://img.freepik.com/free-vector/sharing-content-social-media-with-man-smartphone_23-2148518566.jpg?size=626&ext=jpg&ga=GA1.1.1374943836.1707644974&semt=ais'
                                                                      : userModel
                                                                          .followingList
                                                                          .values
                                                                          .elementAt(
                                                                              index)
                                                                          .img),
                                                                  radius: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      .08,
                                                                )),
                                                            SizedBox(
                                                              height: cubit
                                                                      .getScreenWidth(
                                                                          context) *
                                                                  .01,
                                                            ),
                                                            Text(
                                                                userModel
                                                                    .followingList
                                                                    .values
                                                                    .elementAt(
                                                                        index)
                                                                    .name,
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600)),
                                                            SizedBox(
                                                              height: cubit
                                                                      .getScreenWidth(
                                                                          context) *
                                                                  .01,
                                                            ),
                                                            Text(
                                                                userModel
                                                                    .followingList
                                                                    .values
                                                                    .elementAt(
                                                                        index)
                                                                    .userName,
                                                                style: TextStyle(
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: Colors
                                                                            .grey[
                                                                        600])),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  itemCount: userModel
                                                      .followingList.length,
                                                  separatorBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return SizedBox(
                                                      width: 10,
                                                    );
                                                  },
                                                  // scrollDirection: Axis.horizontal,
                                                ),
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
                                                'Followers',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .copyWith(
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.w600),
                                              ),
                                              SizedBox(
                                                height: cubit.getScreenWidth(
                                                        context) *
                                                    .03,
                                              ),
                                              SizedBox(
                                                height: cubit.getScreenWidth(
                                                        context) *
                                                    .4,
                                                child: ListView.separated(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  // shrinkWrap:true,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return InkWell(
                                                      onTap: () {
                                                        navigateTo(
                                                            context,
                                                            OtherUser(
                                                                uId: userModel
                                                                    .followersList
                                                                    .values
                                                                    .elementAt(
                                                                        index)
                                                                    .uId));
                                                      },
                                                      child: SizedBox(
                                                        width: cubit
                                                                .getScreenWidth(
                                                                    context) *
                                                            .25,
                                                        child: Column(
                                                          children: [
                                                            CircleAvatar(
                                                                radius: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    .1,
                                                                backgroundColor:
                                                                    Colors
                                                                        .white,
                                                                child:
                                                                    CircleAvatar(
                                                                  backgroundImage: CachedNetworkImageProvider((userModel
                                                                              .followersList
                                                                              .values
                                                                              .elementAt(
                                                                                  index)
                                                                              .img ==
                                                                          'none')
                                                                      ? 'https://img.freepik.com/free-vector/sharing-content-social-media-with-man-smartphone_23-2148518566.jpg?size=626&ext=jpg&ga=GA1.1.1374943836.1707644974&semt=ais'
                                                                      : userModel
                                                                          .followersList
                                                                          .values
                                                                          .elementAt(
                                                                              index)
                                                                          .img),
                                                                  radius: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      .08,
                                                                )),
                                                            SizedBox(
                                                              height: cubit
                                                                      .getScreenWidth(
                                                                          context) *
                                                                  .01,
                                                            ),
                                                            Text(
                                                                userModel
                                                                    .followersList
                                                                    .values
                                                                    .elementAt(
                                                                        index)
                                                                    .name,
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600)),
                                                            SizedBox(
                                                              height: cubit
                                                                      .getScreenWidth(
                                                                          context) *
                                                                  .01,
                                                            ),
                                                            Text(
                                                                userModel
                                                                    .followersList
                                                                    .values
                                                                    .elementAt(
                                                                        index)
                                                                    .userName,
                                                                style: TextStyle(
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: Colors
                                                                            .grey[
                                                                        600])),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  itemCount: userModel
                                                      .followersList.length,
                                                  separatorBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return SizedBox(
                                                      width: 10,
                                                    );
                                                  },
                                                  // scrollDirection: Axis.horizontal,
                                                ),
                                              ),
                                              SizedBox(
                                                height: cubit.getScreenWidth(
                                                        context) *
                                                    .02,
                                              ),
                                              Post(
                                                model: PostModel(userModel.img),
                                                userName: userModel.name,
                                                userProfile: userModel.img,
                                                onLike: () {},
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              cubit.getScreenWidth(context) *
                                                  .3,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              top: cubit.getScreenWidth(context) * .37,
                              right: cubit.getScreenWidth(context) * .32,
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  ProfilePhoto(
                                    imgUrl: userModel.img,
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.width * .08,
                                    width:
                                        MediaQuery.of(context).size.width * .08,
                                    child: IconButton.filled(
                                        // highlightColor: defaultColor,
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) => defaultColor
                                                      .withOpacity(.9)),
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
                                        backgroundColor:
                                            MaterialStateColor.resolveWith(
                                                (states) => defaultColor
                                                    .withOpacity(.9)),
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
          ),
        );
      },
    );
  }
}
