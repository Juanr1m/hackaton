import 'dart:io';

import 'package:cactus_jobs/models/userModel.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants.dart';

class EditProfileScreen extends StatefulWidget {
  static String routeName = '/editProfile';

  const EditProfileScreen({Key key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController _fullName = TextEditingController();
  TextEditingController _country = TextEditingController();
  TextEditingController _profession = TextEditingController();

  File _image;

  _imgFromCamera() async {
    final _picker = ImagePicker();
    PickedFile pickedImage =
        await _picker.getImage(source: ImageSource.camera, imageQuality: 50);
    final File image = File(pickedImage.path);
    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    final _picker = ImagePicker();
    PickedFile pickedImage =
        await _picker.getImage(source: ImageSource.gallery, imageQuality: 50);
    final File image = File(pickedImage.path);
    setState(() {
      _image = image;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Галерея'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Камера'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> uploadPic() async {
    try {
      Reference ref = FirebaseStorage.instance.ref('users/file.png');

      await ref.putFile(_image);
      UserModel _user = UserModel(
        displayImage: await ref.getDownloadURL(),
      );
      await savePicToFirestore(_user);
    } catch (e) {
      print(e);
    }
  }

  Future<bool> savePicToFirestore(UserModel user) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser.uid)
          .update({'displayImage': user.displayImage});
      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height / 15,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              var currentUserUid = FirebaseAuth.instance.currentUser.uid;
              var userDoc = FirebaseFirestore.instance
                  .collection('users')
                  .doc(currentUserUid);
              if (_fullName.text != '') {
                await userDoc.update({'fullName': _fullName.text.trim()});
              }
              if (_country.text != '') {
                await userDoc.update({'country': _country.text.trim()});
              }
              if (_profession.text != '') {
                await userDoc.update({'profession': _profession.text.trim()});
              }
              if (_image != null) {
                await uploadPic();
              }
              Navigator.pop(context);
            },
            child: Text(
              'Сохранить',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    _showPicker(context);
                  },
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.width / 3,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(user.displayImage),
                              fit: BoxFit.fitHeight),
                        ),
                      ),
                      Icon(Icons.edit),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              Align(
                alignment: Alignment.center,
                child: Text(
                  user.email,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              EditProgileField(
                label: 'Имя',
                hint: user.fullName,
                controller: _fullName,
              ),
              SizedBox(height: 25),
              EditProgileField(
                label: 'Город',
                hint: user.country,
                controller: _country,
              ),
              SizedBox(height: 25),
              EditProgileField(
                label: 'Профессия',
                hint: user.profession,
                controller: _profession,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.bottomCenter,
                    image: AssetImage('assets/Charco - Picture Art.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditProgileField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;

  const EditProgileField({
    Key key,
    this.label,
    this.hint,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: Colors.black),
            gapPadding: 10,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: kPrimaryColor),
            gapPadding: 10,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: Colors.grey),
            gapPadding: 10,
          ),
          labelText: label,
          labelStyle: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
          hintText: hint,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}
