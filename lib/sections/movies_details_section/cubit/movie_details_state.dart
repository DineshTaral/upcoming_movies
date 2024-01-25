part of 'movie_details_cubit.dart';

class MovieDetailsState extends Equatable {
  final bool isLoading;
  final bool isFailure;
  final bool isSuccess;
  final MovieDetailsModel movieDetailsModel;

  const MovieDetailsState({
    required this.isLoading,
    required this.isFailure,
    required this.isSuccess,
    required this.movieDetailsModel,
  });

  factory MovieDetailsState.initial() => MovieDetailsState(
      isLoading: false,
      isFailure: false,
      isSuccess: false,
      movieDetailsModel: MovieDetailsModel());

  MovieDetailsState copyWith(
      {bool? isLoading,
      bool? isFailure,
      bool? isSuccess,
      MovieDetailsModel? movieDetailsModel}) {
    return MovieDetailsState(
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      isLoading: isLoading ?? this.isLoading,
      movieDetailsModel: movieDetailsModel ?? this.movieDetailsModel,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        isFailure,
        isSuccess,
        movieDetailsModel,
      ];
}
