import 'package:flutter/material.dart';
import 'package:restourant/models/restourant.dart';
import 'package:restourant/view/details/details_page.dart';

import '../../widgets/custom_listtile.dart';

class ListData extends StatelessWidget {
  const ListData({super.key, this.restourant});
  final ListRestourant? restourant;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 170,
            collapsedHeight: 60.0,
            toolbarHeight: 41.0,
            backgroundColor: Colors.green,
            flexibleSpace: LayoutBuilder(builder: (context, constraint) {
              return FlexibleSpaceBar(
                  titlePadding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 12.0),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Restaurant'),
                      Visibility(
                        visible:
                            constraint.biggest.height == 84.0 ? false : true,
                        child: const Text(
                          'Recommendation restauran for you!',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ));
            })),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailsPage(
                        restaurant: restourant?.restaurants?[index],
                      )));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomListTile(
                image: restourant?.restaurants?[index]?.pictureId,
                title: restourant?.restaurants?[index]?.name,
                address: restourant?.restaurants?[index]?.city,
                ratting: restourant?.restaurants?[index]?.rating,
              ),
            ),
          );
        }, childCount: restourant?.restaurants?.length))
      ],
    );
  }
}
