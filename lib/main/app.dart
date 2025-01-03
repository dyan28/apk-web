import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:apkfree/api/api_client.dart';
import 'package:apkfree/common/core/constants.dart';
import 'package:apkfree/common/core/routes.dart';
import 'package:apkfree/common/data/local_secure_storage.dart';
import 'package:apkfree/env/env_state.dart';
import 'package:apkfree/generated/fonts.gen.dart';
import 'package:apkfree/generated/l10n.dart';
import 'package:apkfree/utils/app_colors.dart';

late StateNotifierProvider<ApiClient, EnvState> envProvider;
Future<void> setupAndRunApp({required EnvState env}) async {
  WidgetsFlutterBinding.ensureInitialized();
  envProvider =
      StateNotifierProvider<ApiClient, EnvState>((ref) => ApiClient(env, ref));
  final token = await SecureStorage.getToken();
  runApp(ProviderScope(
    child: App(
      isLogged: token.isNotEmpty,
    ),
  ));
}

class App extends ConsumerWidget {
  const App({
    super.key,
    this.isLogged = false,
  });
  final bool isLogged;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // initialize flutter local notification
    // NotificationUtil.initialize(context);

    return ResponsiveApp(
        preferDesktop: true,
        builder: (context) {
          return MaterialApp.router(
            // navigatorKey: Constants.navigatorKey,
            scaffoldMessengerKey: Constants.snackBarKey,
            themeMode: ThemeMode.system,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: Colors.white,
              fontFamily: FontFamily.playfairDisplay,
              appBarTheme: const AppBarTheme(
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.black),
                color: AppColors.backGround, //<-- SEE HERE
              ),
            ),
            locale: L10n.delegate.supportedLocales[1],
            supportedLocales: L10n.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            // initialRoute: Routes.dashboardScreen,
            routerConfig: Routes.routes,
            localizationsDelegates: const [
              L10n.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            // navigatorObservers: const [],
            builder: (context, child) {
              if (child != null) {
                return child;
              }
              return const SizedBox();
            },
          );
        });
  }
}
