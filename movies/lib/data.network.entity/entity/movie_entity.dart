class UpcomingMovies {
  List<MovieEntity> results;

  UpcomingMovies({
    required this.results,
  });
}

class MovieEntity {
  String id;
  String resultId;
  PrimaryImage? primaryImage;
  TitleType titleType;
  TitleText titleText;
  ReleaseYear releaseYear;
  ReleaseDate releaseDate;

  MovieEntity({
    required this.id,
    required this.resultId,
    this.primaryImage,
    required this.titleType,
    required this.titleText,
    required this.releaseYear,
    required this.releaseDate,
  });
}

class TitleText {
  String text;

  TitleText({
    required this.text,
  });
}

class PrimaryImage {
  String id;
  int width;
  int height;
  String url;
  Caption caption;

  PrimaryImage({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.caption,
  });
}

class Caption {
  String plainText;

  Caption({
    required this.plainText,
  });
}

class ReleaseDate {
  int day;
  int month;
  int year;

  ReleaseDate({
    required this.day,
    required this.month,
    required this.year,
  });
}

class ReleaseYear {
  int year;
  int? endYear;

  ReleaseYear({
    required this.year,
    this.endYear,
  });
}

class TitleType {
  String text;
  String id;
  bool isSeries;
  bool isEpisode;
  List<Category> categories;
  bool canHaveEpisodes;

  TitleType({
    required this.text,
    required this.id,
    required this.isSeries,
    required this.isEpisode,
    required this.categories,
    required this.canHaveEpisodes,
  });
}

class Category {
  Caption value;

  Category({
    required this.value,
  });
}

class DisplayableProperty {
  Caption value;

  DisplayableProperty({
    required this.value,
  });
}
