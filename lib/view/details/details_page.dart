import 'package:flutter/material.dart';
import 'package:restourant/models/restourant.dart';
import 'package:restourant/utils/extension.dart';
import 'package:restourant/view/details/widgets/list_drink.dart';
import 'package:restourant/view/details/widgets/list_food.dart';
import 'package:restourant/view/widgets/custom_listtile.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, this.restaurant});
  final Restaurant? restaurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: double.infinity,
                maxHeight: MediaQuery.of(context).size.height / 3),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(restaurant?.pictureId ?? ''))),
            ),
          ),
          CustomListTile(
            title: restaurant?.name,
            address: restaurant?.city,
            ratting: restaurant?.rating,

          ).paddingSymmetric(horizontal: 8.0),
          const Divider(thickness: 1.0),
          Text(restaurant?.description ?? '').paddingSymmetric(horizontal: 8.0),
          const Divider(thickness: 1.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Foods',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Drinks', style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ).paddingSymmetric(horizontal: 8.0, vertical: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListFood(
                menus: restaurant?.menus?.foods,
              ).paddingSymmetric(horizontal: 8.0),
              ListDrink(
                menus: restaurant?.menus?.drinks,
              ).paddingSymmetric(horizontal: 8.0),
            ],
          )
        ],
      ),
    ));
  }
}
