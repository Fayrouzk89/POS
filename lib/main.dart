import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Api/MyHttpOverrides.dart';
import 'Helper/StorageService.dart';
import 'LocalizationApp/L10n.dart';
import 'Utils/ThemeCubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'Helper/LocalDataHelper.dart';
import 'Helper/SharedData.dart';
import 'Helper/SharedPrefs.dart';
import 'Helper/SizeConfig.dart';
import 'Routes/AppRoutes.dart';
import 'Routes/Routes.dart';
import 'Routes/navigation.dart';

Future<void> main() async {
  Bloc.observer = const AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = new MyHttpOverrides();
  await Future.wait([
     StorageService.LoadUser(),
  //  SharedPrefs().init(),
    SharedData.initAppModule(),
    EasyLocalization.ensureInitialized()
  ]);

  //EasyLocalization.ensureInitialized()
  runApp(EasyLocalization(
    supportedLocales: L10n.all,
    // saveLocale: true,
    startLocale: (LocalDataHelper.lang == "ar") ? L10n.all[1] : L10n.all[0],
    fallbackLocale: (LocalDataHelper.lang == "ar") ? L10n.all[1] : L10n.all[0],
    // saveLocale: true,
    // startLocale:locale ,
    //fallbackLocale: locale,
    path: 'resources/langs',
    child: App(),
  ));

  // runApp(const MyApp());
}

/// {@template app_bloc_observer}
/// Custom [BlocObserver] that observes all bloc and cubit state changes.
/// {@endtemplate}
class AppBlocObserver extends BlocObserver {
  /// {@macro app_bloc_observer}
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) print(change);
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

/// {@template app}
/// A [StatelessWidget] that:
/// * uses [bloc](https://pub.dev/packages/bloc) and
/// [flutter_bloc](https://pub.dev/packages/flutter_bloc)
/// to manage the state of a counter and the app theme.
/// {@endtemplate}
class App extends StatelessWidget {
  /// {@macro app}
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: const AppView(),
    );
  }
}

/// {@template app_view}
/// A [StatelessWidget] that:
/// * reacts to state changes in the [ThemeCubit]
/// and updates the theme of the [MaterialApp].
/// * renders the [CounterPage].
/// {@endtemplate}
class AppView extends StatelessWidget {
  /// {@macro app_view}
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (_, theme) {
        return MaterialApp(
          theme: theme,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,

          // locale: Locale(Provider.of<SettingLangProvider>(context).local ??
          // LocalDataHelper.lang ??
          //  'en'),
          title: 'Munjz Shop',
          navigatorKey: navigatorKey,
          initialRoute: Routes.splashScreen,
          routes: routesApp,
          debugShowCheckedModeBanner: false,
          builder: (context, child) => ResponsiveBreakpoints.builder(
            child: FlutterEasyLoading(
              child: child!,
            ),
            breakpoints: [
              const Breakpoint(start: 0, end: 450, name: MOBILE),
              const Breakpoint(start: 451, end: 1920, name: TABLET),
              const Breakpoint(start: 801, end: 1920, name: DESKTOP),
              const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
          ),
        );
      },
    );
  }
}

/// {@template counter_page}
/// A [StatelessWidget] that:
/// * provides a [CounterBloc] to the [CounterView].
/// {@endtemplate}
