import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required TextEditingController taskController,
    required this.inputText,
  }) : _taskController = taskController;

  final TextEditingController _taskController;
  final String inputText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 2,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            autocorrect: false,
            controller: _taskController,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: inputText,
            ),
            keyboardType: TextInputType.number,
          ),
        ),
      ),
    );
  }
}
