import 'package:flutter/material.dart';
import 'package:shop_app/screens/wishlist_screen.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Container(
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline2
              ?.copyWith(color: Colors.white),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: Colors.black,
      ),
      iconTheme: IconThemeData(color: Colors.black),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => WishlistScreen(),
              ),
            );
          },
          icon: Icon(Icons.favorite),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
