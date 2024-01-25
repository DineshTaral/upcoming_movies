import 'package:flutter/material.dart';
import 'package:upcoming_movies/constant/api_constants.dart';
import 'package:upcoming_movies/themes/app_text_styles.dart';
import 'package:upcoming_movies/themes/dimensions.dart';

class MovieCardItem extends StatelessWidget {
  final String? url, title;

  const MovieCardItem({required this.title, required this.url, super.key});

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
                  "$mediaBaseUrl$url",
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
            ),
          ),
          child: Text(
            "$title",
            style: poppingWhiteStyle18,
          ),
        ),
      ],
    );
  }
}
