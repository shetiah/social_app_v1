import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatappv1/Widgets/cover_photo.dart';
import 'package:chatappv1/Widgets/profile_photo.dart';
import 'package:chatappv1/models/user_model.dart';
import 'package:chatappv1/shared/components/constants/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/components/components/my_main_components.dart';
import '../shared/cubit/app_cubit/cubit.dart';
import '../shared/cubit/app_cubit/states.dart';

class OtherUser extends StatelessWidget {
   OtherUser({super.key, required this.uId});
   final String uId;

   var model;
   // late model2
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..initUserLists(uId),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          if(state is GetAnyUserListsSuccessState ) {
            print(state.model.name);
           model=state.model;
            print(model.name);
          }
        },
        builder: (BuildContext context, AppStates state) {
          var cubit = AppCubit.get(context);
          // model=cubit.initUserLists(model: model);
          return Scaffold(
            appBar: AppBar(),
            body:(state is! GetAnyUserListsLoadingState)? Column(
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
                                        Column(
                                          children: [
                                            Text(
                                              model.followersList.length
                                                  .toString(),
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
                                          width: cubit
                                              .getScreenWidth(context) *
                                              .04,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              model.followingList.length
                                                  .toString(),
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
                                          width: cubit
                                              .getScreenWidth(context) *
                                              .04,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              model.myPosts.length
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
                                              decoration:  BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(40)),
                                                  color: defaultColor),
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
                                              decoration:  BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(40)),
                                                  color: defaultColor),
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
                                                    .04,
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
                                                      onTap: (){
                                                        navigateTo(context, OtherUser(uId: model
                                                            .followingList
                                                            .values
                                                            .elementAt(
                                                            index).uId));
                                                      },
                                                      child: SizedBox(
                                                        width:
                                                        cubit.getScreenWidth(
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
                                                                Colors.white,
                                                                child:
                                                                CircleAvatar(
                                                                  backgroundImage: CachedNetworkImageProvider((model
                                                                      .followingList
                                                                      .values
                                                                      .elementAt(
                                                                      index)
                                                                      .img ==
                                                                      'none')
                                                                      ? 'https://img.freepik.com/free-vector/sharing-content-social-media-with-man-smartphone_23-2148518566.jpg?size=626&ext=jpg&ga=GA1.1.1374943836.1707644974&semt=ais'
                                                                      : model
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
                                                                model
                                                                    .followingList
                                                                    .values
                                                                    .elementAt(
                                                                    index)
                                                                    .name,
                                                                style: const TextStyle(
                                                                    fontSize: 15,
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
                                                                model
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
                                                  itemCount: model
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
                                                      onTap: (){
                                                        navigateTo(context, OtherUser(uId: model
                                                            .followersList
                                                            .values
                                                            .elementAt(
                                                            index).uId));
                                                      },
                                                      child: SizedBox(
                                                        width:
                                                        cubit.getScreenWidth(
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
                                                                Colors.white,
                                                                child:
                                                                CircleAvatar(
                                                                  backgroundImage: CachedNetworkImageProvider((model.followersList.values.elementAt(index)
                                                                      .img ==
                                                                      'none')
                                                                      ? 'https://img.freepik.com/free-vector/sharing-content-social-media-with-man-smartphone_23-2148518566.jpg?size=626&ext=jpg&ga=GA1.1.1374943836.1707644974&semt=ais'
                                                                      : model.followersList.values.elementAt(index)
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
                                                                model.followersList.values.elementAt(index).name,
                                                                style:const  TextStyle(
                                                                    fontSize: 15,
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
                                                            Text( model.followersList.values.elementAt(index).userName,
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
                                                  itemCount: model.followersList.length,
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
            ):Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
