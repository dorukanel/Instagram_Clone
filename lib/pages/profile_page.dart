import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For picking images

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ImagePicker picker = ImagePicker();
  XFile? _image; // For storing the picked image

  // Function to handle image picking
  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: ListView(
        children: <Widget>[
          _buildProfileImage(),

        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 50,
          //  backgroundImage: _image != null ? FileImage(File(_image!.path)) : null,
            child: _image == null ? Icon(Icons.add_a_photo) : null,
          ),
          ElevatedButton(
            onPressed: _pickImage,
            child: Text('Change Profile Photo'),
          ),
        ],
      ),
    );
  }


}
