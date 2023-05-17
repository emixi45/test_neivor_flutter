import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
  }) : preferredSize = const Size(double.infinity, 50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200]),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          )),
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  @override
  final Size preferredSize;
}
