class MovieModel {
  String? _posterPath;
  String? _title;
  int? id;

  String? get posterPath => _posterPath;

  String? get title => _title;

  MovieModel({
    required String? posterPath,
    required String? title,
    required int id,
  })  : _posterPath = posterPath,
        _title = title;

  Map<String, dynamic> toMap() {
    return {
      '_posterPath': this._posterPath,
      '_title': this._title,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      posterPath: map['poster_path'] ?? '',
      title: map['title'] as String,
      id: map['id'] as int,
    );
  }
}
