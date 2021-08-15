import 'dart:convert' as convert;

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackathon_fatura/tasks/third_task/data/models/movie_model.dart';
import 'package:hackathon_fatura/tasks/third_task/data/models/movie_page.dart';
import 'package:hackathon_fatura/tasks/third_task/helper/utility.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../../third_task_constants.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieInitial());

  MoviePage? moviePage;

  static MovieCubit get(context) => BlocProvider.of(context);

  void getMovies(MoviesSortBy moviesSortBy) async {
    emit(MovieLoading());

    // Await the http get response, then decode the json-formatted response.
    var url = Uri.parse(ThirdTaskConstants.BaseURL +
        ThirdTaskConstants.BaseAPIVersion +
        ThirdTaskConstants.MovieEndpoint +
        '?api_key=' +
        ThirdTaskConstants.TheMovieDBAPIKey +
        '&sort_by=' +
        '${moviesSortBy.value}&page=1');

    var response = await http.get(url); // this returns future
    if (response.statusCode == 200) {
      // if everyThing is OK
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
      moviePage = MoviePage.fromJson(jsonResponse);
      emit(MovieLoadedSuccessfully());
      return jsonResponse;
    }
  }

  void changeFavorite(MovieModel movieModel) {
    if (Utility.box.get(movieModel.id) == null) {
      Utility.box.put(movieModel.id, movieModel.toMap());
    } else{
      Utility.box.delete(movieModel.id);
    }
    emit(MovieFavouriteChanged());
  }
}
