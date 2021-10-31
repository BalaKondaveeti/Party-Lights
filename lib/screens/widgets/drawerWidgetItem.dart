import 'package:flutter/material.dart';

class DrawerWidgetItem extends StatelessWidget {
  final double width;
  final String name;
  final IconData icon;
  final Color color;
  final void Function()? onClicked;
  const DrawerWidgetItem(
      {required width,
      required name,
      required icon,
      required color,
      required onClicked})
      : this.color = color,
        this.width = width,
        this.icon = icon,
        this.name = name,
        this.onClicked = onClicked;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: InkWell(
            onTap: onClicked,
            child: Container(
              height: 80,
              width: width - 10,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 20,
                    ),
                  ),
                  Icon(
                    icon,
                    color: color,
                  ),
                ],
              ),
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
