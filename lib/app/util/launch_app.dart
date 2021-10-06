import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

launchApp(BuildContext context, String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text('Alerta!'),
          content: Text('Não foi possível encontrar um APP compatível.'),
        );
      },
    );
  }
}
