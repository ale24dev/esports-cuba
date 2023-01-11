import 'package:esports_cuba/src/app/app.dart';
import 'package:flutter/material.dart';
import 'package:esports_cuba/injectable.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

// Dependency injection (injectable)
  configureDependencies();
  
  runApp(const MyApp());
}
