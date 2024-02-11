import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: cubit.getScreenWidth(context)*.006),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 5.0,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          const Image(
                            image: NetworkImage(
                              'https://img.freepik.com/free-photo/metaverse-concept-collage-design_23-2149419860.jpg?w=1800&t=st=1707645438~exp=1707646038~hmac=9fa4dc3adaf790326c80c5d46261b4d4e420eefcd88e915f24e6541c12cc40b6',
                            ),
                            fit: BoxFit.cover,
                            height: 200.0,
                            width: double.infinity,
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
                    // ListView.separated(
                    //   shrinkWrap: true,
                    //   physics: NeverScrollableScrollPhysics(),
                    //   itemBuilder: (context, index) => buildPostItem(SocialCubit.get(context).posts[index],context),
                    //   separatorBuilder: (context, index) => SizedBox(
                    //     height: 8.0,
                    //   ),
                    //   itemCount:cubit.posts.length,
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ));
      },
    );
  }
}
