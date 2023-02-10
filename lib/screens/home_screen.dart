import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_todo/db/database.dart';
import '../widgets/dialog_box.dart';
import '../widgets/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //refrence hive box
  final _box = Hive.box("todoBox");
  final TodoDatabase _db = TodoDatabase();
  final TextEditingController _controller = TextEditingController();

  void checkBoxChange({required bool? value, required int index}) {
    setState(() {
      _db.todoList[index][1] = !_db.todoList[index][1];
    });
    _db.updateDatabase();
  }

  void saveNewTask() {
    {
      setState(() {
        _db.todoList.add([
          _controller.text,
          false,
        ]);
        _controller.clear();
        Navigator.of(context).pop();
      });
    }
    _db.updateDatabase();
  }

  void cancelNewTask() {
    {
      _controller.clear();
      Navigator.of(context).pop();
    }
  }

  void addNewTask() {
    showDialog(
      context: context,
      builder: (context) => DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: cancelNewTask,
      ),
    );
  }

  void deleteTask(int index) {
    setState(() {
      _db.todoList.removeAt(index);
    });
    _db.updateDatabase();
  }

  @override
  void initState() {
    super.initState();

    // if this is the 1st time run this app , we need to create initial data
    if (_box.get("TODOLIST") == null) {
      _db.createInitialData();
    } else {
      _db.loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.purple[200],
      appBar: AppBar(
        title: Center(
          child: Text(
            "To Do List",
            style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
          ),
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: _db.todoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: _db.todoList[index][0],
            isComplated: _db.todoList[index][1],
            onChange: (value) {
              checkBoxChange(index: index, value: value);
            },
            deleteFunction: (ctx) {
              deleteTask(index);
            },
          );
        },
      ),
    );
  }
}
