import 'menus.dart';

class ListRestourant {
  ListRestourant({
    this.restaurants,
  });

  List<Restaurant?>? restaurants;

  factory ListRestourant.fromJson(Map<String, dynamic> json) => ListRestourant(
        restaurants: json["restaurants"] == null
            ? []
            : List<Restaurant?>.from(
                json["restaurants"]!.map((x) => Restaurant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "restaurants": restaurants == null
            ? []
            : List<dynamic>.from(restaurants!.map((x) => x?.toJson())),
      };
}

class Restaurant {
  Restaurant({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
    this.menus,
  });

  String? id;
  String? name;
  String? description;
  String? pictureId;
  String? city;
  double? rating;
  Menus? menus;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"].toDouble(),
        menus: Menus.fromJson(json["menus"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "city": city,
        "rating": rating,
        "menus": menus?.toJson(),
      };
}
