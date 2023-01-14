import 'package:responsive_sizer/responsive_sizer.dart';

/// Environment variables and shared app constants.
abstract class Constants {
  static const String supabaseUrl = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: 'https://qrzgxfvjhhacpsjyrdrx.supabase.co',
  );

  static const String supabaseAnnonKey = String.fromEnvironment(
    'SUPABASE_ANNON_KEY',
    defaultValue:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFyemd4ZnZqaGhhY3BzanlyZHJ4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzMzMDg5NjYsImV4cCI6MTk4ODg4NDk2Nn0.Bdwqs_oPv4kXcl-eRQppZeiWZ66A4OFqSEBMNRd_TYI',
  );

  ///Margen de la aplicación
  static double MARGIN = 4.w;
}
