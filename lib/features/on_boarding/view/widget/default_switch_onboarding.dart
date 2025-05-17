import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../../core/services/local_storage_service.dart';

class DefaultSwitchOnboarding extends StatefulWidget {
  final String labelSwitch;
  final String icon1;
  final String icon2;

  const DefaultSwitchOnboarding({
    super.key,
     this.labelSwitch= '',
    required this.icon1,
    required this.icon2,
  });

  @override
  State<DefaultSwitchOnboarding> createState() =>
      _DefaultSwitchOnboardingState();
}

class _DefaultSwitchOnboardingState extends State<DefaultSwitchOnboarding> {
  int selectedIndex = Get.locale?.languageCode == 'ar' ? 0 : 1;

  @override
  void initState() {
    super.initState();
    LocalStorageService.getLanguage().then((lang) {
      setState(() {
        selectedIndex = lang == 'ar' ? 0 : 1;
      });
      Get.updateLocale(Locale(lang));
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
            border: Border.all(
                width: 2, color: Theme.of(context).colorScheme.primary),
          ),
          child: ToggleSwitch(
            minWidth: 45.0,
            minHeight: 30,
            cornerRadius: 20.0,
            activeBgColors: [
              [Theme.of(context).colorScheme.primary],
              [Theme.of(context).colorScheme.primary]
            ],
            activeFgColor: Colors.transparent,
            inactiveBgColor: Colors.transparent,
            inactiveFgColor: Colors.transparent,
            initialLabelIndex: selectedIndex,
            totalSwitches: 2,
            customWidgets: [
              SvgPicture.asset(widget.icon1),
              SvgPicture.asset(widget.icon2),
            ],
            iconSize: 30,
            radiusStyle: true,
            onToggle: (index) {
              setState(() {
                selectedIndex = index!;
              });
              final lang = index == 0 ? 'ar' : 'en';
              LocalStorageService.setLanguage(lang);
              Get.updateLocale(Locale(lang));
            },
          ),
        ),
      ],
    );
  }
}
