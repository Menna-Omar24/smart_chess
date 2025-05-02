import 'package:en_passant/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:toggle_switch/toggle_switch.dart';

class DefaultSwitchTheme extends StatefulWidget {
  final String labelSwitch;
  final String icon1;
  final String icon2;

  const DefaultSwitchTheme({
    super.key,
    required this.labelSwitch,
    required this.icon1,
    required this.icon2,
  });

  @override
  State<DefaultSwitchTheme> createState() => _DefaultSwitchThemeState();
}

class _DefaultSwitchThemeState extends State<DefaultSwitchTheme> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = Get.locale?.languageCode == 'ar' ? 0 : 1;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.labelSwitch,
          style: TextStyle(
              color: AppColor.primary,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(width: 2, color: AppColor.primary),
          ),
          child: ToggleSwitch(
            minWidth: 45.0,
            minHeight: 30,
            cornerRadius: 20.0,
            activeBgColors: [
              [AppColor.primary],
              [AppColor.primary]
            ],
            activeFgColor: Colors.white,
            inactiveBgColor: AppColor.white,
            inactiveFgColor: Colors.white,
            initialLabelIndex: selectedIndex,
            totalSwitches: 2,
            customWidgets: [
              SvgPicture.asset(
                widget.icon1,
                color: selectedIndex == 0 ? Colors.white : AppColor.primary,
              ),
              SvgPicture.asset(
                widget.icon2,
                color: selectedIndex == 1 ? Colors.white : AppColor.primary,
              ),
            ],
            iconSize: 30,
            radiusStyle: true,
            onToggle: (index) {
              setState(() {
                selectedIndex = index!;
              });
            },
          ),
        ),
      ],
    );
  }
}
