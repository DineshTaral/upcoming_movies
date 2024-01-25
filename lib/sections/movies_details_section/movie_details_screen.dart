import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:upcoming_movies/constant/api_constants.dart';
import 'package:upcoming_movies/constant/common_constants.dart';
import 'package:upcoming_movies/constant/screen_name_constants.dart';
import 'package:upcoming_movies/sections/movies_details_section/cubit/movie_details_cubit.dart';
import 'package:upcoming_movies/themes/app_colors.dart';
import 'package:upcoming_movies/themes/app_text_styles.dart';
import 'package:upcoming_movies/themes/dimensions.dart';

class MovieDetailsScreen extends StatelessWidget {
  MovieDetailsScreen({super.key});

  final _movieDetailsCubit = MovieDetailsCubit();

  @override
  Widget build(BuildContext context) {
    final map = ModalRoute.of(context)?.settings.arguments as Map;

    return BlocProvider<MovieDetailsCubit>(
      create: (context) {
        _movieDetailsCubit.getMovieDetails(movieId: map['id']);
        return _movieDetailsCubit;
      },
      child: Scaffold(
        body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
          builder: (context, state) {
            return ListView(
              padding: EdgeInsets.zero,
              children: [
                Stack(
                  // alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      //ration calculated 1:1.2
                      width: deviceWidth,
                      height: deviceWidth * 1.2,
                      padding: EdgeInsets.only(top: paddingExtraLarge),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "$mediaBaseUrl${state.movieDetailsModel.posterPath}"),
                              fit: BoxFit.fill)),
                    ),
                    Container(
                      width: deviceWidth,
                      height: deviceWidth * 1.2,
                      padding: EdgeInsets.only(
                          left: paddingMedium, bottom: paddingMedium),
                      alignment: Alignment.bottomLeft,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        gradient: LinearGradient(
                          colors: [Colors.black, Colors.black.withOpacity(.2)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.center,
                        ),
                      ),
                      child: SizedBox(
                        width: deviceWidth,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              "In Theaters ${state.movieDetailsModel.releaseDate == null ? 'Loading...' : DateFormat('MMMM dd, yyyy').format(DateTime.parse(state.movieDetailsModel.releaseDate ?? ''))}",
                              style: poppingWhiteStyle16,
                            ),
                            smallVertSpace,
                            InkWell(
                              onTap: () => push(
                                  routeName: ticketBookingScreen,
                                  arguments: {
                                    'title': state.movieDetailsModel.title,
                                    'date':
                                        "In Theaters ${state.movieDetailsModel.releaseDate == null ? 'Loading...' : DateFormat('MMMM dd, yyyy').format(DateTime.parse(state.movieDetailsModel.releaseDate ?? ''))}"
                                  }),
                              child: Container(
                                height: 50.px,
                                width: 250.px,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: skyBlueColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  "Get Tickets",
                                  style: poppingWhiteStyle14,
                                ),
                              ),
                            ),
                            smallVertSpace,
                            InkWell(
                              onTap: () => push(
                                  routeName: videoPlayerScreen,
                                  arguments: {
                                    'id': state.movieDetailsModel.id
                                  }),
                              child: Container(
                                height: 50.px,
                                width: 250.px,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: skyBlueColor)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.play_arrow,
                                      color: whiteColor,
                                      size: 20.px,
                                    ),
                                    smallHorizontalSpace,
                                    Text(
                                      "Watch Trailer",
                                      style: poppingWhiteStyle14,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: paddingMedium, top: paddingExtraLarge),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () => popScreen(),
                                icon: Icon(
                                  Icons.arrow_back_ios_new_sharp,
                                  color: whiteColor,
                                  size: 18.px,
                                )),
                            smallHorizontalSpace,
                            Text(
                              "Watch",
                              style: poppingWhiteStyle18,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                mediumVertSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: paddingMedium),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Geners",
                        style: poppingLBlackStyle16,
                      ),
                      smallVertSpace,
                      SizedBox(
                        height: 30.px,
                        width: deviceWidth,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              state.movieDetailsModel.genres?.length ?? 0,
                          itemBuilder: (context, index) {
                            Color randomColor = getRandomColor();
                            return Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  horizontal: paddingMedium),
                              decoration: BoxDecoration(
                                  color: randomColor,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text(
                                "${state.movieDetailsModel.genres?[index].name ?? ''}",
                                style: poppingWhiteStyle12.copyWith(
                                  color: randomColor.computeLuminance() > 0.5
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (ctx, idx) => smallHorizontalSpace,
                        ),
                      ),
                      smallVertSpace,
                      Divider(),
                      smallVertSpace,
                      Text(
                        "Overview",
                        style: poppingLBlackStyle16,
                      ),
                      smallVertSpace,
                      Text(
                        "${state.movieDetailsModel.overview}",
                        style: poppingLGreyStyle14,
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Color getRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}
