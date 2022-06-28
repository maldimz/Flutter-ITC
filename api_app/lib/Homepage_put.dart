import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomepagePut extends StatefulWidget {
  const HomepagePut({ Key? key }) : super(key: key);

  @override
  State<HomepagePut> createState() => _HomepagePutState();
}

class _HomepagePutState extends State<HomepagePut> {
  TextEditingController namaController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  String hasil = "Belum ada data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HTTP PUT"),),
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

            var response = await http.patch(Uri.parse("https://reqres.in/api/users/2"),
            body: { "name": namaController.text, "job": jobController.text});

            var data = json.decode(response.body) as Map<String, dynamic>;
            print(response.statusCode);
             setState(() {
               hasil = "${data['name']} -- ${data['job']}";
             });
          }, child: Text("Put")),
          SizedBox(height: 30,),
          Text(hasil)
        ],
      ),
    );
  }
}