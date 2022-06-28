import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomepageDelete extends StatefulWidget {
  const HomepageDelete({ Key? key }) : super(key: key);

  @override
  State<HomepageDelete> createState() => _HomepageDeleteState();
}

class _HomepageDeleteState extends State<HomepageDelete> {
  String body = "belum ada data";
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

            ElevatedButton(onPressed: () async {
              var response = await http.delete(Uri.parse("https://reqres.in/api/users/2"));
              print(response.statusCode);
              if(response.statusCode == 204){
                setState(() {
                  body = "Berhasil menghapus data";
                });
              }
            }, 
            child: Text("Delete Data")),

            ElevatedButton(
              onPressed: () async {
                var response = await http.get(Uri.parse("https://reqres.in/api/users/2"));
                if(response.statusCode == 200){
                  // berhasil
                  var data = json.decode(response.body) as Map<String, dynamic>;
                  print("Berhasil");
                  setState(() {
                    body = "Nama: ${data['data']['first_name']} ${data['data']['last_name']}";
                  });

                }else{
                  // gagal
                  print("Gagal");
                }
              },
               child: Text("Get Data"))
          ],
          ),
      ),
    );
  }
}