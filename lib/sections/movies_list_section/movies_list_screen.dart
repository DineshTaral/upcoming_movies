import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:upcoming_movies/constant/common_constants.dart';
import 'package:upcoming_movies/constant/screen_name_constants.dart';
import 'package:upcoming_movies/sections/movies_list_section/cubit/movies_list_cubit.dart';
import 'package:upcoming_movies/sections/movies_list_section/widgets/geners_item_widget.dart';
import 'package:upcoming_movies/sections/movies_list_section/widgets/movie_card_item.dart';
import 'package:upcoming_movies/sections/movies_list_section/widgets/searched_movie_item_widget.dart';
import 'package:upcoming_movies/themes/app_colors.dart';
import 'package:upcoming_movies/themes/app_text_styles.dart';
import 'package:upcoming_movies/themes/dimensions.dart';
import 'package:upcoming_movies/widgets/loading_view_widget.dart';

class MoviesListScreen extends StatelessWidget {
  MoviesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _moviesListCubit = BlocProvider.of<MoviesListCubit>(context);
    _moviesListCubit.fetchLatestMovie();
    return BlocBuilder<MoviesListCubit, MoviesListState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(paddingMedium, deviceWidth * .2,
                  paddingMedium, paddingMedium),
              child: state.searchFieldFocused
                  ? TextFormField(
                      onChanged: (v) => _moviesListCubit.searchMovies(value: v),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(paddingSmall),
                        hintText: "TV shows, movies and more",
                        hintStyle: poppingDGreyStyle14,
                        prefixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.search_rounded, color: lightBlackColor),
                          ],
                        ),
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  _moviesListCubit
                                      .updateSearchFieldStatus(false);
                                },
                                icon:
                                    Icon(Icons.close, color: lightBlackColor)),
                          ],
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: darkGreyColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: darkGreyColor)),
                      ),
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        debugPrint("test done");
                      },
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Watch",
                          style: poppingLBlackStyle16,
                        ),
                        InkWell(
                            onTap: () =>
                                _moviesListCubit.updateSearchFieldStatus(true),
                            child: Icon(
                              Icons.search_rounded,
                              color: lightBlackColor,
                            ))
                      ],
                    ),
            ),
            Expanded(
              child: Container(
                color: darkGreyColor.withOpacity(.1),
                child: ListView(
                  children: [
                    state.isLoading
                        ? Center(
                            child: LoadingViewWidget(),
                          )
                        : state.searchFieldFocused
                            ? state.searchedItemsList.length > 0
                                ? ListView.separated(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.all(paddingMedium),
                                    itemBuilder: (ctx, index) {
                                      return InkWell(
                                          onTap: () => push(
                                                  routeName: movieDetailsScreen,
                                                  arguments: {
                                                    'id': state
                                                        .searchedItemsList[
                                                            index]
                                                        .id
                                                  }),
                                          child: SearchedMovieItemWidget(
                                              posterPath: state
                                                  .searchedItemsList[index]
                                                  .posterPath,
                                              title: state
                                                  .searchedItemsList[index]
                                                  .title,
                                              genre:
                                                  "${state.searchedItemsList[index].genreIds?.isEmpty ?? true ? '' : state.genresListModel.genres?.where((element) => element.id == state.searchedItemsList[index].genreIds?[0])}"));
                                    },
                                    separatorBuilder: (ctx, idx) {
                                      return mediumVertSpace;
                                    },
                                    itemCount: state.searchedItemsList.length,
                                  )
                                : GridView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.all(paddingMedium),
                                    itemCount:
                                        state.genresListModel.genres?.length ??
                                            0,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: (2),
                                      mainAxisSpacing: paddingSmall,
                                      crossAxisSpacing: paddingSmall,
                                    ),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GenresItemWidget(
                                        name: state.genresListModel
                                                .genres?[index].name ??
                                            '',
                                      );
                                    },
                                  )
                            : ListView.separated(
                                padding: EdgeInsets.fromLTRB(paddingMedium, 0,
                                    paddingMedium, paddingMedium),
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (ctx, index) {
                                  return InkWell(
                                      onTap: () => push(
                                              routeName: movieDetailsScreen,
                                              arguments: {
                                                'id': state.moviesList[index].id
                                              }),
                                      child: MovieCardItem(
                                          title: state.moviesList[index].title,
                                          url: state
                                              .moviesList[index].posterPath));
                                },
                                separatorBuilder: (ctx, index) {
                                  return mediumVertSpace;
                                },
                                itemCount: state.moviesList.length,
                              ),
                    if ((state.totalPages ?? 1) > state.currentPage &&
                        !state.searchFieldFocused &&
                        state.isSuccess)
                      state.isLoadMore
                          ? LoadingViewWidget()
                          : GestureDetector(
                              onTap: () => _moviesListCubit.fetchLatestMovie(),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: darkGreyColor,
                                    borderRadius: BorderRadius.circular(8)),
                                height: 0.5.dp,
                                alignment: Alignment.center,
                                margin: EdgeInsets.fromLTRB(deviceWidth * .15,
                                    0, deviceWidth * .15, paddingMedium),
                                child: Text(
                                  "Load More",
                                  style: poppingWhiteStyle18,
                                ),
                              ),
                            ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
