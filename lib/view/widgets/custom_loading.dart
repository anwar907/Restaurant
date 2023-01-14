import 'package:flutter/material.dart';

Widget customLoading() {
  return const CircularProgressIndicator(
    color: Colors.yellow,
    backgroundColor: Colors.transparent,
    semanticsLabel: 'Loading',
    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
  );
}
