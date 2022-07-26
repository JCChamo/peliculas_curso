import 'dart:convert';

class FilmographyMovie {
    FilmographyMovie({
        this.adult,
        this.backdropPath,
        this.genreIds,
        this.id,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.releaseDate,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount,
        this.character,
        this.creditId,
        this.order,
        this.department,
        this.job,
    });

    bool? adult;
    String? backdropPath;
    List<int>? genreIds;
    int? id;
    String? originalLanguage;
    String? originalTitle;
    String? overview;
    double? popularity;
    String? posterPath;
    String? releaseDate;
    String? title;
    bool? video;
    double? voteAverage;
    int? voteCount;
    String? character;
    String? creditId;
    int? order;
    String? department;
    String? job;

    get fullPosterPath {
      if (posterPath != null) {
        return 'https://image.tmdb.org/t/p/w500$posterPath';
      } 
      return 'https://i.stack.imgur.com/GNhxO.png';
    }

    factory FilmographyMovie.fromJson(String str) => FilmographyMovie.fromMap(json.decode(str));

    factory FilmographyMovie.fromMap(Map<String, dynamic> json) => FilmographyMovie(
        adult: json["adult"] == null ? null : json["adult"],
        backdropPath: json["backdrop_path"] == null ? null : json["backdrop_path"],
        genreIds: json["genre_ids"] == null ? null : List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"] == null ? null : json["id"],
        originalLanguage: json["original_language"] == null ? null : json["original_language"],
        originalTitle: json["original_title"] == null ? null : json["original_title"],
        overview: json["overview"] == null ? null : json["overview"],
        popularity: json["popularity"] == null ? null : json["popularity"].toDouble(),
        posterPath: json["poster_path"] == null ? null : json["poster_path"],
        releaseDate: json["release_date"] == null ? null : json["release_date"],
        title: json["title"] == null ? null : json["title"],
        video: json["video"] == null ? null : json["video"],
        voteAverage: json["vote_average"] == null ? null : json["vote_average"].toDouble(),
        voteCount: json["vote_count"] == null ? null : json["vote_count"],
        character: json["character"] == null ? null : json["character"],
        creditId: json["credit_id"] == null ? null : json["credit_id"],
        order: json["order"] == null ? null : json["order"],
        department: json["department"] == null ? null : json["department"],
        job: json["job"] == null ? null : json["job"],
    );
}