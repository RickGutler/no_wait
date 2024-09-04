import 'package:flutter/material.dart';
import 'package:no_wait/style/app_colors.dart';

class AppBarCustomizadaMenu extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarCustomizadaMenu({super.key});

  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;

    return PreferredSize(
        preferredSize: Size.fromHeight(paddingTop + 62),
        child: SizedBox(
          height: paddingTop + 62,
          child: Column(
            children: [
              SizedBox(height: paddingTop + 12),
              const Stack(
                alignment: Alignment.centerRight,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Sua localização',
                        style: TextStyle(
                            fontFamily: 'inter', color: Color(0xff8e8e8e)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.pin_drop_rounded,
                            color: AppColors.corPrincipal,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text('Restaurante Teste')
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 40.0),
                        child: Icon(
                          Icons.notification_important_rounded,
                          color: AppColors.corPrincipal,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}
