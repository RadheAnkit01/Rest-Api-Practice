import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final url = "https://reqres.in/api/login";
  final apikey = "reqres_549e4f066b784321a73b08e611ccb10b";

  login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'x-api-key': apikey},
        body: {'email': email, 'password': password},
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("Login Token : " + data['token']);
        print('Login Successfully');
      } else {
        print('Wrong Credentials');
      }
    } catch (e) {
      print('Something Wrong');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          spacing: 15,

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hint: Text('Email - eve.holt@reqres.in'),
              ),
            ),
            TextField(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(hint: Text('Password - pistol')),
            ),
            ElevatedButton(
              onPressed: () {
                login(emailController.text, passwordController.text);
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
