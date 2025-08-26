import 'package:flutter/material.dart';

AppBar buildAppBar(String text) {
  return AppBar(
    forceMaterialTransparency: true,
    title: Text(
      text,
    ),
  );
}
