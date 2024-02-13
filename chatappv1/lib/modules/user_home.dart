import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/components/components/my_main_components.dart';
import '../shared/cubit/app_cubit/cubit.dart';
import '../shared/cubit/app_cubit/states.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
            body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: cubit.getScreenWidth(context) * .006),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 5.0,
                        child: Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                             CachedNetworkImage(
                               key:UniqueKey(),
                              fit: BoxFit.cover,
                              height: 200.0,
                              width: double.infinity,
                              imageUrl:'https://img.freepik.com/free-photo/metaverse-concept-collage-design_23-2149419860.jpg?w=1800&t=st=1707645438~exp=1707646038~hmac=9fa4dc3adaf790326c80c5d46261b4d4e420eefcd88e915f24e6541c12cc40b6',
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'communicate with friends',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: cubit.getScreenWidth(context) * .04,
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 5.0,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: cubit.getScreenWidth(context) * .01,
                            right: cubit.getScreenWidth(context) * .03,
                            top: cubit.getScreenWidth(context) * .03,
                            bottom: cubit.getScreenWidth(context) * .03,
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: cubit.getScreenWidth(context) * .08,
                                backgroundColor: Colors.blue,
                                backgroundImage: CachedNetworkImageProvider( 'https://img.freepik.com/free-photo/portrait-serious-young-businessman-glasses_1262-3810.jpg?w=1800&t=st=1707831312~exp=1707831912~hmac=ca308542d839cd7364cb0739c3f9fe58f26ac5b16baee0b62ef11205fb487020'),
                              ),
                             SizedBox(
                                width: cubit.getScreenWidth(context) * .02,
                              ),
                            const  Text(
                                "What's on your mind ?",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Spacer(),
                              Icon(Icons.edit),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: cubit.getScreenWidth(context) * .04,
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 5.0,
                        // color: Colors.grey,
                        child: Padding(
                          padding: EdgeInsets.all(
                              cubit.getScreenWidth(context) * .03),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius:
                                          cubit.getScreenWidth(context) * .1,
                                      backgroundColor: Colors.blue,
                                      backgroundImage: const CachedNetworkImageProvider( 'https://img.freepik.com/free-photo/portrait-serious-young-businessman-glasses_1262-3810.jpg?w=1800&t=st=1707831312~exp=1707831912~hmac=ca308542d839cd7364cb0739c3f9fe58f26ac5b16baee0b62ef11205fb487020'),

                                    ),
                                    SizedBox(
                                        width: cubit.getScreenWidth(context) *
                                            .03),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Abdelrahman shetiah ',
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
                                      cubit.getScreenWidth(context) * .03),
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    elevation: 5.0,
                                    child: Image(
                                      image: CachedNetworkImageProvider( 'https://img.freepik.com/free-photo/portrait-serious-young-businessman-glasses_1262-3810.jpg?w=1800&t=st=1707831312~exp=1707831912~hmac=ca308542d839cd7364cb0739c3f9fe58f26ac5b16baee0b62ef11205fb487020'),

                                      fit: BoxFit.cover,
                                      height:
                                          cubit.getScreenHeight(context) * .32,
                                      width: double.infinity,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: cubit.getScreenWidth(context) * .04,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text('Abdelrahaman shetiah',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15)),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          cubit.getScreenWidth(context) * .03,
                                    ),
                                     Wrap(
                                      children: [
                                        Text(
                                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                                            style:TextStyle(

                                            ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 4,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: cubit.getScreenWidth(context) * .04,
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.heart_broken_sharp,
                                        ),
                                        SizedBox(
                                          width: cubit.getScreenWidth(context) *
                                              .03,
                                        ),
                                        const Text(
                                          '273',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: cubit.getScreenWidth(context) *
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
                                          cubit.getScreenWidth(context) * .04,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.comment_sharp,
                                        ),
                                        SizedBox(
                                          width: cubit.getScreenWidth(context) *
                                              .03,
                                        ),
                                        const Text(
                                          '23',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: cubit.getScreenWidth(context) *
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
                                          width: cubit.getScreenWidth(context) *
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
                      ),

                      // buildPostItem()
                      // buildPostItem(
                      //
                      // ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => buildPostItem(
                            AppCubit.get(context).posts[index], context),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 8.0,
                        ),
                        itemCount: AppCubit.get(context).posts.length,
                      ),
                      SizedBox(
                        height: cubit.getScreenHeight(context) * .1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
      },
    );
  }
}
