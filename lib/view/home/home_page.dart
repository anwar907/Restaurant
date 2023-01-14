import 'package:flutter/material.dart';
import 'package:restourant/models/restourant.dart';
import 'package:restourant/presenter/fetch_data.dart';
import 'package:restourant/view/widgets/custom_loading.dart';

import 'widgets/list_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ListRestourant? listRestaurant;
  Future<ListRestourant?> _listRestaurant() async {
    listRestaurant = await FetchDataRestaurant().getListRestaurant();
    return listRestaurant;
  }

  @override
  void initState() {
    _listRestaurant;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<ListRestourant?>(
          future: _listRestaurant(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                if (snapshot.hasData) {
                  return ListData(
                    restourant: listRestaurant,
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Failed fetch data'),
                  );
                } else {
                  return const Center(
                    child: Text('Connection timeout'),
                  );
                }
              case ConnectionState.waiting:
                return Center(
                  child: customLoading(),
                );
              default:
                return Container();
            }
          }),
    );
  }
}
