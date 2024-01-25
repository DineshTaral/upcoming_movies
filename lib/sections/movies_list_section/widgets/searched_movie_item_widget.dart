import 'package:flutter/material.dart';
import 'package:upcoming_movies/constant/api_constants.dart';
import 'package:upcoming_movies/themes/app_colors.dart';
import 'package:upcoming_movies/themes/app_text_styles.dart';
import 'package:upcoming_movies/themes/dimensions.dart';

class SearchedMovieItemWidget extends StatelessWidget {
  final String? posterPath, title, genre;

  const SearchedMovieItemWidget(
      {required this.posterPath,
      required this.title,
      required this.genre,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Container(
          width: deviceWidth * .26,
          height: deviceWidth * .2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage("$mediaBaseUrl$posterPath"),
                  fit: BoxFit.cover)),
        ),
        mediumHorizontalSpace,
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$title",
              style: poppingLBlackStyle16,
            ),
            smallVertSpace,
            Text(
              "$genre",
              style: poppingLGreyStyle14,
            ),
          ],
        )),
        Row(
          children: List.generate(
              3,
              (index) => Container(
                    margin: EdgeInsets.only(left: paddingExtraSmall),
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                        color: skyBlueColor, shape: BoxShape.circle),
                  )),
        )
      ],
    ));
  }
}
