import 'package:en_passant/core/localization/app_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'picker.dart';

enum Player { player1, player2, random }

class SidePicker extends StatelessWidget {
  final Map<Player, Text> colorOptions =  <Player, Text>{
    Player.player1: Text(AppString.white.tr),
    Player.player2: Text(AppString.black.tr),
    Player.random: Text(AppString.random.tr)
  };

  final Player playerSide;
  final Function(Player?) setFunc;
  
  SidePicker(this.playerSide, this.setFunc);

  @override
  Widget build(BuildContext context) {
    return Picker<Player>(
      label: AppString.side.tr,
      options: colorOptions,
      selection: playerSide,
      setFunc: setFunc,
    );
  }
}
