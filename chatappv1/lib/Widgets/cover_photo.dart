import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class CoverPhoto extends StatelessWidget {
  const CoverPhoto({super.key,required this.imgUrl});

 final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: double.infinity,
        child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image(
            image: CachedNetworkImageProvider((imgUrl ==
                'none')
                ? 'https://img.freepik.com/free-photo/portrait-charming-brunet-men-white-tshirts-jeans-isolated-man-orange-jacket-show-thump-up-guy-checkered-shirt-show-peace-sign_197531-29589.jpg?w=1800&t=st=1707842534~exp=1707843134~hmac=eed91cb9cc45b18a19649e6468e0d6d768d9d4f07fff23febd39e042bddd974c'
                :imgUrl),
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * .32,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
