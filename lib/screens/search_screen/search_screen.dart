import 'package:cactus_jobs/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static String routeName = '/search';
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          cursorColor: kSecondaryColor,
          autofocus: true,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          onChanged: (value) {
            setState(() {
              name = value;
            });
          },
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: StreamBuilder(
        stream: (name != "" && name != null)
            ? FirebaseFirestore.instance
                .collection('offers')
                .where('title', arrayContains: name)
                .snapshots()
            : FirebaseFirestore.instance.collection('offers').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              DocumentSnapshot data = snapshot.data.documents[index];
              return Card(
                child: Text(data['title']),
              );
            },
          );
        },
      ),
    );
  }
}
