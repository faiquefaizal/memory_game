import 'package:flutter/material.dart';

class VerticalSpace extends StatelessWidget {
  final double size;
  const VerticalSpace({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size);
  }
}

class Horizontal extends StatelessWidget {
  final double size;
  const Horizontal({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: size);
  }
}
