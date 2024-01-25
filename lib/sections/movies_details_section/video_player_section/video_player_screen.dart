import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upcoming_movies/constant/common_constants.dart';
import 'package:upcoming_movies/sections/movies_details_section/video_player_section/cubit/video_player_cubit.dart';
import 'package:upcoming_movies/themes/dimensions.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  @override
  void initState() {
    // TODO: implement initState
    changeOrientationToLandscape();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final map = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      body: BlocProvider<ApiCubit>(
        create: (context) => ApiCubit(),
        child: BlocBuilder<ApiCubit, String>(
          builder: (ctx, state) {
            if (state.isEmpty) {
              BlocProvider.of<ApiCubit>(ctx).fetchData(movieId: map['id']);
              return Center(child: CircularProgressIndicator());
            } else {
              return Stack(
                children: [
                  YoutubePlayer(
                    controller: YoutubePlayerController(
                      initialVideoId: state,
                      flags: YoutubePlayerFlags(
                        autoPlay: true,
                        mute: false,
                      ),
                    ),
                    showVideoProgressIndicator: true,
                    onEnded: (controller) {
                      changeOrientationToPortrait();
                      popScreen();
                    },
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: paddingMedium, left: paddingMedium),
                      child: ElevatedButton(
                        onPressed: () {
                          changeOrientationToPortrait();
                          popScreen();
                        },
                        child: Text('Done'),
                      ),
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }

  changeOrientationToLandscape() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeRight,
    ]);
  }

  changeOrientationToPortrait() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
