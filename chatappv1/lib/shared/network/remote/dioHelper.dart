// import 'package:dio/dio.dart';

// class DioHelper {
//   static Dio? dio;

//   static init() {
//     dio = Dio(
//       BaseOptions(
//         //hena nta tgeeb link elappis bs
//         baseUrl: 'https://newsapi.org/',
//         //3shan yzhrha lama ykun fe error
//         receiveDataWhenStatusError: true,
//       ),
//     );
//   }

//   static Future<Response> getData({
//     //link el url elmwk3 msh elapi mn gher ?
//     //hat map el queries {key : value,key : value}
//     required String url,
//     required Map<String, dynamic> query,
//   }) async {
//     return await dio!.get(
//       url,
//       queryParameters: query,
//     );
//   }
// }
