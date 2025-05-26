import 'package:flutter/material.dart';
import 'app/app.dart';
import 'product/init/app_init.dart';

void main() async {
  await ApplicationInitialize().make();
  final app = await MekanlyApp.create();

  runApp(app);
}
