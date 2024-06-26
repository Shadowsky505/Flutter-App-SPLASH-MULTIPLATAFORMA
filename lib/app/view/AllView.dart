import 'package:flutter/material.dart';
import 'package:sem9_lab_ver2/app/view/MyHomePage.dart';
import "package:lottie/lottie.dart";

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: Center(child: 
        Lottie.asset("assets/anima1.json")
      ),
    );
  }
}

class ContactsView extends StatelessWidget {
  const ContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: Center(child: Lottie.asset("assets/anima2.json")),
    );
  }
}

class LibraryView extends StatelessWidget {
  const LibraryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseView(
      body: Center(child: Text("Library View")),
    );
  }
}

class BaseView extends StatelessWidget {
  final Widget body;
  const BaseView({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          _buildNavItem(context, Icons.home, const MainPage()),
          _buildNavItem(context, Icons.star, const FavoritesView()),
          _buildNavItem(context, Icons.phone, const ContactsView()),
          _buildNavItem(context, Icons.note_add_sharp, const LibraryView()),
        ],
        selectedItemColor: Colors.tealAccent,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
      BuildContext context, IconData icon, Widget view) {
    return BottomNavigationBarItem(
      icon: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => view),
          );
        },
        child: Icon(icon),
      ),
      label: '',
    );
  }
}
