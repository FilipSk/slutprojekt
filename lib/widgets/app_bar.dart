import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Hanks livs"),
      backgroundColor: Colors.white,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 400.0),
          //padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SizedBox(
            width: 400,
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).colorScheme.primaryContainer,
                hintText: "Sök",
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    print("Du tryckte på sök");
                    //TODO: implementera sök
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
        IconButton(
          iconSize: 50,
          icon: Icon(Icons.account_circle, size: 65),
          padding: const EdgeInsets.only(top: -10.0),
          onPressed: () {
            print("Du tryckte på konto");
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
