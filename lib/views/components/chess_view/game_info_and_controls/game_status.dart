import 'package:en_passant/core/localization/app_string.dart';
import 'package:en_passant/model/app_model.dart';
import 'package:en_passant/views/components/main_menu_view/game_options/side_picker.dart';
import 'package:en_passant/views/components/shared/text_variable.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class GameStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, appModel, child) => Row(
        children: [
          TextRegular(_getStatus(appModel)),
          !appModel.gameOver && appModel.playerCount == 1 && appModel.isAIsTurn
              ? CupertinoActivityIndicator(radius: 12)
              : Container()
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }

  String _getStatus(AppModel appModel) {
    if (!appModel.gameOver) {
      if (appModel.playerCount == 1) {
        if (appModel.isAIsTurn) {
          return 'AI [Level ${appModel.aiDifficulty}] is thinking ';
        } else {
          return AppString.yourTurn.tr;
        }
      } else {
        if (appModel.turn == Player.player1) {
          return AppString.whitesTurn.tr;
        } else {
          return AppString.blacksTurn.tr;
        }
      }
    } else {
      if (appModel.stalemate) {
        return AppString.stalemate.tr;
      } else {
        if (appModel.playerCount == 1) {
          if (appModel.isAIsTurn) {
            return AppString.youWin.tr;
          } else {
            return AppString.youLose.tr;
          }
        } else {
          if (appModel.turn == Player.player1) {
            return AppString.blackWin.tr;
          } else {
            return AppString.whiteWin.tr;
          }
        }
      }
    }
  }
}
