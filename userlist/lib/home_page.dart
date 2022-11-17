import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isLoaded = false;
  Map? data;
  List? usersData;

  getUser() async {
    http.Response response =
        await http.get(Uri.parse('http://localhost:4000/api/users/'));
    data = json.decode(response.body);
    // print(response.body);
    setState(() {
      usersData = data!['users'];
    });
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        backgroundColor: Colors.indigo[900],
      ),
      body: ListView.builder(
        itemCount: usersData == null ? 0 : usersData?.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "$index",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(usersData![index]['avatar']),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "${usersData![index]["firstName"]} ${usersData![index]["lastName"]}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
