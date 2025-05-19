import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Hanks livs"),
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          iconSize: 50,
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            print("Du tryckte på varukorg");
          },
        ),
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
                prefixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    print("Du tryckte på sök");
                    //TODO: implementera sök
                  },
                ),
                hintText: "Sök",
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
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
