class Post {
 String userName;
 String userAvatar;
 String image;
 String caption;
 String date;
  List<String> comments=[];
  int likes=0;
  bool likedByUser=false;
  bool savedByUser=false;
  bool isHashtags=false;
  List<String> hashtags=[];

 Post(this.userName, this.userAvatar, this.image,this.caption,this.date);

//
  // Post.fromJson(Map<String, dynamic> ?model) {
  //   name = model?['name'];
  //   phone = model?['phone'];
  //   email = model?['email'];
  //   uId = model?['uId'];
  //   emailVerfied = model?['emailVerfied'];
  // }
  //
  // Map<String, dynamic> toMap() {
  //   return {
  //     'name': name,
  //     'phone': phone,
  //     'email': email,
  //     'uId': uId,
  //     'emailVerfied': emailVerfied
  //   };
  // }
}