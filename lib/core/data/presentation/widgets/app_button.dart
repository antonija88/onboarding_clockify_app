import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Function onPressed;
  final String buttonText;
  final Color buttonColor;
  final bool isTaskCard;
  const AppButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.buttonColor = Colors.grey,
    this.isTaskCard = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed.call();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: isTaskCard ? 5 : 15, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border.all(color: Colors.blueAccent.shade100),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
