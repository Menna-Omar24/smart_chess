
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../../core/theme/app_color.dart';


class DefaultSwitchOnboarding extends StatelessWidget {
  final String labelSwitch;
  final String icon1;
  final String icon2;

  const DefaultSwitchOnboarding({
    super.key,
    required this.labelSwitch, required this.icon1, required this.icon2,
 
  });

  @override
  Widget build(BuildContext context) {
    return  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    labelSwitch,
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
                      initialLabelIndex:
                          Get.locale?.languageCode == 'ar' ? 0 : 1,
                      totalSwitches: 2,
                      customWidgets: [
                        SvgPicture.asset(
                          icon1,
                        
                        ),
                        SvgPicture.asset(icon2),
                      ],
                      iconSize: 30,
                      radiusStyle: true,
                      onToggle: (index) {
                        if (index == 0) {
                          Get.updateLocale(Locale("ar", "AR"));
                        } else if (index == 1) {
                          Get.updateLocale(Locale("en", "US"));
                        }
                      },
                    ),
                  ),
                ],
              );
  }
}
