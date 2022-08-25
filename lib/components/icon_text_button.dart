import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  const IconTextButton(
      {Key? key,
      required this.icon,
      required this.text,
      required this.onPressed})
      : super(key: key);

  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: onPressed,
            child: Icon(icon, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
