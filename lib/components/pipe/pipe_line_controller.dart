import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flappy_bird/components/pipe/pipe_line.dart';
import 'package:flutter/material.dart';

class PipeLineController extends GameComponent with ChangeNotifier {
  final double speed;
  int currentInterval = 2000;
  int countPipesWin = 0;

  PipeLineController({required this.speed});
  @override
  void update(double dt) {
    if (checkInterval('AddsPipe', currentInterval, dt)) {
      double offset = Random().nextInt(100).toDouble() + -50;
      double offsetx = 10 + Random().nextInt(50).toDouble();
      gameRef.add(
        PipeLine(
          speed: speed,
          offset: Vector2(offsetx, offset),
          onWin: _countScore,
        ),
      );
    }
    super.update(dt);
  }

  void _countScore() {
    countPipesWin++;
    notifyListeners();
  }

  void reset() {
    countPipesWin = 0;
    notifyListeners();
  }
}
