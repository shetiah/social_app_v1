import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatappv1/shared/cubit/app_cubit/cubit.dart';
import 'package:chatappv1/shared/cubit/app_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                child: CustomScrollView(
                  // physics: BouncingScrollPhysics(),CustomScrollView
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        children:[
                          Expanded(
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: Image(
                                    image: const CachedNetworkImageProvider(
                                        'https://img.freepik.com/free-photo/portrait-charming-brunet-men-white-tshirts-jeans-isolated-man-orange-jacket-show-thump-up-guy-checkered-shirt-show-peace-sign_197531-29589.jpg?w=1800&t=st=1707842534~exp=1707843134~hmac=eed91cb9cc45b18a19649e6468e0d6d768d9d4f07fff23febd39e042bddd974c'),
                                    fit: BoxFit.cover,
                                    height: cubit.getScreenHeight(context) * .32,
                                    width: double.infinity,
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    SizedBox(
                                      height: cubit.getScreenWidth(context) * .6,
                                    ),
                                    Expanded(
                                      child: Stack(
                                        alignment: Alignment.topCenter,
                                        children: [
                                          Container(
                                            color: Colors.white,
                                            width: double.infinity,
                                            // height: double.infinity,
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: cubit.getScreenWidth(context) *
                                                      .125,
                                                ),
                                                const Text(
                                                  'Abdelrahman Shetiah',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 20),
                                                ),
                                                Text(
                                                  'abdelrahman_hussein20',
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
                                                  mainAxisAlignment: MainAxisAlignment.center,

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
                                                    ) ,
                                                    SizedBox(
                                                      width:
                                                      cubit.getScreenWidth(context) * .04,
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
                                                  cubit.getScreenWidth(context) * .1,
                                                ),
                                                Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Text(
                                                      'Your bio .......',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyLarge,
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ],
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
                                    child: CircleAvatar(
                                        radius: cubit.getScreenWidth(context) * .12,
                                        backgroundImage:const CachedNetworkImageProvider(
                                          'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?w=1800&t=st=1707843139~exp=1707843739~hmac=e6ed56d6d76aa9022c107e2a04231bf2e46473180d12c9f32a4ffdb198c904c0',
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
