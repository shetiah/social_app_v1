import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatappv1/models/user_model.dart';
import 'package:chatappv1/modules/other_users_screen.dart';
import 'package:chatappv1/shared/components/components/my_main_components.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard(
     {
    super.key, required this.model,
  });

  final UserModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.width * .01,
              bottom: MediaQuery.of(context).size.width * .01,
              left: MediaQuery.of(context).size.width * .002,
            ),
            child: InkWell(
              onTap: (){
                navigateTo(context, OtherUser(model: model));
              },
              child: Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width * .01),
                  Container(
                    width: MediaQuery.of(context).size.width * .21,
                    height: MediaQuery.of(context).size.width * .2,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: model.img,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * .02),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(model.name,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          )),
                      SizedBox(height: MediaQuery.of(context).size.width * .01),
                      Text(model.userName,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
          // SizedBox(
          //     height:MediaQuery.of(context).size.width*.02
          // )
        ],
      ),
    );
  }
}
