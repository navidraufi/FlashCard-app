import 'package:flutter/material.dart';

class TTSButton extends StatefulWidget {
  TTSButton({super.key});

  @override
  State<TTSButton> createState() => _TTSButtonState();
}

class _TTSButtonState extends State<TTSButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IconButton(
          onPressed: () {
            _isPressed = true;
            setState(() {});

            Future.delayed(Duration(milliseconds: 300), () {
              _isPressed = false;
              setState(() {});
            });
          },
          icon: Icon(
            Icons.audiotrack,
            size: 50,
            color: _isPressed ? Colors.white : Colors.black,
          )),
    );
  }
}
