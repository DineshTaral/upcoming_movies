import 'package:flutter/material.dart';
import 'package:upcoming_movies/constant/common_constants.dart';
import 'package:upcoming_movies/themes/app_text_styles.dart';
import 'package:upcoming_movies/themes/dimensions.dart';

class GenresItemWidget extends StatelessWidget {
  final String? name;

  const GenresItemWidget({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: deviceWidth,
          height: deviceWidth * .45,
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  imagePlaceholder,
                ),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Container(
          width: deviceWidth,
          height: deviceWidth * .45,
          padding: EdgeInsets.only(left: paddingMedium, bottom: paddingMedium),
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              stops: [0, 03],
            ),
          ),
          child: Text(
            "$name",
            style: poppingWhiteStyle16,
          ),
        ),
      ],
    );
  }
}
