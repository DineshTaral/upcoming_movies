part of 'movies_list_cubit.dart';

class MoviesListState extends Equatable {
  final bool isLoading;
  final bool isFailure;
  final bool isSuccess;
  final bool isLoadMore;
  final int currentPage;
  final int? totalPages;
  final bool searchFieldFocused;
  final List<MovieModel> moviesList;
  final List<MovieModel> searchedItemsList;
  final GenresListModel genresListModel;

  const MoviesListState({
    required this.isLoading,
    required this.isFailure,
    required this.isSuccess,
    required this.currentPage,
    required this.moviesList,
    required this.isLoadMore,
    required this.searchFieldFocused,
    required this.searchedItemsList,
    required this.genresListModel,
    this.totalPages,
  });

  factory MoviesListState.initial() => MoviesListState(
        isLoading: false,
        isFailure: false,
        isSuccess: false,
        searchFieldFocused: false,
        isLoadMore: false,
        currentPage: 0,
        moviesList: [],
        searchedItemsList: [],
        genresListModel: GenresListModel(),
        totalPages: null,
      );

  MoviesListState copyWith({
    bool? isLoading,
    bool? isFailure,
    bool? isSuccess,
    bool? isLoadMore,
    int? currentPage,
    int? totalPages,
    bool? searchFieldFocused,
    List<MovieModel>? searchedItemsList,
    List<MovieModel>? moviesList,
    GenresListModel? genresListModel,
  }) {
    return MoviesListState(
      currentPage: currentPage ?? this.currentPage,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      isLoading: isLoading ?? this.isLoading,
      moviesList: moviesList ?? this.moviesList,
      isLoadMore: isLoadMore ?? this.isLoadMore,
      totalPages: totalPages ?? this.totalPages,
      searchedItemsList: searchedItemsList ?? this.searchedItemsList,
      searchFieldFocused: searchFieldFocused ?? this.searchFieldFocused,
      genresListModel: genresListModel ?? this.genresListModel,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        isFailure,
        isSuccess,
        currentPage,
        isLoadMore,
        searchFieldFocused,
        moviesList,
        searchedItemsList,
        genresListModel,
      ];
}
