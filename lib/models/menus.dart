import 'drink.dart';

class Menus {
  Menus({
    this.foods,
    this.drinks,
  });

  List<Drink>? foods;
  List<Drink>? drinks;

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        foods: json["foods"] == null
            ? []
            : List<Drink>.from(json["foods"]!.map((x) => Drink.fromJson(x))),
        drinks: json["drinks"] == null
            ? []
            : List<Drink>.from(json["drinks"]!.map((x) => Drink.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "foods": foods == null
            ? []
            : List<dynamic>.from(foods!.map((x) => x.toJson())),
        "drinks": drinks == null
            ? []
            : List<dynamic>.from(drinks!.map((x) => x.toJson())),
      };
}
