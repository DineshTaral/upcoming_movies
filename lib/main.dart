import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:upcoming_movies/constant/common_constants.dart';
import 'package:upcoming_movies/routes.dart';
import 'package:upcoming_movies/sections/DashboardSection/dashboard_screen.dart';
import 'package:upcoming_movies/sections/movies_list_section/cubit/movies_list_cubit.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return BlocProvider(
        create: (context) => MoviesListCubit(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: NavigationService.navigatorKey,
          onGenerateRoute: generateRoutes,
          home: DashboardScreen(),
        ),
      );
    });
  }
}
