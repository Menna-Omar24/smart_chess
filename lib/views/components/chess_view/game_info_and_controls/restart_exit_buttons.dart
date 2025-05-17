import 'package:en_passant/core/localization/app_string.dart';
import 'package:en_passant/model/app_model.dart';
import 'package:en_passant/views/components/chess_view/game_info_and_controls/rounded_alert_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RestartExitButtons extends StatelessWidget {
  final AppModel appModel;

  RestartExitButtons(this.appModel);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RoundedAlertButton(
           AppString.restart.tr,
            onConfirm: () {
              appModel.newGame(context);
            },
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: RoundedAlertButton(
            AppString.exit.tr,
            onConfirm: () {
              appModel.exitChessView();
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
