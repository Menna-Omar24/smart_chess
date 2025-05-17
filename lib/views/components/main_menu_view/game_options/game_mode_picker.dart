import 'package:en_passant/core/localization/app_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'picker.dart';

class GameModePicker extends StatelessWidget {
  final Map<int, Text> playerCountOptions = <int, Text>{
    1: Text(
      AppString.onePlayer.tr,
      style: TextStyle(
        fontSize: 18,
      ),
    ),
    2: Text(
      AppString.twoPlayer.tr,
      style: TextStyle(
        fontSize: 18,
      ),
    ),
    3: Text(
      AppString.gameBoard.tr,
      style: TextStyle(
        fontSize: 18,
      ),
    )
  };

  final int playerCount;
  final Function(int?) setFunc;

  GameModePicker(this.playerCount, this.setFunc);

  @override
  Widget build(BuildContext context) {
    return Picker<int>(
      label: AppString.gameMode.tr,
      options: playerCountOptions,
      selection: playerCount,
      setFunc: setFunc,
    );
  }
}
