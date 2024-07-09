import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> profileImages = [
    "images/1.jpg",
    "images/2.jpg",
    "images/3.jpg",
    "images/4.jpg",
    "images/5.jpg",
    "images/6.jpg",
    "images/7.jpg",
    "images/8.jpg",
    "images/9.jpg",
    "images/10.jpg"
  ];
  List<String> posts = [
    "images/post_1.jpg",
    "images/post_2.jpg",
    "images/post_3.jpg",
    "images/post_4.jpg",
    "images/post_6.jpg",
    "images/post_7.jpg",
    "images/post_8.jpg",
    "images/post_9.jpg",
    "images/post_10.jpg"
  ];
  Future<void> onRefresh()async{
    await Future.delayed(Duration(seconds: 1));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Image.asset("images/insta_title.png", height: 200, width: 150),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.add_circle_outline)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.chat_bubble_outline))
          ]),
      body: RefreshIndicator(
     onRefresh:onRefresh,
     child: SingleChildScrollView(
          child: Column(
        children: [
          //Story
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  10,
                  (index) => Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(children: [
                        CircleAvatar(
                            radius: 50,
                            backgroundImage: const AssetImage("images/story.jpg"),
                            child: CircleAvatar(
                              radius: 44,
                              backgroundImage: AssetImage(profileImages[index]),
                            )),
                        const SizedBox(height: 10),
                        Text("Profile Name " + "$index",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black87,
                            ))
                      ])),
                ),
              )),
          const Divider(),
          Column(
            children: List.generate(
              8,
              (index) => Column(
                children: [
                  //Header Post
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: CircleAvatar(
                            radius: 30,
                            backgroundImage: const AssetImage("images/story.jpg"),
                            child: CircleAvatar(
                              radius: 24,
                              backgroundImage: AssetImage(profileImages[index]),
                            )),
                      ),
                      const Text("Profile Name"),
                      const Spacer(),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
                    ],
                  ),
                  //Image post
                  Image.asset(posts[index]),
                  // Footer Post
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.favorite_border)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.chat_bubble_outline)),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.label_outline)),
                      const Spacer(),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.bookmark_border)),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(text: "Liked by"),
                              TextSpan(
                                text: " Profile Name",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: " and"),
                              TextSpan(
                                text: " others",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: " Profile Name",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: " This is a great picture! "),
                            ],
                          ),
                        ),
                        const Text("View all 12 comments",style:TextStyle(color: Colors.black38))
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ))),
    );
  }
}
