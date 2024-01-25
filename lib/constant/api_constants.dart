import 'package:flutter_dotenv/flutter_dotenv.dart';

const _baseUrl = "https://api.themoviedb.org/3";
const mediaBaseUrl = "https://image.tmdb.org/t/p/w440_and_h660_face/";
final _apiKey = dotenv.env['API_TOKEN'];
final upcomingMoviesListApi = "$_baseUrl/movie/upcoming?api_key=$_apiKey";
final getGenresListApi = "$_baseUrl/genre/movie/list?api_key=$_apiKey";
final searchMovieApi = "$_baseUrl/search/movie?api_key=$_apiKey";

String getMovieDetailsApi(int movieId) =>
    "$_baseUrl/movie/$movieId?api_key=$_apiKey";

String getMovieVideosApi(int movieId) =>
    "$_baseUrl/movie/$movieId/videos?api_key=$_apiKey";
