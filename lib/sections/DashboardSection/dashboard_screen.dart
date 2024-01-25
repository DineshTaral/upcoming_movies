import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:upcoming_movies/gen/assets.gen.dart';
import 'package:upcoming_movies/sections/DashboardSection/cubit/dashboard_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upcoming_movies/sections/movies_list_section/movies_list_screen.dart';
import 'package:upcoming_movies/themes/app_colors.dart';
import 'package:upcoming_movies/themes/app_text_styles.dart';
import 'package:upcoming_movies/themes/dimensions.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _dashboardCubit = DashboardCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _dashboardCubit,
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          print((" oi  ${state.selectedIndex}"));
          return Scaffold(
              bottomNavigationBar: Container(
                height: 8.h,
                width: deviceWidth,
                decoration: BoxDecoration(
                    color: darkBlueColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(27),
                        topRight: Radius.circular(27))),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.transparent,
                  currentIndex: state.selectedIndex,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: darkGreyColor,
                  unselectedLabelStyle: robotoStyle14,
                  selectedLabelStyle:
                      robotoStyle14.copyWith(fontWeight: FontWeight.w700),
                  iconSize: 15.sp,
                  onTap: (index) {
                    _dashboardCubit.updateIndex(index: index);
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage(
                          Assets.navigationIcons.dashboardIcon.path)),
                      label: 'Dashboard',
                    ),
                    BottomNavigationBarItem(
                      icon: ImageIcon(
                          AssetImage(Assets.navigationIcons.watchIcon.path)),
                      label: 'Watch',
                    ),
                    BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage(
                          Assets.navigationIcons.mediaLibraryIcon.path)),
                      label: 'Media Library',
                    ),
                    BottomNavigationBarItem(
                      icon: ImageIcon(
                          AssetImage(Assets.navigationIcons.moreIcon.path)),
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
              body: state.selectedIndex == 0
                  ? Center(
                      child: Text("Dashboard Section"),
                    )
                  : state.selectedIndex == 1
                      ? MoviesListScreen()
                      : state.selectedIndex == 2
                          ? Center(
                              child: Text("My Library Section"),
                            )
                          : Center(
                              child: Text("More Section"),
                            ));
        },
      ),
    );
  }
}
