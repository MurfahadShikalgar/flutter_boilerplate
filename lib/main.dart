// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:practice_application/utils/network/graphql/graphql_config.dart';
import 'package:practice_application/screens/splash_screen.dart';
import 'package:practice_application/utils/constants/app_constants.dart';
import 'package:practice_application/utils/navigation_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:practice_application/utils/network/network_binding.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:practice_application/injection_container.dart' as di;

Future<void> main() async {
  await dotenv.load(fileName: AppConstants.envFilePath);
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: GraphQlConfig().client,
      child: GetMaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: _locale,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        getPages: Routes,
        initialBinding: NetworkBinding(),
      ),
    );
  }
}
