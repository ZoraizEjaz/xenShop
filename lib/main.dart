import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App(
    connectivity: Connectivity(),
  ));
}
