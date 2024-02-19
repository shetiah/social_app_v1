import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../shared/components/constants/const.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({super.key,required this.imgUrl});
 final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
        radius: MediaQuery.of(context).size.width * .18,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          backgroundImage:
          CachedNetworkImageProvider((imgUrl ==
              'none')
              ? 'https://img.freepik.com/free-vector/sharing-content-social-media-with-man-smartphone_23-2148518566.jpg?size=626&ext=jpg&ga=GA1.1.1374943836.1707644974&semt=ais'
              : imgUrl),
          radius:
          MediaQuery.of(context).size.width* .17,
        ));

  }
}
