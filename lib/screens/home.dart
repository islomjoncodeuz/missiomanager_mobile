import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:missiomanager/elements/drawer_app.dart';
import 'package:missiomanager/model/models.dart';
import 'package:missiomanager/screens/add_note_page.dart';
import 'package:missiomanager/screens/open_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> todos = [];

  @override
  void initState() {
    super.initState();

    loadTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "M I S S I O N  M A N A G E R",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const DrawerApp(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddNotePage()))
            .then((value) => loadTodos()),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          Todo todo = todos[index];

          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OpenPage(
                    id: index.toString(),
                    dateTime: todo.date,
                    title: todo.title,
                    description: todo.description,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                tileColor: Colors.blue,
                leading: ClipOval(
                  child: Image.asset("assets/image/01.png"),
                ),
                title: Text(
                  todo.title,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  '${todo.date.day}-${todo.date.month}-${todo.date.year}',
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
                trailing: IconButton(
                  onPressed: () {
                    todo.delete();
                    loadTodos();
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: todos.length,
      ),
    );
  }

  loadTodos() async {
    todos = await Todo.all();

    for (var e in todos) {
      print(e.toMap());
    }

    setState(() {});
  }
}
