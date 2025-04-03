import 'package:flutter/material.dart';
import 'package:mobisell/screens/app/app_view_model.dart';
import 'package:mobisell/splash/view_model/splash_view_model.dart';
import 'package:mobisell/screens/home/home_view.dart';
import 'package:mobisell/splash/view/splash_view.dart';
import 'package:mobisell/screens/get_started/get_started_view.dart';
import 'package:mobisell/screens/get_started/get_started_view_model.dart';
import 'package:provider/provider.dart';


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
  }

  @override
  Widget build(BuildContext context) {
    appContext = context;
    return ChangeNotifierProvider<AppModel>.value(
      value: _app,
      child: Consumer<AppModel>(
        builder: (context, value, child) {
          value.isLoading = false;
          if (value.isLoading) {
            return Container(
              color: Theme.of(context).colorScheme.background,
            );
          }
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<SplashViewModel>(
                  create: (_) => SplashViewModel()),
              ChangeNotifierProvider<GetStartedViewModel>(
                  create: (_) => GetStartedViewModel()),
            ],
            child: MaterialApp(
              navigatorKey: GlobalKey<NavigatorState>(),
              scrollBehavior:
                  const ScrollBehavior().copyWith(overscroll: false),
              debugShowCheckedModeBanner: false,
              home: const SplashView(),
              routes: {
                '/get_started': (context) => const GetStartedView(),
                '/home': (context) => const HomeView(),
              },
              builder: (BuildContext context, Widget? child) {
                final MediaQueryData data = MediaQuery.of(context);
                return MediaQuery(
                    data: data.copyWith(textScaler: const TextScaler.linear(1)),
                    child: child ?? const SizedBox());
              },
              // home: const LoginView(),
              // routes: const <String, WidgetBuilder>{},
              // title: AppStrings.appName,
              // navigatorObservers: [routeObserver],
            ),
          );
        },
      ),
    );
  }
}
