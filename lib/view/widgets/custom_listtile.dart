import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key, this.image, this.title, this.address, this.ratting});
  final String? image;
  final String? title;
  final String? address;
  final double? ratting;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Visibility(
        visible: image != null ? true : false,
        replacement: const Icon(
          Icons.store,
          size: 50,
          color: Colors.green,
        ),
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(image ?? ''))),
        ),
      ),
      title: Text(title ?? 'Restaurant'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.place,
                size: 15,
                color: Colors.red,
              ),
              Text(address ?? 'Alamat')
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.star,
                size: 15,
                color: Colors.yellow,
              ),
              Text('$ratting')
            ],
          )
        ],
      ),
    );
  }
}
