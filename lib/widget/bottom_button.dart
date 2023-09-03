import 'package:flutter/material.dart';

class BottomButton extends StatefulWidget {
  final VoidCallback? onTap;
  final String buttonText;
  const BottomButton({
    required this.buttonText,
    this.onTap,
    super.key,
  });

  @override
  State<BottomButton> createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32.0),
            border: Border.all(
              color: Colors.black,
            ),
            color: _isHovered ? Colors.black : Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 18.0,
            ),
            child: Text(
              widget.buttonText,
              style: TextStyle(
                color: _isHovered ? Colors.white : Colors.black,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
