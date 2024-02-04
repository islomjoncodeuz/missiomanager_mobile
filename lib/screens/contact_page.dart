import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact_Page extends StatefulWidget {
  const Contact_Page({super.key});

  @override
  State<Contact_Page> createState() => _Contact_PageState();
}

class _Contact_PageState extends State<Contact_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "C O N T A C T  U S",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: const BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  leading: const Icon(
                    Icons.open_in_browser,
                    color: Colors.blue,
                    size: 30,
                  ),
                  title: Text(
                    "Y O U  T U B E",
                    style: GoogleFonts.poppins(
                      color: Colors.blue,
                      fontSize: 20,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_right,
                    size: 40,
                    color: Colors.blue,
                  ),
                  onTap: () {
                    const link =
                        "https://www.youtube.com/@islomjon.nurmukhammadov";

                    launchUrl(Uri.parse(link),
                        mode: LaunchMode.externalApplication);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: const BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  leading: const Icon(
                    Icons.telegram,
                    color: Colors.blue,
                    size: 30,
                  ),
                  title: Text(
                    "T E L E G R A M",
                    style: GoogleFonts.poppins(
                      color: Colors.blue,
                      fontSize: 20,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_right,
                    size: 40,
                    color: Colors.blue,
                  ),
                  onTap: () {
                    const link = "https://t.me/islomjonnurmukhammadov";

                    launchUrl(Uri.parse(link),
                        mode: LaunchMode.externalApplication);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: const BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  leading: const Icon(
                    Icons.phone,
                    color: Colors.blue,
                    size: 30,
                  ),
                  title: Text(
                    "P H O N E  N U M B E R",
                    style: GoogleFonts.poppins(
                      color: Colors.blue,
                      fontSize: 20,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_right,
                    size: 40,
                    color: Colors.blue,
                  ),
                  onTap: () {

                    launchUrl(Uri(scheme: 'tel',path: '+998889401508'),
                        mode: LaunchMode.externalApplication);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
