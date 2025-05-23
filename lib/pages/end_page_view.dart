import 'package:flutter/material.dart';
import 'package:imat_app/widgets/screen_progress.dart';

class EndPageView extends StatelessWidget {
  const EndPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Card(
        child: Column(
          children: [
            ScreenProgress(ticks: 4),
            Divider(),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  color: Colors.red,
                  iconSize: 36,
                  icon: Icon(Icons.close),
                  onPressed:
                      () => Navigator.of(
                        context,
                      ).popUntil((route) => route.isFirst),
                ),
              ],
            ),
            Text(
              "Dina Varor kommer om 3 - 5 arbetsdagar.",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),

            Text(
              "Välkomen åter!",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),

            Image.asset("assets/images/Hank.jpg", height: 400, width: 600),
          ],
        ),
      ),
    );
  }
}
