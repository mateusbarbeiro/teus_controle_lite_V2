import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DismissibleItem extends StatelessWidget {
  const DismissibleItem({
    Key? key,
    required this.dismissibleWidget,
    this.direction = DismissDirection.startToEnd,
    this.backgroundColor = Colors.redAccent,
    this.backgroundIcon,
    this.backgroundIconColor = Colors.white,
    this.onDismissed,
    this.backgroundIconSize = 50.0
  }) : super(key: key);

  final Widget dismissibleWidget;
  final DismissDirection direction;
  final Color backgroundColor;
  final IconData? backgroundIcon;
  final Color backgroundIconColor;
  final double backgroundIconSize;
  final Function? onDismissed;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      child: dismissibleWidget,
      key: key ?? UniqueKey(),
      onDismissed: (direction) {
        if (onDismissed != null) {
          onDismissed!();
        }
      },
      direction: direction,
      background: Container(
        color: backgroundColor,
        child: backgroundIcon != null
            ? Align(
                alignment: const Alignment(-0.9, 0),
                child: Icon(
                  backgroundIcon,
                  color: backgroundIconColor,
                  size: backgroundIconSize,
                ),
              )
            : null,
      ),
    );
  }
}
