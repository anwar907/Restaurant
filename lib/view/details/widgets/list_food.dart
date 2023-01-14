import 'package:flutter/material.dart';
import 'package:restourant/models/drink.dart';

class ListFood extends StatelessWidget {
  const ListFood({super.key, required this.menus});
  final List<Drink>? menus;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < menus!.length; i++) Text('${menus?[i].name}')
      ],
    );
  }
}
