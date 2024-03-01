import 'package:chatappv1/models/post_model.dart';

class UserModel {
  late String name;
  late String email;
  late String uId;
  late String userName;
   String img='none';
   String coverImg='none';
   String bio='none';

  Map<String,PostModel> myPosts = {};
  Map<String,UserModel> followingList = {};
  Map<String,UserModel> followersList = {};

  UserModel(
      this.name, this.email, this.uId, this.userName, this.img, this.coverImg,this.bio);

  UserModel.fromJson(Map<String, dynamic>? model) {
    name = model?['name'];
    email = model?['email'];
    uId = model?['uId'];
    userName = model?['userName'];
    img = model?['img'];
    coverImg = model?['coverImg'];
    // followersList=model?['followers-list'];
    // followingList=model?['following-list'];
    // myPosts=model?['posts'];
    bio=model?['bio'];
  }

  UserModel.followingFromJson(Map<String, dynamic> followersListJson){
    followersList.forEach((key, value) {
    // this.followersList.addAll()
  });
    for(int i =0;i<followersListJson.length;i++)
      {

      }
  }
  // UserModel.followingFromJson(Map<String, dynamic>? followingListJson){
  //
  // }
  //
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
      'userName': userName,
      'img': img,
      'coverImg': coverImg,
      'posts': myPosts.keys.toList(),
      'following-list': followingList.keys.toList(),
      'followers-list': followersList.keys.toList(),
      'bio' :bio
    };
  }
}
