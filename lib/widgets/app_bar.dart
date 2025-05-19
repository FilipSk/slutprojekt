import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 4,
      automaticallyImplyLeading: false, // Ta bort default back-knapp
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Row(
          children: [
            SizedBox(
              width: 60,
              height: 60,
              child: InkWell(
                onTap: () {
                  print("Du tryckte på loggan");
                  // TODO: Komma tillbaka till hemsidan
                },
                child: Image.asset("assets/images/Hank.png", fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              "Hanks livs",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            width: 400,
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).colorScheme.primaryContainer,
                hintText: "Sök",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    print("Du tryckte på sök");
                    // TODO: implementera sök
                  },
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        SizedBox(
          width: 120,
          height: 40,
          child: TextButton(
            onPressed: () {
              print("Du tryckte på historik");
              // TODO: Fixa historik
            },
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 237, 232, 232),
            ),
            child: const Text(
              "Historik",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(width: 16),
        const Text(
          "Logga in",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.account_circle, size: 40, color: Colors.black),
          onPressed: () {
            print("Du tryckte på konto");
            // TODO: implementera konto
          },
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
