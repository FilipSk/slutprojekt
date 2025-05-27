import 'package:flutter/material.dart';
import 'package:imat_app/pages/user_view.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(String) onSearchChanged;

  const MyAppBar({super.key, required this.onSearchChanged});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 4,
      automaticallyImplyLeading: false,
      toolbarHeight: 80,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                print("Du tryckte på loggan eller texten");
              },
              borderRadius: BorderRadius.circular(30),
              child: Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      "assets/images/Hank.png",
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    "Hanks livs",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 3,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  onChanged: onSearchChanged,
                  decoration: InputDecoration(
                    hintText: "Sök produkter...",
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search, size: 24),
                      onPressed: () {
                        print("Du tryckte på sök");
                      },
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            TextButton.icon(
              onPressed: () {
                print("Du tryckte på historik");
              },
              icon: const Icon(Icons.history, color: Colors.black87, size: 36),
              label: const Text(
                "Historik",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey.shade200,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(width: 12),
            TextButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserView()),
                );
              },
              icon: const Icon(
                Icons.account_circle,
                size: 36,
                color: Colors.black87,
              ),
              label: const Text(
                "Logga in",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
