import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.wuxiaNovels,
  });

  List<WuxiaNovel> wuxiaNovels;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        wuxiaNovels: List<WuxiaNovel>.from(
            json["wuxiaNovels"].map((x) => WuxiaNovel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "wuxiaNovels": List<dynamic>.from(wuxiaNovels.map((x) => x.toJson())),
      };
}

class WuxiaNovel {
  WuxiaNovel({
    required this.id,
    required this.title,
    required this.url,
    required this.lastChapterRead,
    required this.adaptedToManhwa,
    required this.hots,
    required this.translationFinished,
    required this.genres,
    required this.description,
    required this.tags,
    required this.rating,
    required this.author,
    required this.relatedSeries,
    required this.imageUrl,
    required this.v,
  });

  String id;
  String title;
  String url;
  int lastChapterRead;
  bool adaptedToManhwa;
  bool hots;
  bool translationFinished;
  List<String> genres;
  String description;
  List<String> tags;
  double rating;
  String author;
  List<String> relatedSeries;
  String imageUrl;
  int v;

  factory WuxiaNovel.fromJson(Map<String, dynamic> json) => WuxiaNovel(
        id: json["_id"],
        title: json["title"],
        url: json["url"],
        lastChapterRead: json["lastChapterRead"],
        adaptedToManhwa: json["adaptedToManhwa"],
        hots: json["hots"],
        translationFinished: json["translationFinished"],
        genres: List<String>.from(json["genres"].map((x) => x)),
        description: json["description"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        rating: json["rating"].toDouble(),
        author: json["author"],
        relatedSeries: List<String>.from(json["relatedSeries"].map((x) => x)),
        imageUrl: json["imageUrl"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "url": url,
        "lastChapterRead": lastChapterRead,
        "adaptedToManhwa": adaptedToManhwa,
        "hots": hots,
        "translationFinished": translationFinished,
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "description": description,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "rating": rating,
        "author": author,
        "relatedSeries": List<dynamic>.from(relatedSeries.map((x) => x)),
        "imageUrl": imageUrl,
        "__v": v,
      };
}
