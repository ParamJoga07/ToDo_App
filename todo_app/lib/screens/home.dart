import 'package:todo_app/screens/drawer.dart';

import './widgets/todo_item.dart';
import '../model/todo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xff006064),
        ),
        backgroundColor: Color(0xffe0f7fa),
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                Icons.task_rounded,
                size: 35,
              ),
              Container(
                alignment: Alignment.centerRight,
                height: 50,
                width: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image(
                    image: AssetImage("assets/female.png"),
                  ),
                ),
              ),
            ]),
      ),
      drawer: MyDrawer(),
      body: Stack(
        children: [
          Container(
              child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Color(0xffe0f7fa),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff4dd0e1),
                          offset: Offset(0.0, 4.0),
                          blurRadius: 7.0,
                        )
                      ]),
                  child: TextField(
                    onChanged: (value) => _runFilter(value),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      prefixIcon: Icon(
                        Icons.search_sharp,
                        color: Color(0xff006064),
                        size: 30,
                      ),
                      prefixIconConstraints:
                          BoxConstraints(maxHeight: 30, minWidth: 45),
                      border: InputBorder.none,
                      hintText: 'Search your tasks',
                      hintStyle: GoogleFonts.adamina(
                        textStyle:
                            TextStyle(fontSize: 15, color: Color(0xff006064)),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 25),
                      child: Text(
                        "All Tasks",
                        style: GoogleFonts.adamina(
                          textStyle: TextStyle(
                              fontSize: 30.0,
                              color: Color(0xff006064),
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.normal),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    for (ToDo todoo in _foundToDo.reversed)
                      ToDoItem(
                        todo: todoo,
                        onToDoChanged: _handleToChange,
                        ondeleteItem: _deleteToDoItem,
                      ),
                  ],
                ),
              )
            ],
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Color(0xffe0f7fa),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.0, 4.0),
                        blurRadius: 7.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    controller: _todoController,
                    decoration: InputDecoration(
                      hintText: 'Add new Task',
                      hintStyle: GoogleFonts.adamina(
                        textStyle:
                            TextStyle(fontSize: 15, color: Color(0xff006064)),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                )),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    child: Text(
                      '+',
                      style: TextStyle(fontSize: 40),
                    ),
                    onPressed: () {
                      _addToDoItem(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xff006064),
                        minimumSize: Size(60, 60),
                        elevation: 20),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _handleToChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo));
    });
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundToDo = results;
    });
  }
}
