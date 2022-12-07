import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {super.key,
      required this.height,
      required this.width,
      required this.color,
      required this.text,
      required this.onTap});
  final double height;
  final double width;
  final String text;
  final Color color;
  final Function onTap;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
        setState(() {});
      },
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child: Text(
          widget.text,
          style: const TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
