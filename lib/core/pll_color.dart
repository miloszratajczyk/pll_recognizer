import 'package:flutter/material.dart';

// Colors that appear on the cube
enum PllColor {
  white(Colors.white), // top face
  green(Colors.lightGreen), // front face
  red(Colors.red), // right face
  blue(Colors.lightBlue), // back face
  orange(Colors.orange), // left face
  yellow(Colors.yellow); // bottom face

  const PllColor(this.color);

  final Color color;
}

// Cube colors sorted starting on front and going right
const List<PllColor> sideColors = [
  PllColor.green,
  PllColor.red,
  PllColor.blue,
  PllColor.orange,
];
