import 'package:flutter/material.dart';

class Detail extends StatelessWidget {

  Detail ({this.nama, this.email, this.gambar});
  
  final String nama;
  final String email;
  final String gambar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
        backgroundColor: Colors.indigo[400],
      ),

      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Image(image: NetworkImage(gambar),),
              Text(nama, style: TextStyle(fontSize: 32.0),),
              Text(email, style: TextStyle(color: Colors.blue),)
            ],
          ),
        ),
      ),
    );
  }
}