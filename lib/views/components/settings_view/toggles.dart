import 'dart:io';

import 'package:en_passant/core/localization/app_string.dart';
import 'package:en_passant/model/app_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'toggle.dart';

class Toggles extends StatelessWidget {
  final AppModel appModel;

  Toggles(this.appModel);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Toggle(
          AppString.showHints.tr,
          toggle: appModel.showHints,
          setFunc: appModel.setShowHints,
        ),
        Toggle(
          AppString.allowUndoRedo.tr,
          toggle: appModel.allowUndoRedo,
          setFunc: appModel.setAllowUndoRedo,
        ),
        Toggle(
          AppString.showMoveHistory.tr,
          toggle: appModel.showMoveHistory,
          setFunc: appModel.setShowMoveHistory,
        ),
        Platform.isAndroid
            ? Toggle(
                AppString.soundEnabled.tr,
                toggle: appModel.soundEnabled,
                setFunc: appModel.setSoundEnabled,
              )
            : Container(),
      ],
    );
  }
}
