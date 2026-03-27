import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/Models/user_modal.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<UserModal> usersList = [];
  final urlUsers = "https://jsonplaceholder.typicode.com/users";
  Future<List<UserModal>> getUsersFromApi() async {
    final response = await http.get(
      Uri.parse(urlUsers),
      headers: {"User-Agent": "Mozilla/5.0", "Accept": "application/json"},
    );

    if (response.statusCode == 200) {
      usersList = userModalFromJson(response.body);
      // print(usersList);
      print(response.statusCode);
      return usersList;
    } else {
      print(response.statusCode);
      throw Exception("Failed to load data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Users')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: FutureBuilder(
                future: getUsersFromApi(),

                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Text('Error');
                  }
                  if (!snapshot.hasData) {
                    return Text("No Data Found");
                  }

                  final data = snapshot.data;

                  return ListView.builder(
                    itemCount: usersList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 350,
                        height: 270,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 20,
                        ),
                        margin: EdgeInsets.all(10),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                'Name : ' + usersList[index].name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Divider(),

                            Text('ID : ' + usersList[index].id.toString()),
                            Text('Username : ' + usersList[index].username),
                            Text('Email : ' + usersList[index].email),
                            Text(
                              'Address : ' +
                                  usersList[index].address.street +
                                  " " +
                                  usersList[index].address.suite +
                                  " " +
                                  usersList[index].address.city,
                            ),
                            Text(
                              'Zipcode : ' + usersList[index].address.zipcode,
                            ),
                            Text(
                              'Location',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Longitude : ' +
                                      usersList[index].address.geo.lng,
                                ),
                                SizedBox(width: 15),
                                Text(
                                  'Longitude : ' +
                                      usersList[index].address.geo.lng,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
