import 'package:flutter/cupertino.dart';

class Picker<T extends Object> extends StatelessWidget {
  final String? label;
  final Map<T, Widget> options;
  final T selection;
  final ValueChanged<T?> setFunc;

  const Picker({
    Key? key,
    this.label,
    required this.options,
    required this.selection,
    required this.setFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) Text(label!),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: CupertinoTheme(
            data: const CupertinoThemeData(
              textTheme: CupertinoTextThemeData(
                textStyle: TextStyle(fontFamily: 'Jura', fontSize: 8),
              ),
            ),
            child: CupertinoSlidingSegmentedControl<T>(
              children: options,
              groupValue: selection,
              onValueChanged: setFunc,
              thumbColor: const Color(0x88FFFFFF),
              backgroundColor: const Color(0x20000000),
            ),
          ),
        ),
      ],
    );
  }
}
