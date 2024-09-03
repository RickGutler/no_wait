import 'package:flutter/material.dart';

class AppBarCustomizada extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustomizada({super.key});

  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;

    return PreferredSize(
        preferredSize: Size.fromHeight(paddingTop + 50),
        child: SizedBox(
          height: paddingTop + 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: paddingTop),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child:
                    SizedBox(height: 25, child: Image.asset("assets/logo.png")),
              ),
            ],
          ),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}
