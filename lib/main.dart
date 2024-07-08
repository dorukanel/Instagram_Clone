import 'package:flutter/material.dart';

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
 int currentPage=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Spacer(),
            IconButton(
              icon: Icon(Icons.home, color: currentPage ==0 ? Color.fromRGBO(203, 73, 101, 1):Color.fromRGBO(40, 40, 40, 1)),
              onPressed: () {setState(() {
                currentPage = 0;
              });},
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.search,color: currentPage ==1 ? Color.fromRGBO(203, 73, 101, 1):Color.fromRGBO(40, 40, 40, 1)),
              onPressed: () {setState(() {
                currentPage = 1;
              });},
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.ondemand_video,color: currentPage ==2 ? Color.fromRGBO(203, 73, 101, 1):Color.fromRGBO(40, 40, 40, 1)),
              onPressed: () {setState(() {
                currentPage = 2;
              });},
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.card_travel,color: currentPage ==3 ? Color.fromRGBO(203, 73, 101, 1):Color.fromRGBO(40, 40, 40, 1)),
              onPressed: () {setState(() {
                currentPage = 3;
              });},
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.person,color: currentPage ==4 ? Color.fromRGBO(203, 73, 101, 1):Color.fromRGBO(40, 40, 40, 1)),
              onPressed: () {setState(() {
                currentPage = 4;
              });},
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
