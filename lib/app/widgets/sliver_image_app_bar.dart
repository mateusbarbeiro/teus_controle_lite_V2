import 'dart:ui';

import 'package:background_app_bar/background_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:teus_controle_lite/app/constants.dart';
import 'package:teus_controle_lite/app/util/handle_image.dart';

class SliverImageAppBar extends StatelessWidget {
  const SliverImageAppBar({
    Key? key,
    this.actions,
    this.imageSrc
  }) : super(key: key);

  final List<Widget>? actions;
  final String? imageSrc;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      key: key ?? UniqueKey(),
      shadowColor: Colors.black,
      expandedHeight: 250.0,
      floating: false,
      pinned: true,
      snap: false,
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      actions: actions,
      flexibleSpace: BackgroundFlexibleSpaceBar(
        centerTitle: false,
        titlePadding: const EdgeInsets.only(
          left: 20.0,
          bottom: 20.0,
        ),
        background: ClipRect(
          child: Container(
            child: BackdropFilter(
              filter: ImageFilter.blur(),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.center,
                    colors: kLinearGradientAppBarColor,
                  ),
                ),
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: handleImage(imageSrc),
                fit: BoxFit.fitHeight,
              ),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
