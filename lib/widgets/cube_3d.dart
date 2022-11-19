import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pll_recon/core/pll_color.dart';
import 'package:pll_recon/widgets/wall.dart';

import '../core/solver.dart';

class Cube3D extends StatefulWidget {
  const Cube3D(this.solver, {super.key});

  final Solver solver;

  @override
  State<Cube3D> createState() => _Cube3DState();
}

class _Cube3DState extends State<Cube3D> {
  Offset _offset = const Offset(330, 15);

  // Cube size
  final double s = 200;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onPanUpdate: (details) => setState(() {
        _offset += details.delta;
        _offset = Offset(
          _offset.dx % 360,
          _offset.dy < -90 ? -90 : min(_offset.dy, 90),
        );
      }),
      child: Center(
        child: Transform(
          transform: Matrix4.identity()
            ..rotateX(_offset.dy * -pi / 180)
            ..rotateY(_offset.dx * pi / 180),
          alignment: Alignment.center,
          child: Stack(
            children: [
              // Top wall
              if (_offset.dy > 0)
                Transform(
                  transform: Matrix4.identity()
                    ..translate(0.0, -s / 2, 0.0)
                    ..rotateX(pi / 2),
                  alignment: Alignment.center,
                  child: Wall(
                    baseColor: PllColor.white.color,
                    size: s,
                  ),
                ),
              // Bottom wall
              if (_offset.dy < 0)
                Transform(
                  transform: Matrix4.identity()
                    ..translate(0.0, s / 2, 0.0)
                    ..rotateX(pi / 2),
                  alignment: Alignment.center,
                  child: Wall(
                    baseColor: PllColor.yellow.color,
                    size: s,
                  ),
                ),
              // Front wall
              if ((270 < _offset.dx || _offset.dx < 90))
                Transform(
                  transform: Matrix4.identity()..translate(0.0, 0.0, s / 2),
                  alignment: Alignment.center,
                  child: Wall(
                    baseColor: PllColor.green.color,
                    leftColor: widget.solver.getStickerColor(0),
                    middleColor: widget.solver.getStickerColor(1),
                    rightColor: widget.solver.getStickerColor(2),
                    size: s,
                  ),
                ),
              // Right wall
              if (180 < _offset.dx && _offset.dx < 360)
                Transform(
                  transform: Matrix4.identity()
                    ..translate(s / 2, 0.0, 0.0)
                    ..rotateY(pi / 2),
                  alignment: Alignment.center,
                  child: Wall(
                    baseColor: PllColor.red.color,
                    size: s,
                    leftColor: widget.solver.getStickerColor(3),
                    middleColor: widget.solver.getStickerColor(4),
                    rightColor: widget.solver.getStickerColor(5),
                  ),
                ),
              // Back wall
              if (90 < _offset.dx && _offset.dx < 270)
                Transform(
                  transform: Matrix4.identity()
                    ..translate(0.0, 0.0, -s / 2)
                    ..rotateY(pi),
                  alignment: Alignment.center,
                  child: Wall(
                    baseColor: PllColor.blue.color,
                    size: s,
                    leftColor: widget.solver.getStickerColor(6),
                    middleColor: widget.solver.getStickerColor(7),
                    rightColor: widget.solver.getStickerColor(8),
                  ),
                ),
              // Left wall
              if (0 < _offset.dx && _offset.dx < 180)
                Transform(
                  transform: Matrix4.identity()
                    ..translate(-s / 2, 0.0, 0.0)
                    ..rotateY(-pi / 2),
                  alignment: Alignment.center,
                  child: Wall(
                    baseColor: PllColor.orange.color,
                    size: s,
                    leftColor: widget.solver.getStickerColor(9),
                    middleColor: widget.solver.getStickerColor(10),
                    rightColor: widget.solver.getStickerColor(11),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
