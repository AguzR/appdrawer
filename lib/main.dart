import 'package:flutter/material.dart';
import 'detail.dart';

void main() {
  runApp(new MaterialApp(
    title: "App Drawer",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String gambar1 =
      "https://scontent.fsub1-1.fna.fbcdn.net/v/t1.0-9/52126836_1493410080793942_2836786569992470528_n.jpg?_nc_cat=105&_nc_oc=AQnGaI_EpsFXpX8nJvNzD5zYFVzRoEuJQAfsfO84XVrajXrVSyJJjrNuPSWNHtUGRnc&_nc_ht=scontent.fsub1-1.fna&oh=639b80a8920912f75eb6b2d603258f3f&oe=5E313B58";
  String gambar2 =
      "https://scontent.fsub1-2.fna.fbcdn.net/v/t1.0-9/62368717_1317901588384909_7429386256267608064_n.jpg?_nc_cat=101&_nc_oc=AQloyZ_WzwNaBHGdP9IBBfuUeWK6oxisIpOiW2Yn_3GgxZtzDoLOxU6tGUu1uHY0Ve8&_nc_ht=scontent.fsub1-2.fna&oh=a9b777553bb393433cb5ff056a15bc2b&oe=5E347E82";
  String backupimg;

  String nama1 = "Aguz Riyanto";
  String nama2 = "VALS ID";
  String backupnama;

  String email1 = "aguzri10@gmail.com";
  String email2 = "vals.id@gmail.com";
  String backupemail;

  void gantiuser() {
    this.setState(() {
      backupimg = gambar1;
      gambar1 = gambar2;
      gambar2 = backupimg;

      backupnama = nama1;
      nama1 = nama2;
      nama2 = backupnama;

      backupemail = email1;
      email1 = email2;
      email2 = backupemail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[400],
        title: Text("Demo App Drawer"),
      ),

      // membuat drawer
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(nama1),
              accountEmail: Text(email1),
              currentAccountPicture: GestureDetector(
                // gesture navigator digunakan untuk merekam kegiatan seperti tap, slide double tap dll
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Detail(nama: nama1, email: email1, gambar: gambar1,)
                ));
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(gambar1),
                ),
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://img.freepik.com/free-vector/gradient-geometric-shape-background_78532-374.jpg?size=626&ext=jpg"),
                      fit: BoxFit.cover)),
              otherAccountsPictures: <Widget>[
                GestureDetector(
                    onTap: () => gantiuser(),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(gambar2),
                    ))
              ],
            ),
            ListTile(
              title: Text("Profile"),
              trailing: Icon(Icons.account_circle),
            ),
            ListTile(
              title: Text("Bookmark"),
              trailing: Icon(Icons.bookmark),
            ),
            ListTile(
              title: Text("Settings"),
              trailing: Icon(Icons.settings_applications),
            ),
            ListTile(
              title: Text("Close"),
              trailing: Icon(Icons.close),
            ),
          ],
        ),
      ),
      body: Container(),
    );
  }
}
