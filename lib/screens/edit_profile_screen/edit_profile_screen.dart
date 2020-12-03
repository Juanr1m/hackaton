import 'package:cactus_jobs/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    return Scaffold(
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
            onPressed: () {},
            child: Text(
              'Сохранить',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/rick.jpg'),
                            fit: BoxFit.fitHeight)),
                  ),
                  Icon(Icons.edit),
                ],
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
