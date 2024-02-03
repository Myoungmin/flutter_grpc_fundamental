import 'package:flutter/material.dart';
import 'package:flutter_grpc_client/theme/foundation/app_theme.dart';
import 'package:provider/provider.dart';

class ThemeService with ChangeNotifier {
  ThemeService({
    AppTheme? theme,
  }) : theme = theme ?? AppTheme();

  // 현재 테마
  AppTheme theme;

  void toggleTheme() {
    if (theme.brightness == Brightness.light) {
      theme = AppTheme(brightness: Brightness.dark);
    } else {
      theme = AppTheme(brightness: Brightness.light);
    }
    notifyListeners();
  }

  ThemeData get themeData {
    return ThemeData(
      scaffoldBackgroundColor: theme.colorScheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(
          color: theme.colorScheme.onSurface,
        ),
        titleTextStyle: theme.textTheme.displayMedium?.copyWith(
          color: theme.colorScheme.onSurface,
        ),
      ),
    );
  }
}

extension ThemeServiceExt on BuildContext {
  ThemeService get themeService => watch<ThemeService>();
  AppTheme get theme => themeService.theme;
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
}
