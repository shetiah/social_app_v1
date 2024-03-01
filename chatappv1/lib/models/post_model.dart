class PostModel {
 String ?uId;
 late String image;
 String ?caption;
 late String date;
 Map<String,String> comments={};
 Map<String,String> likes={};
 List<String> hashtags=[];
 PostModel(String image)   {
   this.image=image;
  date=DateTime.now().toString();
 }
  PostModel.fromJson(Map<String, dynamic> ?model) {
    image = model?['image'];
    caption = model?['caption'];
    uId = model?['uId'];
    comments=model?['comments'];
    date=model?['date'];
    likes=model?['likes'];
    hashtags=model?['hashtags'];

  }
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'caption': caption,
      'uId': uId,
      'comments': comments,
      'date': date,
      'likes': likes,
      'hashtags': hashtags,
    };
  }
}