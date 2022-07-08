import 'package:auth_app/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  Future<void> _signOut() async{
    await FirebaseAuth.instance.signOut();
  }
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    if(auth.currentUser != null){
      print(auth.currentUser!.email);
    }

    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Text(auth.currentUser!.email.toString()),
            ElevatedButton(
              onPressed: (){
                _signOut().then((value) => Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen())));
              }, 
              child: Text("logout"))
          ],
        ),
      ),
    );
  }
}