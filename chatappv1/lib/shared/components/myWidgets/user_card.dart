import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/const.dart';

class UserCard extends StatelessWidget {
  const UserCard(
      {super.key,
      required this.userName,
      required this.name,
      required this.imgUrl});

  final String userName;
  final String name;
  final String imgUrl;

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
            child: Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * .01),
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: MediaQuery.of(context).size.width * .21,
                  height: MediaQuery.of(context).size.width * .2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: imgUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * .02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        )),
                    SizedBox(height: MediaQuery.of(context).size.width * .01),
                    Text(userName,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        )),
                  ],
                )
              ],
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
