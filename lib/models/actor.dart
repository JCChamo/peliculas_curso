import 'dart:convert';

class Actor {
  Actor({
    this.adult,
    this.alsoKnownAs,
    this.biography,
    this.birthday,
    this.deathday,
    this.gender,
    this.id,
    this.imdbId,
    this.knownForDepartment,
    this.name,
    this.placeOfBirth,
    this.popularity,
    this.profilePath,
  });

  bool? adult;
  List<String>? alsoKnownAs;
  String? biography;
  DateTime? birthday;
  dynamic deathday;
  int? gender;
  int? id;
  String? imdbId;
  String? knownForDepartment;
  String? name;
  String? placeOfBirth;
  double? popularity;
  String? profilePath;

  get fullProfilePath {
    if (profilePath != null) {
      return 'https://image.tmdb.org/t/p/w500$profilePath';
    }
  }

  factory Actor.fromJson(String str) => Actor.fromMap(json.decode(str));

  factory Actor.fromMap(Map<String, dynamic> json) => Actor(
        adult: json['adult'] == null ? null : json['adult'],
        alsoKnownAs: json['also_known_as'] == null
            ? null
            : List<String>.from(json['also_known_as'].map((x) => x)),
        biography: json['biography'] == null ? null : json['biography'],
        birthday:
            json['birthday'] == null ? null : DateTime.parse(json['birthday']),
        deathday: json['deathday'],
        gender: json['gender'] == null ? null : json['gender'],
        id: json['id'] == null ? null : json['id'],
        imdbId: json['imdb_id'] == null ? null : json['imdb_id'],
        knownForDepartment: json['known_for_department'] == null
            ? null
            : json['known_for_department'],
        name: json['name'] == null ? null : json['name'],
        placeOfBirth:
            json['place_of_birth'] == null ? null : json['place_of_birth'],
        popularity:
            json['popularity'] == null ? null : json['popularity'].toDouble(),
        profilePath: json['profile_path'] == null ? null : json['profile_path'],
      );
}
