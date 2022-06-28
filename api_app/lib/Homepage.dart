import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({ Key? key }) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late String body;
  late String id;
  late String nama;

  @override
  void initState() {
    body = "Belum ada data";
    id = "";
    nama = "";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP GET"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(body),
            Text(id),
            Text(nama),
            ElevatedButton(
              onPressed: () async {
                var response = await http.get(Uri.parse("https://reqres.in/api/users/2"));
                if(response.statusCode == 200){
                  // berhasil
                  var data = json.decode(response.body) as Map<String, dynamic>;
                  print("Berhasil");
                  setState(() {
                    body = "";
                    id = data['data']['id'].toString();
                    nama = "${data['data']['first_name']} ${data['data']['last_name']}";
                  });

                }else{
                  // gagal
                  print("Gagal");
                }
              },
               child: Text("Data"))
          ],
          ),
      ),
    );
  }
}