import 'package:en_passant/model/app_model.dart';
import 'package:en_passant/views/components/settings_view/piece_theme_picker.dart';
import 'package:en_passant/views/components/shared/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import 'components/settings_view/app_theme_picker.dart';
import 'components/settings_view/toggles.dart';
import 'components/shared/bottom_padding.dart';
import 'components/shared/text_variable.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, appModel, child) => Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: appModel.theme.background),
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top),
              TextLarge('Settings'),
              SizedBox(height: 20),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics: ClampingScrollPhysics(),
                  children: [
                    AppThemePicker(),
                    SizedBox(height: 20),
                    PieceThemePicker(),
                    SizedBox(height: 10),
                    Toggles(appModel),
                  ],
                ),
              ),
              SizedBox(height: 30),
              RoundedButton(
                'Back',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 15.h),
              RoundedButton(
                'Exit',
                onPressed: () async {
                  GoogleSignIn googleSignIn = GoogleSignIn();
                  googleSignIn.disconnect();
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    'login',
                    (route) => false,
                  );
                },
              ),
              BottomPadding(),
            ],
          ),
        ),
      ),
    );
  }
}
