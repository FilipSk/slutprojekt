import 'package:flutter/material.dart';
import 'package:imat_app/app_theme.dart';

class ScreenProgress extends StatelessWidget {
  final int ticks;

  const ScreenProgress({super.key, required this.ticks});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              tick1(),
              spacer(),
              line(),
              spacer(),
              tick2(),
              spacer(),
              line(),
              spacer(),
              tick3(),
              spacer(),
              line(),
              spacer(),
              tick4(),
            ],
          ),
        ),
        SizedBox(height: 5),
        Row(
          children: [
            SizedBox(width: 10),
            Padding(padding: const EdgeInsets.only(left: 12.0), child: text1()),

            SizedBox(width: 151),
            Padding(padding: const EdgeInsets.only(left: 12.0), child: text2()),

            SizedBox(width: 150),
            Padding(padding: const EdgeInsets.only(left: 12.0), child: text3()),

            SizedBox(width: 162),
            Padding(padding: const EdgeInsets.only(left: 12.0), child: text4()),
          ],
        ),
      ],
    );
  }

  Widget tick(bool isChecked) {
    return isChecked
        ? Icon(Icons.check_circle, color: AppTheme.mainThemeColor, size: 30)
        : Icon(Icons.radio_button_unchecked, color: Colors.blue);
  }

  Widget tick1() {
    return ticks > 0 ? tick(true) : tick(false);
  }

  Widget tick2() {
    return ticks > 1 ? tick(true) : tick(false);
  }

  Widget tick3() {
    return ticks > 2 ? tick(true) : tick(false);
  }

  Widget tick4() {
    return ticks > 3 ? tick(true) : tick(false);
  }

  Widget text1() {
    return Text("Varukorg", style: TextStyle(fontSize: 18));
  }

  Widget text2() {
    return Text("Leverans", style: TextStyle(fontSize: 18));
  }

  Widget text3() {
    return Text("Betalning", style: TextStyle(fontSize: 18));
  }

  Widget text4() {
    return Text("Klart", style: TextStyle(fontSize: 18));
  }

  Widget spacer() {
    return Container(width: 5.0);
  }

  Widget line() {
    return Container(color: Colors.blue, height: 5.0, width: 200.0);
  }
}
