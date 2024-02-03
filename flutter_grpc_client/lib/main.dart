import 'package:flutter/material.dart';
import 'package:flutter_grpc_client/src/service/lang_service.dart';
import 'package:flutter_grpc_client/src/service/theme_service.dart';
import 'package:flutter_grpc_client/util/lang/generated/l10n.dart';
import 'package:flutter_grpc_client/util/route_path.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LangService(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeService(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: context.watch<LangService>().currentLocale,
      theme: context.themeService.themeData,
      initialRoute: RoutePath.main,
      onGenerateRoute: RoutePath.onGenerateRoute,
    );
  }
}
