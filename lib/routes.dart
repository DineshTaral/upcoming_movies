import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:upcoming_movies/constant/screen_name_constants.dart';
import 'package:upcoming_movies/sections/DashboardSection/dashboard_screen.dart';
import 'package:upcoming_movies/sections/movies_details_section/movie_details_screen.dart';
import 'package:upcoming_movies/sections/movies_list_section/movies_list_screen.dart';
import 'package:upcoming_movies/sections/tickects_booking_section/seats_selection_screen.dart';
import 'package:upcoming_movies/sections/tickects_booking_section/ticket_booking_screen.dart';

import 'sections/movies_details_section/video_player_section/video_player_screen.dart';

Route<dynamic> generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case dashboardScreen:
      return getPage(widget: DashboardScreen(), settings: settings);
    case movieDetailsScreen:
      return getPage(widget: MovieDetailsScreen(), settings: settings);
    case moviesListScreen:
      return getPage(widget: MoviesListScreen(), settings: settings);
    case seatsSelectionScreen:
      return getPage(widget: SeatsSelectionScreen(), settings: settings);
    case ticketBookingScreen:
      return getPage(widget: TicketsBookingScreen(), settings: settings);

    case videoPlayerScreen:
      return getPage(widget: VideoPlayerScreen(), settings: settings);
    default:
      return getPage(settings: settings, widget: DashboardScreen());
  }
}

getPage({required Widget widget, required RouteSettings settings}) {
  return PageTransition(
      child: widget,
      type: PageTransitionType.rightToLeft,
      settings: settings,
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 300));
}
