import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:upcoming_movies/api_client/api_client.dart';
import 'package:upcoming_movies/constant/api_constants.dart';
import 'package:upcoming_movies/sections/movies_details_section/models/movie_details_model.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit() : super(MovieDetailsState.initial());

  ApiClient _apiClient = ApiClient();

  getMovieDetails({required int movieId}) {
    _apiClient.getApi(url: getMovieDetailsApi(movieId)).then((value) {
      if (value.statusCode == 200) {
        emit(state.copyWith(
            movieDetailsModel: MovieDetailsModel.fromJson(value.data)));
      }
    }).catchError((onError) {
      debugPrint("error in get movie details api $onError");
    });
  }

  getVideos({required int movieId}) {
    _apiClient.getApi(url: getMovieDetailsApi(movieId)).then((value) {
      if (value.statusCode == 200) {
        emit(state.copyWith(
            movieDetailsModel: MovieDetailsModel.fromJson(value.data)));
      }
    }).catchError((onError) {
      debugPrint("error in get movie details api $onError");
    });
  }
}
