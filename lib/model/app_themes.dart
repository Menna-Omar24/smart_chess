import 'package:en_passant/core/localization/app_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class AppTheme {
  String? name;
  LinearGradient? background;
  Color lightTile;
  Color darkTile;
  Color moveHint;
  Color checkHint;
  Color latestMove;
  Color border;

  AppTheme({
    this.name,
    this.background,
    this.lightTile = const Color(0xFFC9B28F),
    this.darkTile = const Color(0xFF69493b),
    this.moveHint = const Color(0xdd5c81c4),
    this.latestMove = const Color(0xccc47937),
    this.checkHint = const Color(0x88ff0000),
    this.border = const Color(0xffffffff),
  });
}

List<AppTheme> get themeList {
  var themeList = <AppTheme>[
    AppTheme(
      name: AppString.grey.tr,
      background: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xffb2b2b2),
          Color(0xff4e4e4e),
        ],
      ),
      lightTile: Color(0xffb2b2b2),
      darkTile: Color(0xff808080),
      moveHint: Color(0xdd555555),
      checkHint: Color(0xff333333),
      latestMove: Color(0xdddddddd),
    ),
    AppTheme(
      name: AppString.dark.tr,
      background: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xff1e1e1e),
          Color(0xff2e2e2e),
        ],
      ),
      lightTile: Color(0xff444444),
      darkTile: Color(0xff333333),
      border: Color(0xff555555),
    ),
    AppTheme(
      name:AppString.amoled.tr,
      background: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xff000000),
          Color(0xff000000),
        ],
      ),
      lightTile: Color(0xff444444),
      darkTile: Color(0xff333333),
      border: Color(0xff555555),
    ),
    AppTheme(
      name: AppString.lewis.tr,
      background: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xff423428),
          Color(0xff423428),
        ],
      ),
      lightTile: Color(0xffdbd1c1),
      darkTile: Color(0xffab3848),
      moveHint: Color(0xdd800b0b),
      latestMove: Color(0xddcc9c6c),
      border: Color(0xffbdaa8c),
    ),
    AppTheme(
      name:AppString.cherryFunk.tr,
      background: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xff434783),
          Color(0xffdc3b39),
        ],
      ),
      lightTile: Color(0xffdb5e5c),
      darkTile: Color(0xff645183),
      moveHint: Color(0xaabdacce),
      latestMove: Color(0xaaf0b35d),
      border: Color(0xff434783),
    ),
    AppTheme(
      name: AppString.sage.tr,
      background: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF83886F),
          Color(0xFF000000),
        ],
      ),
      lightTile: Color(0xFFB2AD91),
      darkTile: Color(0xFF83886F),
      moveHint: Color(0xaa45a881),
      latestMove: Color(0xaa2782b0),
      border: Color(0xFF000000),
    ),
    AppTheme(
      name: AppString.warmTan.tr,
      background: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF866749),
          Color(0xFF000000),
        ],
      ),
      lightTile: Color(0xFFD3A373),
      darkTile: Color(0xFF866749),
      moveHint: Color(0xaa45a881),
      latestMove: Color(0xaa2782b0),
      border: Color(0xFF000000),
    ),
    AppTheme(
      name: AppString.jargonJade.tr,
      background: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF517970),
          Color(0xFF000000),
        ],
      ),
      lightTile: Color(0xFF85B39F),
      darkTile: Color(0xFF517970),
      moveHint: Color(0xaa45a881),
      latestMove: Color(0xaa2782b0),
      border: Color(0xFF000000),
    ),
  ];
  // themeList.sort((a, b) => a.name?.compareTo(b.name ?? "") ?? 0);
  return themeList;
}
