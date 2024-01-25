import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:upcoming_movies/api_client/api_client.dart';
import 'package:upcoming_movies/constant/api_constants.dart';
import 'package:upcoming_movies/sections/movies_list_section/models/genres_list_model.dart';
import 'package:upcoming_movies/sections/movies_list_section/models/movies_list_model.dart';

part 'movies_list_state.dart';

class MoviesListCubit extends Cubit<MoviesListState> {
  MoviesListCubit() : super(MoviesListState.initial());
  String? searchedText;
  ApiClient _apiClient = ApiClient();

  updateSearchFieldStatus(bool status) {
    emit(state.copyWith(searchFieldFocused: status, searchedItemsList: []));
    if (status) {
      getGeners();
    }
  }

  fetchLatestMovie() {
    emit(state.copyWith(
        isLoading: state.currentPage == 0, isLoadMore: state.currentPage > 0));
    _apiClient
        .getApi(url: upcomingMoviesListApi + "&page=${state.currentPage + 1}")
        .then((value) {
      if (value.statusCode == 200) {
        emit(state.copyWith(
            currentPage: value.data['page'],
            totalPages: value.data['total_pages'],
            isLoadMore: false,
            isFailure: false,
            isLoading: false,
            isSuccess: true,
            moviesList: [
              ...state.moviesList,
              ...value.data['results'].map((e) => MovieModel.fromJson(e))
            ]));
      }
    }).catchError((onError) {
      debugPrint("error in fetch latest movie api $onError");
      emit(state.copyWith(
        isLoadMore: false,
        isLoading: false,
        isFailure: true,
        isSuccess: false,
      ));
    });
  }

  getGeners() {
    _apiClient.getApi(url: getGenresListApi).then((value) {
      if (value.statusCode == 200) {
        emit(state.copyWith(
            genresListModel: GenresListModel.fromJson(value.data)));
      }
    }).catchError((onError) {
      debugPrint("error in get geners api $onError");
    });
  }

  searchMovies({required String value}) {
    if (value.length > 2) {
      searchedText = value;
      Future.delayed(Duration(seconds: 2), () {
        if (value == value) {
          _apiClient
              .getApi(url: searchMovieApi + "&query=$value")
              .then((value) {
            debugPrint(" search api data ${value.data}");
            List<MovieModel> temp = [];
            value.data['results']
                .forEach((e) => temp.add(MovieModel.fromJson(e)));
            emit(state.copyWith(searchedItemsList: temp));
          }).catchError((onError) {
            debugPrint("error in search data $onError");
          });
        }
      });
    }
  }
}
