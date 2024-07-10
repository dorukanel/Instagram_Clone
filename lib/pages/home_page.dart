import 'package:flutter/material.dart';
import 'package:sample/pages/profile_page.dart';
class HomePage extends StatefulWidget {

  //final String title ;
  @override
  State<HomePage> createState() => _HomePageState();
   HomePage(
      {super.key}); // title added to constructor


}

class _HomePageState extends State<HomePage> {

  int currentPage = 0;
  List<String> profileImages = [
    "assets/images/1.jpg",
    "assets/images/2.jpg",
    "assets/images/3.jpg",
    "assets/images/4.jpg",
    "assets/images/5.jpg",
    "assets/images/6.jpg",
    "assets/images/7.jpg",
    "assets/images/8.jpg",
    "assets/images/9.jpg",
    "assets/images/10.jpg"
  ];
  List<String> posts = [
    "assets/images/post_1.jpg",
    "assets/images/post_2.jpg",
    "assets/images/post_3.jpg",
    "assets/images/post_4.jpg",
    "assets/images/post_6.jpg",
    "assets/images/post_7.jpg",
    "assets/images/post_8.jpg",
    "assets/images/post_9.jpg",
    "assets/images/post_10.jpg"
  ];
  Future<void> onRefresh()async{
    await Future.delayed(Duration(seconds: 1));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Image.asset("assets/images/insta_title.png", height: 200, width: 150),
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
                            backgroundImage: const AssetImage("assets/images/story.jpg"),
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
                            backgroundImage: const AssetImage("assets/images/story.jpg"),
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
      )
     )
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            const Spacer(),
            IconButton(
              icon: Icon(Icons.home,
                  color: currentPage == 0
                      ? const Color.fromRGBO(203, 73, 101, 1)
                      : const Color.fromRGBO(40, 40, 40, 1)),
              onPressed: () {
                setState(() {
                  currentPage = 0;
                });
              },
            ),
            const Spacer(),
            IconButton(
              icon: Icon(Icons.search,
                  color: currentPage == 1
                      ? const Color.fromRGBO(203, 73, 101, 1)
                      : const Color.fromRGBO(40, 40, 40, 1)),
              onPressed: () {
                setState(() {
                  currentPage = 1;
                });
              },
            ),
            const Spacer(),
            IconButton(
              icon: Icon(Icons.ondemand_video,
                  color: currentPage == 2
                      ? const Color.fromRGBO(203, 73, 101, 1)
                      : const Color.fromRGBO(40, 40, 40, 1)),
              onPressed: () {
                setState(() {
                  currentPage = 2;
                });
              },
            ),
            const Spacer(),
            IconButton(
              icon: Icon(Icons.card_travel,
                  color: currentPage == 3
                      ? const Color.fromRGBO(203, 73, 101, 1)
                      : const Color.fromRGBO(40, 40, 40, 1)),
              onPressed: () {
                setState(() {
                  currentPage = 3;
                });
              },
            ),
            const Spacer(),
            IconButton(
              icon: Icon(Icons.person,
                  color: currentPage == 4
                      ? const Color.fromRGBO(203, 73, 101, 1)
                      : const Color.fromRGBO(40, 40, 40, 1)),
              onPressed: () {
                setState(() {
                  currentPage = 4;
                });
                // Navigate to the ProfilePage
                if (currentPage == 4) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                }
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
