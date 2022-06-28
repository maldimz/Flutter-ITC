import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomepagePost extends StatefulWidget {
  const HomepagePost({ Key? key }) : super(key: key);

  @override
  State<HomepagePost> createState() => _HomepagePostState();
}

class _HomepagePostState extends State<HomepagePost> {
  TextEditingController namaController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  String hasil = "Belum ada data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HTTP POST"),),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          TextField(
            controller: namaController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Name"
            ),
          ),

          SizedBox(height: 20,),

          TextField(
            controller: jobController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Job"
            ),
          ),

          SizedBox(height: 20,),
          ElevatedButton(onPressed: () async {

            var response = await http.post(Uri.parse("https://reqres.in/api/users/"),
            body: { "name": namaController.text, "job": jobController.text});

            var data = json.decode(response.body) as Map<String, dynamic>;
            print(data);
             setState(() {
               hasil = "${data['name']} -- ${data['job']}";
             });
          }, child: Text("Post")),
          SizedBox(height: 30,),
          Text(hasil)
        ],
      ),
      
    );
  }
}