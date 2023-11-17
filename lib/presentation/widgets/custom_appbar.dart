import 'package:flutter/material.dart';
import 'package:flutter_application/core/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: whiteColor,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: blackColor,
        ),
        onPressed: () {},
      ),
      title: Center(
        child: Container(
          margin: const EdgeInsets.only(right: 50.0),
          child: const Text(
            'Contact us',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: blackColor, fontSize: 23.0),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
