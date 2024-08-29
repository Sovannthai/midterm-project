import 'package:flutter/material.dart';

class NavbarScreen extends StatelessWidget {
  const NavbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('HE Sovannthai'),
            accountEmail: const Text('Sovannthai@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/thai.jpg',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(color: Color.fromARGB(255, 228, 55, 197)),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.discount),
            title: const Text('Promotion'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.notifications),
            title: const Text('Notification'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.person_add_alt),
            title: const Text('Invite Friends'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.question_answer),
            title: const Text('Feedback?'),
          ),
           ListTile(
            onTap: () {},
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Term & Conditions'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.person),
            title: const Text('About Us'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.logout),
            title: const Text('Log out'),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
