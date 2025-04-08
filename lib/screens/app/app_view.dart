import 'package:flutter/material.dart';
import 'package:mobisell/screens/app/app_view_model.dart';
import 'package:mobisell/splash/view_model/splash_view_model.dart';
import 'package:mobisell/splash/view/splash_view.dart';
import 'package:mobisell/screens/get_started/get_started_view.dart';
import 'package:mobisell/screens/get_started/get_started_view_model.dart';
import 'package:provider/provider.dart';

import '../coustmer/home/home_view.dart';
import '../coustmer/login/login_view.dart';
import '../coustmer/login/login_view_model.dart';


class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

final routeObserver = RouteObserver<PageRoute>();

class _AppViewState extends State<AppView> with WidgetsBindingObserver {
  static BuildContext? appContext;
  final _app = AppModel();

  @override
  void initState() {
    super.initState();
    appContext = context;
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    appContext = context;
    return ChangeNotifierProvider<AppModel>.value(
      value: _app,
      child: Consumer<AppModel>(
        builder: (context, value, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<SplashViewModel>(
                  create: (_) => SplashViewModel()),
              ChangeNotifierProvider<GetStartedViewModel>(
                  create: (_) => GetStartedViewModel()),
              ChangeNotifierProvider<LoginViewModel>(
                  create: (_) => LoginViewModel()),
            ],
            child: MaterialApp(
              navigatorKey: GlobalKey<NavigatorState>(),
              scrollBehavior:
                  const ScrollBehavior().copyWith(overscroll: false),
              debugShowCheckedModeBanner: false,
              home: const SplashView(),
              routes: {
                '/splash': (context) => const SplashView(),
                '/get_started': (context) => const GetStartedView(),
                '/home': (context) => const HomeView(),
                '/login': (context) => const LoginView(),
              },
              builder: (BuildContext context, Widget? child) {
                final MediaQueryData data = MediaQuery.of(context);
                return MediaQuery(
                    data: data.copyWith(textScaler: const TextScaler.linear(1)),
                    child: child ?? const SizedBox());
              },
              navigatorObservers: [routeObserver],
            ),
          );
        },
      ),
    );
  }
}
