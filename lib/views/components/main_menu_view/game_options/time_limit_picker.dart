import 'package:flutter/cupertino.dart';
import 'picker.dart'; // عدل المسار حسب مكان ملف Picker

class TimeLimitPicker extends StatelessWidget {
  final int selectedTime;
  final ValueChanged<int?> setTime;

  const TimeLimitPicker({
    Key? key,
    required this.selectedTime,
    required this.setTime,
  }) : super(key: key);

  static const Map<int, Text> timeOptions = <int, Text>{
    0: Text('None'),
    15: Text('15m'),
    30: Text('30m'),
    60: Text('1h'),
    90: Text('1.5h'),
    120: Text('2h'),
  };

  @override
  Widget build(BuildContext context) {
    return Picker<int>(
      label: 'Time Limit',
      options: timeOptions,
      selection: selectedTime,
      setFunc: setTime,
    );
  }
}
