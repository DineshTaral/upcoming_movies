// api_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:upcoming_movies/api_client/api_client.dart';
import 'package:upcoming_movies/constant/api_constants.dart';

class ApiCubit extends Cubit<String> {
  ApiCubit() : super('');
  final _apiClient = ApiClient();

  void fetchData({required int movieId}) async {
    _apiClient.getApi(url: getMovieVideosApi(movieId)).then((value) {
      if (value.statusCode == 200) {
        emit(value.data['results'][0]['key']);
      } else {
        emit('Error fetching key: $onError');
      }
    }).catchError((onError) {
      emit('Error fetching key: $onError');
    });

  }
}
