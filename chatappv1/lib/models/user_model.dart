import 'package:chatappv1/models/post_model.dart';

class UserModel {
  late String name;
  late String email;
  late String uId;
  late String userName;
   String img='none';
   String coverImg='none';
   String bio='none';

  List<Post> myPosts = [];
  List<UserModel> friends = [];

  UserModel(
      this.name, this.email, this.uId, this.userName, this.img, this.coverImg,this.bio);

  UserModel.fromJson(Map<String, dynamic>? model) {
    name = model?['name'];
    email = model?['email'];
    uId = model?['uId'];
    userName = model?['userName'];
    img = model?['img'];
    coverImg = model?['coverImg'];
    // myPosts = model?['myPosts'];
    // friends = model?['friends'];
    bio=model?['bio'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
      'userName': userName,
      'img': img,
      'coverImg': coverImg,
      'myPosts': {},
      'friends': {},
      'bio' :bio
    };
  }
}
