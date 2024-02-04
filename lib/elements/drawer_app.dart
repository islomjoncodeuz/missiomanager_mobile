import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:missiomanager/screens/about_us_page.dart';
import 'package:missiomanager/screens/contact_page.dart';

class DrawerApp extends StatefulWidget {
  const DrawerApp({super.key});

  @override
  State<DrawerApp> createState() => _DrawerAppState();
}

class _DrawerAppState extends State<DrawerApp> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            height: 200,
            color: Colors.blue,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/image/01.png",
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    "M I S S I O N  M A N A G E R",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.blue,),
            title: Text(
              "H O M E",
              style: GoogleFonts.poppins(
                color: Colors.blue,
                fontSize: 18,
              ),
            ),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutUSPage())),
            leading: const Icon(Icons.abc_outlined, color: Colors.blue,),
            title: Text(
              "A B O U T  U S",
              style: GoogleFonts.poppins(
                color: Colors.blue,
                fontSize: 18,
              ),
            ),
          ),
          ListTile(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Contact_Page())),
            leading: const Icon(Icons.contact_support, color: Colors.blue,),
            title: Text(
              "C O N T A C T  U S",
              style: GoogleFonts.poppins(
                color: Colors.blue,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
