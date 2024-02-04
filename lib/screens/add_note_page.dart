import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:missiomanager/model/models.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  DateTime _dateTime = DateTime.now();

  var title = TextEditingController();
  var description = TextEditingController();

  void _showTime() async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
      initialDate: _dateTime,
    );

    if (date != null) {
      setState(() {
        _dateTime = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "A D D  T O O  NOTE",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  TextField(
                    controller: title,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 3,
                        ),
                      ),
                      labelText: "T I T L E",
                      labelStyle:
                          GoogleFonts.poppins(color: Colors.blue, fontSize: 18),
                      hintText: "W R I T E  T O  T I T L E",
                      hintStyle:
                          GoogleFonts.poppins(color: Colors.blue, fontSize: 18),
                    ),
                    style:
                        GoogleFonts.poppins(color: Colors.blue, fontSize: 18),
                    maxLength: 25,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: description,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 3,
                        ),
                      ),
                      labelText: "D E S C R I P T I O N",
                      labelStyle:
                          GoogleFonts.poppins(color: Colors.blue, fontSize: 18),
                      hintText: "W R I T E  T O  D E S C R I P T I O N",
                      hintStyle:
                          GoogleFonts.poppins(color: Colors.blue, fontSize: 18),
                    ),
                    style:
                        GoogleFonts.poppins(color: Colors.blue, fontSize: 18),
                    maxLength: 500,
                    maxLines: 5,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      _showTime();
                    },
                    child: Container(
                      width: double.maxFinite,
                      height: 65,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          '${_dateTime.day}-${_dateTime.month}-${_dateTime.year}',
                          style: GoogleFonts.poppins(
                            color: Colors.blue,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () async {
                      if (title.text != '' && description.text != '') {
                        await Todo.create(
                            title: title.text,
                            description: description.text,
                            datetime: _dateTime);

                        title.clear();
                        description.clear();

                        if (mounted) {
                          Navigator.of(context).pop();
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Insufficient data entered",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            backgroundColor: Colors.red,
                            showCloseIcon: true,
                            closeIconColor: Colors.white,
                          ),
                        );
                      }
                    },
                    child: Container(
                      width: double.maxFinite,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "S A V E",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
