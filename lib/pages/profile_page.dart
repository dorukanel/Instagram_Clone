import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For picking images

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ImagePicker picker = ImagePicker();
  XFile? _image; // For storing the picked image



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: ListView(
        children: <Widget>[


        ],
      ),
    );
  }




}
