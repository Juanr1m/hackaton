import 'package:cactus_jobs/constants.dart';
import 'package:cactus_jobs/models/userModel.dart';
import 'package:cactus_jobs/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:cactus_jobs/screens/messages_screen/messages_screen.dart';
import 'package:cactus_jobs/screens/profile_screen/profile_screen.dart';
import 'package:cactus_jobs/screens/sign_in/sign_in.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'components/body.dart';

class HomePage extends StatefulWidget {
  static String routename = '/home';
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _children = <Widget>[
    HomeBody(),
    MessagesScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  IconButton _appBarIcon(int index) {
    if (index == 0) {
      return IconButton(
        iconSize: 30,
        onPressed: () {},
        icon: Icon(
          Icons.add,
          color: Colors.black,
        ),
      );
    } else if (index == 1) {
      return IconButton(
        iconSize: 30,
        onPressed: () {},
        icon: Icon(
          Icons.contacts_outlined,
          color: Colors.black,
        ),
      );
    }
    return IconButton(
      iconSize: 30,
      onPressed: () {
        Navigator.pushNamed(context, EditProfileScreen.routeName);
      },
      icon: Icon(
        Icons.edit,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        iconSize: 28,
        selectedItemColor: kPrimaryColor,
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        elevation: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Сообщения',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Профиль',
          ),
        ],
        onTap: _onItemTapped,
      ),
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height / 15,
        actions: [
          _appBarIcon(_selectedIndex),
        ],
        leading: Builder(
          builder: (context) => IconButton(
            icon: new Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: _children[_selectedIndex],
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [kSecondaryColor, kPrimaryColor])),
                accountEmail: Text(
                  user.email,
                ),
                accountName: Text(user.fullName),
                currentAccountPicture: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(user.displayImage),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text('Создать резюме'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Для компаний'),
              onTap: () {},
            ),
            ListTile(
              title: Text('О нас'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Выйти из системы'),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, SignInScreen.routeName);
              },
              trailing: Icon(Icons.exit_to_app),
            ),
          ],
        ),
      ),
    );
  }
}
