import 'dart:convert';
import 'package:http/http.dart' as http;

class Post {
  final String id;
  final String uid;
  final String image;
  final String caption;
  final String date;

  Post({
    required this.id,
    required this.uid,
    required this.image,
    required this.caption,
    required this.date,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      uid: json['uid'],
      image: json['image'],
      caption: json['caption'],
      date: json['date'],
    );
  }
}

class ApiResponse {
  final bool error;
  final String message;
  final List<Post> posts;

  ApiResponse({
    required this.error,
    required this.message,
    required this.posts,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    List<Post> postsList = (json['post'] as List)
        .map((postJson) => Post.fromJson(postJson))
        .toList();

    return ApiResponse(
      error: json['error'],
      message: json['message'],
      posts: postsList,
    );
  }
}

class ApiService {
  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse('https://barishloan.in/Bramhin/API/viewPost.php'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print(jsonData);
      final apiResponse = ApiResponse.fromJson(jsonData);
      return apiResponse.posts;
    } else {
      throw Exception('Failed to fetch posts');
    }
  }
}
