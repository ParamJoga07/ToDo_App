import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/model/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final ondeleteItem;

  const ToDoItem(
      {Key? key,
      required this.todo,
      required this.ondeleteItem,
      required this.onToDoChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 1),
        child: Container(
            child: ListTile(
          onTap: () {
            onToDoChanged(todo);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          tileColor: Color(0xffe0f7fa),
          leading: Icon(
            todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: Color(0xff006064),
          ),
          title: Text(
            todo.todoText!,
            style: GoogleFonts.adamina(
              textStyle: TextStyle(
                  fontSize: 15.0,
                  color: Color(0xff006064),
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  decoration: todo.isDone ? TextDecoration.lineThrough : null),
            ),
          ),
          trailing: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Color(0xff006064),
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                iconSize: 20,
                onPressed: () {
                  ondeleteItem(todo.id);
                },
                icon: Icon(
                  Icons.delete,
                  color: Color(0xffe0f7fa),
                ),
              )),
        )),
      ),
    );
  }
}
