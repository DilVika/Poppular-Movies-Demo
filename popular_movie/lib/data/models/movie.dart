class Movie {
  final int _id;
  final bool? _isAdult;
  final String? _language;
  final String _title;
  final String _overview;
  final String? _image;
  final double? _popularity;
  final String _releaseDate;
  final double _voteAverage;
  final int? _voteCount;

  Movie(
      {required int id,
      bool? isAdult,
      String? language,
      required String title,
      required String overview,
      String? image,
      double? popularity,
      required String releaseDate,
      required double voteAverage,
      int? voteCount})
      : _id = id,
        _isAdult = isAdult,
        _language = language,
        _title = title,
        _overview = overview,
        _popularity = popularity,
        _image = image,
        _releaseDate = releaseDate,
        _voteAverage = voteAverage,
        _voteCount = voteCount;

  factory Movie.fromJson(Map<String, dynamic> json) {
    final image = "https://image.tmdb.org/t/p/w200/${json['poster_path']}";
    return Movie(
        id: json['id'],
        isAdult: json['adult'],
        language: json['language'],
        title: json['title'],
        overview: json['overview'],
        image: image,
        popularity: json['popularity'],
        releaseDate: json['release_date'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count']);
  }

  Map<String, dynamic> toJson() => {
        'id': _id,
        'adult': _isAdult,
        'language': _language,
        'title': _title,
        'overview': _overview,
        'popularity': _popularity,
        'release_date': _releaseDate,
        'vote_average': _voteAverage,
        'vote_count': _voteCount
      };

  int get id => _id;

  int? get voteCount => _voteCount;

  double get voteAverage => _voteAverage;

  String get releaseDate => _releaseDate;

  double? get popularity => _popularity;

  String? get image => _image;

  String get overview => _overview;

  String get title => _title;

  String? get language => _language;

  bool? get isAdult => _isAdult;
}
