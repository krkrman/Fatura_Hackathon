import 'package:hackathon_fatura/tasks/third_task/data/models/movie_model.dart';

class MoviePage {
  List<MovieModel>? movies;

  Map<String, dynamic> toMap() {
    return {
      'movies': this.movies,
    };
  }

  MoviePage.fromJson(dynamic json) {
    if (json["results"] != null) {
      movies = [];
      json["results"].forEach((v) {
        movies!.add(MovieModel.fromMap(v));
      });
    }
  }
}
