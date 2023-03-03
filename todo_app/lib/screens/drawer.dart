import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Home.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            color: Color(0xffe0f7fa),
            child: Text(
              'Task Drawer',
              style: GoogleFonts.adamina(
                textStyle: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xff006064),
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.normal),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.folder_special,
              color: Color(0xff006064),
            ),
            title: Text(
              'My Tasks',
              style: GoogleFonts.adamina(
                textStyle: TextStyle(
                    fontSize: 13.0,
                    color: Color(0xff006064),
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.normal),
              ),
            ),
          ),
          Divider(),
        ],
      )),
    );
  }
}
