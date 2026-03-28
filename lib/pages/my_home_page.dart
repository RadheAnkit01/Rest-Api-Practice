import 'package:flutter/material.dart';
import 'package:rest_api/pages/login_page.dart';
import 'package:rest_api/pages/post_page.dart';
import 'package:rest_api/pages/user_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Data')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Get Api',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PostPage()),
                );
              },
              child: Text('Fetch Posts from api'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserPage()),
                );
              },
              child: Text('Fetch Users from api'),
            ),
            Divider(),
            Text(
              'Post Api',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Login using api'),
            ),
          ],
        ),
      ),
    );
  }
}
