import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:pll_recon/core/iterable_extensions.dart';

import 'package:pll_recon/core/pll.dart';
import 'package:pll_recon/core/pll_color.dart';

class Solver extends ChangeNotifier {
  Solver() {
    nextPll();
  }

  /// The pll that is currently displayed on the cube
  Pll currentPll = Pll.aa;
  // On which wall should the algorithm start (from 0 to 4)
  int _preAuf = 0;
  // How many times is last layer rotated (from 0 to 3)
  int _postAuf = 0;

  // Colors of last layer stickers
  // starting at front wall's top left stricker and going right
  List<PllColor> _stickerColors = List.filled(12, PllColor.white);

  final _random = Random();

  /// Changes the pll and all its associated values
  void nextPll() {
    // Next random pll
    var newPll = Pll.values.randomItem();
    while (newPll == currentPll) {
      newPll = Pll.values.randomItem();
    }
    currentPll = newPll;

    // Next random aufs
    _preAuf = _random.nextInt(4);
    _postAuf = _random.nextInt(4);

    // Next stickers configuration
    _stickerColors = currentPll.permutation.split('').map((e) {
      int sideNumber = ["F", "R", "B", "L"].indexOf(e);
      return sideNumber == -1
          ? PllColor.white
          : sideColors[(_preAuf + sideNumber) % 4];
    }).toList();

    notifyListeners();
  }

  /// Returns the color of sticker with given index
  /// starting at front wall's top left stricker and going right
  Color getStickerColor(int stickerId) =>
      _stickerColors[(stickerId + (_postAuf * 3)) % 12].color;
}
