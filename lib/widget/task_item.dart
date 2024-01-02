import 'package:flutter/material.dart';

Widget taskItem(String title) {
  return Container(
      child: ListTile(
    title: Text(title),
  ));
}
