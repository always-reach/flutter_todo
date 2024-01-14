import 'package:flutter/material.dart';

class CountUpText extends StatefulWidget {
  final int displayNumber;
  final TextStyle? style;
  const CountUpText({super.key, required this.displayNumber, this.style});

  @override
  CountUpTextState createState() => CountUpTextState();
}

class CountUpTextState extends State<CountUpText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation =
        IntTween(begin: 0, end: widget.displayNumber).animate(_controller)
          ..addListener(() {
            setState(() {});
          });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _animation.value.toString(),
      style: widget.style,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
