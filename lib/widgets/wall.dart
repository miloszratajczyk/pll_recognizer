import 'package:flutter/material.dart';
import 'package:pll_recon/styles/constants.dart';

/// Creates a 3x3 grid with given colors
/// where the color of the top 3 can be specified
class Wall extends StatelessWidget {
  const Wall({
    required this.baseColor,
    this.leftColor,
    this.middleColor,
    this.rightColor,
    required this.size,
    super.key,
  });

  final Color baseColor;
  final Color? leftColor;
  final Color? middleColor;
  final Color? rightColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Wrap(
        children: [
          for (int i = 0; i < 9; i++)
            Container(
              width: size / 3,
              height: size / 3,
              padding: paddingXS,
              child: Container(
                color: () {
                  if (i == 0) {
                    return leftColor ?? baseColor;
                  } else if (i == 1) {
                    return middleColor ?? baseColor;
                  } else if (i == 2) {
                    return rightColor ?? baseColor;
                  } else {
                    return baseColor;
                  }
                }(),
              ),
            ),
        ],
      ),
    );
  }
}
