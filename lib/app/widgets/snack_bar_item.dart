import 'package:flutter/material.dart';
import 'package:teus_controle_lite/app/constants.dart';

class SnackBarItem {
  const SnackBarItem({
    Key? key,
    required this.title,
    this.buttonLabel,
    this.onActionPressed ,
    required this.context
  });

  final BuildContext context;
  final String title;
  final String? buttonLabel;
  final void Function()? onActionPressed;

  SnackBar customSnackbar() {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return SnackBar(
      content: Text(
        title,
        style: kSnackBarTextStyle,
      ),
      action: buttonLabel != null && onActionPressed != null
          ? SnackBarAction(
              label: buttonLabel!,
              onPressed: onActionPressed!,
              textColor: Colors.white54,
            )
          : null,
      // backgroundColor: const Color.fromRGBO(255, 108, 0, 1),
      duration: const Duration(milliseconds: 900),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      width: queryData.size.width - 10,
      behavior: SnackBarBehavior.floating,
    );
  }
}
