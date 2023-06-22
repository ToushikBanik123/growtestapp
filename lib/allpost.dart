import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growapp/post.dart';

import 'model/postModel.dart';

//
// class AllPostsPage extends StatefulWidget {
//   @override
//   _AllPostsPageState createState() => _AllPostsPageState();
// }
//
// class _AllPostsPageState extends State<AllPostsPage> {
//   //List<Post> _posts = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 2,
//         iconTheme: IconThemeData(color: Colors.black),
//         backgroundColor: Colors.orange[100],
//         title: Row(
//           children: [
//             Text('Home',style: TextStyle(color: Colors.black),),
//             Spacer(),
//             IconButton(onPressed: (){
//
//             }, icon: Icon(Icons.notifications_none_outlined,color: Colors.black,))
//           ],
//         ),
//       ),
//       body: Container(),
//       floatingActionButton: Container(
//         width: 130.sp,
//         child: FloatingActionButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => PostPage(),
//                 ),
//               );
//             },
//             backgroundColor: Colors.black,
//             child: Row(
//               children: [
//                 SizedBox(width: 5.w),
//                 Icon(Icons.add),
//                 SizedBox(width: 5.w),
//                 Text('Add Post'),
//               ],
//             ),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20.r),)
//         ),
//       ),
//     );
//   }
// }


class AllPostsPage extends StatefulWidget {
  @override
  _AllPostsPageState createState() => _AllPostsPageState();
}

class _AllPostsPageState extends State<AllPostsPage> {
  ApiService apiService = ApiService();
  late Future<List<Post>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = apiService.fetchPosts();
  }

  Future<void> _refreshPosts() async {
    setState(() {
      futurePosts = apiService.fetchPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.orange[100],
        title: Row(
          children: [
            Text(
              'Home',
              style: TextStyle(color: Colors.black),
            ),
            Spacer(),
            IconButton(
              onPressed: _refreshPosts,
              icon: Icon(
                Icons.refresh,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: FutureBuilder<List<Post>>(
          future: futurePosts,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              final posts = snapshot.data!;
              return RefreshIndicator(
                onRefresh: _refreshPosts,
                child: Container(
                  child: ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final post = posts[index];
                      return Card(
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 200, // Adjust the height as per your requirement
                              child: post.image.isNotEmpty
                                  ? Image.network("https://barishloan.in/Bramhin/Post/${post.image}")
                                  : Icon(Icons.image),
                            ),
                            ListTile(
                              title: Text(post.caption),
                              subtitle: Text(post.date),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.thumb_up),
                                        onPressed: () {
                                          // Handle like button action
                                        },
                                      ),
                                      Text('Like'),
                                    ],
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.comment),
                                    onPressed: () {
                                      // Handle comment button action
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.share),
                                    onPressed: () {
                                      // Handle share button action
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
                ,
              );
            } else {
              return Center(
                child: Text('No posts available.'),
              );
            }
          },
        ),
      ),
      floatingActionButton: Container(
        width: 130.sp,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostPage(),
              ),
            );
          },
          backgroundColor: Colors.black,
          child: Row(
            children: [
              SizedBox(width: 5.w),
              Icon(Icons.add),
              SizedBox(width: 5.w),
              Text('Add Post'),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
      ),
    );
  }
}



