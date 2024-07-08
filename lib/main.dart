import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        iconTheme: IconThemeData(color: Color.fromRGBO(40, 40, 40, 1)),
        appBarTheme: AppBarTheme(
            elevation: 1,
            color: Colors.white,
            iconTheme: IconThemeData(color: Color.fromRGBO(40, 40, 40, 1))),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "lale"), // title parametresini ekliyoruz
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage(
      {super.key,
      required this.title}); // title parametresini constructor'a ekliyoruz

  final String title; // title'ı bir instance değişkeni olarak tanımlıyoruz

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
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
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
