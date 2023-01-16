import 'package:flutter/material.dart';

import 'package:esports_cuba/constants.dart';
import 'package:esports_cuba/src/app/app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: Constants.supabaseUrl,
    anonKey: Constants.supabaseAnnonKey,
  );

// Dependency injection (get_it)
  setUp();

  runApp(const MyApp());
}
