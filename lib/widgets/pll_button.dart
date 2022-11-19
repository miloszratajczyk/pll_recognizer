import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pll_recon/styles/constants.dart';

import '../core/pll.dart';

class PllButton extends StatefulWidget {
  const PllButton({
    required this.pll,
    required this.onPressed,
    super.key,
  });

  final Pll pll;
  final Function() onPressed;

  @override
  State<PllButton> createState() => _PllButtonState();
}

class _PllButtonState extends State<PllButton> {
  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: borderRadiusL,
      onTap: () {
        setState(() {
          clicked = true;
        });
        widget.onPressed();
      },
      child: Padding(
        padding: paddingS,
        child: Opacity(
          opacity: clicked ? 0.32 : 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                widget.pll.assetName,
                height: 32,
                semanticsLabel: widget.pll.label,
              ),
              const SizedBox(width: spaceM),
              Text(
                widget.pll.label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
