class Movie {
  final String title;
  final String year;
  final String imdbID;
  final String type;
  final String poster;
  final List<String> genres;
  final double imdbRating;

  Movie({
    required this.title,
    required this.year,
    required this.imdbID,
    required this.type,
    required this.poster,
    required this.genres,
    required this.imdbRating,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'] ?? '',
      year: json['Year'] ?? '',
      imdbID: json['imdbID'] ?? '',
      type: json['Type'] ?? '',
      poster: json['Poster'] ?? '',
      genres: json['Genre']?.toString().split(', ') ?? ['Action'],
      imdbRating: double.tryParse(json['imdbRating'] ?? '0') ?? 0.0,
    );
  }
}
