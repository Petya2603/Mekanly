// import 'dart:convert';

// import 'package:gallery_saver_plus/files.dart';

// import '../comment/commet_model.dart';

// Future<List<Comment>> fetchComments(int id, String type, String token) async {
//   final response = await http.get(
//     Uri.parse('https://mekanly.com.tm/api/v2/comments/0/10?id=$id&type=$type'),
//     headers: {
//       'Authorization': 'Bearer $token',
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//     },
//   );
  
//   if (response.statusCode == 200) {
//     final data = jsonDecode(response.body);
//     // data parsing kodu buraya
//     return parseComments(data);
//   } else {
//     throw Exception('Failed to load comments');
//   }
// }
