import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final IconData icon;
  final Size size;
  final Color color;
  final Color backgroundColor;
  final Color? overlayColor;
  final double? padding;
  const CustomButton({
    required this.title,
    required this.onPressed,
    required this.icon,
    required this.size,
    required this.color,
    required this.backgroundColor,
    this.overlayColor = const Color.fromARGB(255, 184, 184, 186),
    this.padding = 16,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding!),
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: color,
          ),
          label: Text(
            title,
            style: TextStyle(color: color),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(
              (states) => backgroundColor,
            ),
            overlayColor: MaterialStateColor.resolveWith(
              (states) => overlayColor!,
            ),
            elevation: MaterialStateProperty.all(0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
