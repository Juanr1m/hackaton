import 'package:cactus_jobs/constants.dart';
import 'package:cactus_jobs/screens/messages_screen/messages_screen.dart';
import 'package:cactus_jobs/screens/profile_screen/profile_screen.dart';
import 'package:cactus_jobs/screens/sign_in/sign_in.dart';
import 'package:cactus_jobs/screens/sign_up/components/body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/body.dart';

class HomePage extends StatefulWidget {
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

  Icon _appBarIcon(int index) {
    if (index == 0) {
      return Icon(
        Icons.add,
        color: Colors.black,
      );
    } else if (index == 1) {
      return Icon(
        Icons.contacts_outlined,
        color: Colors.black,
      );
    }
    return Icon(
      Icons.edit,
      color: Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
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
        actions: [
          IconButton(
            icon: _appBarIcon(_selectedIndex),
            onPressed: () {},
            iconSize: 30,
          ),
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
                  'employer@gmail.com',
                  style: GoogleFonts.montserrat(color: Colors.white),
                ),
                accountName: Text('Ваня Иванов',
                    style: GoogleFonts.montserrat(
                        color: Colors.white, fontSize: 16)),
                currentAccountPicture: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/rick.jpg'),
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInScreen(),
                    ));
              },
              trailing: Icon(Icons.exit_to_app),
            ),
          ],
        ),
      ),
    );
  }
}
