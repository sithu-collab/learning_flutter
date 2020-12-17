import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Picker',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyHomePage> {
  File _image;
  final picker = ImagePicker();
  Future _imageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera, imageQuality: 50);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }else{
        print('No Image selected');
      }
    });
  }

  Future _imageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }else{
        print('No Image Selected');
      }
    });
  }
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: [
                  new ListTile(
                    leading: Icon(Icons.photo_library),
                    onTap: () {
                      _imageFromGallery();
                      Navigator.of(context).pop();
                    },
                    title: Text('Choose from gallery'),
                  ),
                  new ListTile(
                    leading: Icon(Icons.photo_camera),
                    onTap: () {
                      _imageFromCamera();
                      Navigator.of(context).pop();
                    },
                    title: Text('Choose from camera'),
                  )
                ],
              ),
            ),
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    _showPicker(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(55.0)
                    ),
                    child: CircleAvatar(
                      radius: 55.0,
                      backgroundColor: Colors.white,
                      child: _image != null
                          ? Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(
                              color: Colors.amber,
                              width: 1.0
                            ),
                            borderRadius: BorderRadius.circular(50.0)
                        ),
                            child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.file(_image, width: 105.0, height: 105.0, fit: BoxFit.fitWidth,)),
                          )
                          : Icon(Icons.camera_alt, color: Colors.grey[800], size: 25.0,),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'First Name',
                  contentPadding: EdgeInsets.only(left: 10.0),
                ),
              ),
              SizedBox(height: 10.0,),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Last Name',
                  contentPadding: EdgeInsets.only(left: 10.0),
                ),
              ),
              SizedBox(height: 10.0,),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Email Address',
                  contentPadding: EdgeInsets.only(left: 10.0),
                ),
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.red,
                child: Text('Submit', style: TextStyle(color: Colors.white),),
                onPressed: () {},
              )
            ],
          ),
      ),
    );
  }

}
