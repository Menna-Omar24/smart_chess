import 'package:en_passant/core/services/local_storage_service.dart';
import 'package:en_passant/core/theme/app_color.dart';
import 'package:en_passant/core/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

class DefaultSwitchTheme extends StatefulWidget {
  final String labelSwitch;
  final String icon1;
  final String icon2;

  const DefaultSwitchTheme({
    super.key,
    this.labelSwitch = '',
    required this.icon1,
    required this.icon2,
  });

  @override
  State<DefaultSwitchTheme> createState() => _DefaultSwitchThemeState();
}

class _DefaultSwitchThemeState extends State<DefaultSwitchTheme> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    LocalStorageService.getTheme().then((isDark) {
      setState(() {
        selectedIndex = isDark ? 1 : 0;
      });
      final themeController = Get.find<ThemeController>();
      themeController.toggleTheme(isDark);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.labelSwitch,
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
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
            activeFgColor: Colors.transparent,
            inactiveBgColor: Colors.transparent,
            inactiveFgColor: Colors.transparent,
            initialLabelIndex: selectedIndex,
            totalSwitches: 2,
            customWidgets: [
              SvgPicture.asset(widget.icon2,
                  color: selectedIndex == 0
                      ? AppColor.onPrimary
                      : AppColor.onPrimary),
              SvgPicture.asset(widget.icon1,
                  color: selectedIndex == 1
                      ? AppColor.secondary
                      : AppColor.primary),
            ],
            iconSize: 30,
            radiusStyle: true,
            onToggle: (index) {
              setState(() {
                selectedIndex = index!;
              });
              final isDark = index == 1;
              final themeController = Get.find<ThemeController>();
              themeController.toggleTheme(isDark);
              LocalStorageService.setTheme(isDark);
            },
          ),
        ),
      ],
    );
  }
}
