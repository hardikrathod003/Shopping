import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/Homepage.dart';

import 'Add_cart.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      "/": (context) => Homepage(),
      "Add_cart": (context) => Add_cart(),
    },
  ));
}
