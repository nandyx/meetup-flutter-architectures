class Movie {
  final int id;
  final String image;
  final String title;
  final double voteAverage;
  final String overview;
  final String releaseDate;

  Movie({
    this.id,
    this.image,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      image: 'https://image.tmdb.org/t/p/w500/${json['poster_path']}',
      title: json['title'],
      voteAverage: double.parse(json['vote_average'].toString()),
      overview: json['overview'],
      releaseDate: json['release_date'],
    );
  }
}
