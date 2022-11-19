import 'package:flutter/material.dart';
import 'package:pll_recon/core/iterable_extensions.dart';
import 'package:pll_recon/core/solver.dart';
import 'package:pll_recon/widgets/cube_3d.dart';
import 'package:pll_recon/widgets/pll_button.dart';

import '../core/pll.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Handles pll changes and updates the layout
  final solver = Solver();

  // Direction based on orientation
  // Column when portrait, row when horizontal
  Axis _getDirection() {
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? Axis.vertical
        : Axis.horizontal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("PLL recognizer"),
      ),
      body: AnimatedBuilder(
        animation: solver,
        builder: (context, _) {
          return Flex(
            direction: _getDirection(),
            children: [
              Expanded(child: Cube3D(solver)),
              Expanded(
                child: _buildPllButtonsTable(),
              ),
            ],
          );
        },
      ),
    );
  }

  // Table of all pll buttons
  // with 3 columns and 7 rows
  Widget _buildPllButtonsTable() {
    return Table(
      children: Pll.values
          .chunked(3)
          .map(
            (threePlls) => TableRow(
              children: threePlls
                  .map(
                    (pll) => PllButton(
                      key: Key(solver.currentPll.label + pll.label),
                      pll: pll,
                      onPressed:
                          solver.currentPll == pll ? solver.nextPll : () {},
                    ),
                  )
                  .toList(),
            ),
          )
          .toList(),
    );
  }
}
