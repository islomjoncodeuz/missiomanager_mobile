import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUSPage extends StatefulWidget {
  const AboutUSPage({super.key});

  @override
  State<AboutUSPage> createState() => _AboutUSPageState();
}

class _AboutUSPageState extends State<AboutUSPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "A B O U T  U S",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: ClipOval(
                child: Image.asset(
                  "assets/image/01.png",
                  height: 200,
                  width: 200,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "A B O U T  U S",
              style: GoogleFonts.poppins(
                color: Colors.blue,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Container(
                width: double.maxFinite,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "V E R S I O N",
                      style: GoogleFonts.poppins(
                        color: Colors.blue,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "1.0",
                      style: GoogleFonts.poppins(
                        color: Colors.blue,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Container(
                width: double.maxFinite,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "L O C A T E",
                      style: GoogleFonts.poppins(
                        color: Colors.blue,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "B U V A Y D A",
                      style: GoogleFonts.poppins(
                        color: Colors.blue,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.maxFinite,
        height: 60,
        color: Colors.blue,
        child: Center(
          child: Text("I S L O M J O N  N U R M U K H A M M A D O V", style: GoogleFonts.poppins(color: Colors.white, fontSize: 16,),),
        ),
      ),
    );
  }
}
