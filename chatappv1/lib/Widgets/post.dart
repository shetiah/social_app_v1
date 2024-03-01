import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatappv1/shared/components/constants/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/post_model.dart';
import '../shared/cubit/app_cubit/cubit.dart';

class Post extends StatefulWidget {
const  Post(
      {super.key,
      required this.model,
      required this.userName,
      required this.userProfile,required this.onLike});

  final PostModel model;
  final String userName;
  final String userProfile;
  final Function onLike;
  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  int? maxLines = 4;
  bool textExpand = false;
  Color likeIconColor=Colors.black26;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppCubit.get(context).getScreenWidth(context) * 0.02),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5.0,
        // color: Colors.grey,
        child: Padding(
          padding: EdgeInsets.all(
              AppCubit.get(context).getScreenWidth(context) * .03),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                        radius:
                            AppCubit.get(context).getScreenWidth(context) * .1,
                        backgroundColor: Colors.blue,
                        backgroundImage: CachedNetworkImageProvider((widget
                                    .userProfile ==
                                'none')
                            ? 'https://img.freepik.com/free-vector/sharing-content-social-media-with-man-smartphone_23-2148518566.jpg?size=626&ext=jpg&ga=GA1.1.1374943836.1707644974&semt=ais'
                            : widget.userProfile)),
                    SizedBox(
                        width: AppCubit.get(context).getScreenWidth(context) *
                            .03),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.userName,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                )),
                        Text(widget.model.date,
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
                      AppCubit.get(context).getScreenWidth(context) * .03),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 5.0,
                    child: Image(
                      image: CachedNetworkImageProvider(
                        widget.model.image,
                      ),
                      fit: BoxFit.cover,
                      height:
                          AppCubit.get(context).getScreenHeight(context) * .32,
                      width: double.infinity,
                    ),
                  ),
                ),
                SizedBox(
                  height: AppCubit.get(context).getScreenWidth(context) * .04,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(widget.userName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                      ],
                    ),
                    SizedBox(
                      height:
                          AppCubit.get(context).getScreenWidth(context) * .03,
                    ),
                    Wrap(
                      children: [
                        Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                          style: TextStyle(
                            overflow: (!textExpand)? TextOverflow.ellipsis:null,
                          ),
                          maxLines: maxLines,
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (textExpand) {
                                      maxLines = 4;
                                    } else {
                                      maxLines = null;
                                    }
                                    textExpand = !textExpand;
                                  });
                                },
                                child: (!textExpand)
                                    ? const Text(
                                        'show more',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold
                                        ),
                                      )
                                    :const  Text('show less',style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                            )))
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: AppCubit.get(context).getScreenWidth(context) * .04,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: (){
                          setState(() {
                            widget.onLike;
                            if(likeIconColor==Colors.black26)
                            {
                              likeIconColor=defaultColor;
                            }
                            else{
                              likeIconColor=Colors.black26;
                            }
                          });
                          },
                          child:  Icon(
                            Icons.heart_broken_sharp,
                            color: likeIconColor,
                            // color: Colors.red,
                          ),
                        ),
                        SizedBox(
                          width: AppCubit.get(context).getScreenWidth(context) *
                              .03,
                        ),
                        Text(
                          widget.model.likes.length.toString(),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: AppCubit.get(context).getScreenWidth(context) *
                              .01,
                        ),
                      const  Text(
                          'Likes',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      width:
                          AppCubit.get(context).getScreenWidth(context) * .04,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.comment_sharp,
                        ),
                        SizedBox(
                          width: AppCubit.get(context).getScreenWidth(context) *
                              .03,
                        ),
                        Text(
                          widget.model.comments.length.toString(),
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: AppCubit.get(context).getScreenWidth(context) *
                              .01,
                        ),
                      const  Text(
                          'Comments',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                       const Icon(
                          Icons.ios_share,
                        ),
                        SizedBox(
                          width: AppCubit.get(context).getScreenWidth(context) *
                              .01,
                        ),
                      const  Icon(
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
    );
  }
}
