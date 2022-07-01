import 'dart:convert';

import 'package:api_app/model/User.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomepageFbuilder extends StatefulWidget {
  const HomepageFbuilder({ Key? key }) : super(key: key);

  @override
  State<HomepageFbuilder> createState() => _HomepageFbuilderState();
}

class _HomepageFbuilderState extends State<HomepageFbuilder> {
  List<User> allData = [];

  Future _getData() async{
    try {
      var response = await http.get(Uri.parse("https://reqres.in/api/users?page=1"));
      print(response.body);

      List data = (json.decode(response.body) as Map<String, dynamic>)['data'];
      print(data);
      data.forEach((element) {
        allData.add(User.fromJson(element));
      });
    } catch (e) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future Builder"),
      ),
      body: FutureBuilder(
        future: _getData(),
        builder: ((context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
            return ListView.builder(
              itemCount: allData.length,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(allData[index].avatar),
                ),
                title: Text("${allData[index].firstName} ${allData[index].lastName}"),
                subtitle: Text(allData[index].email),
              ),
            );
          }    
        })),
    );
  }
}