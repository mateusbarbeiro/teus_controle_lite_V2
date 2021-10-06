import 'package:flutter/material.dart';
import 'package:teus_controle_lite/app/constants.dart';
import 'package:teus_controle_lite/app/util/handle_image.dart';

class CardItem extends StatelessWidget {
  final String? imageScr;
  final String title;
  final String description;
  final Function? onPressed;

  const CardItem({
    Key? key,
    this.imageScr,
    required this.title,
    required this.description,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        children: <Widget>[
          Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            ListTile(
              leading: imageScr != null
                  ? Image(
                      image: handleImage(imageScr),
                      alignment: Alignment.topCenter,
                      width: 60,
                      fit: BoxFit.scaleDown,
                    )
                  : null,
              title: Text(
                title,
                style: kCardTitleStyle,
              ),
              subtitle: RichText(
                overflow: TextOverflow.ellipsis,
                strutStyle: const StrutStyle(fontSize: 12.0),
                text: TextSpan(
                  text: description,
                  style: kCardDescriptionStyle,
                ),
              ),
            ),
          ]),
          Positioned(
            left: 0.0,
            top: 0.0,
            bottom: 0.0,
            right: 0.0,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () async {
                  await Future.delayed(const Duration(milliseconds: 700));
                  if (onPressed != null) {
                    onPressed!();
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
