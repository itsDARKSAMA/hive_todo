import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool isComplated;
  Function(bool?)? onChange;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.isComplated,
    required this.onChange,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 25, right: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Checkbox(
                  checkColor: Colors.white,
                  value: isComplated,
                  onChanged: onChange),
              const SizedBox(
                width: 10,
              ),
              Text(
                taskName,
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: isComplated ? FontWeight.bold : FontWeight.normal,
                  fontSize: 18,
                  decoration: isComplated
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
