import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/provider/app_state_provider.dart';
import 'package:surakshakadi/theme/app_theme.dart';
import 'package:surakshakadi/ui/screens/splash_screen/splash_screen.dart';
import 'package:surakshakadi/utils/custom_scroll_behavior.dart';
import 'package:surakshakadi/utils/navigation_utils.dart';
import 'package:surakshakadi/utils/preference_utils.dart';
import 'package:surakshakadi/widgets/camera_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  setupLocator();

  await init();


  await init();
  if (kIsWeb) {
    const int megabyte = 1000000;
    SystemChannels.skia
        .invokeMethod('Skia.setResourceCacheMaxBytes', 512 * megabyte);
    await Future<void>.delayed(Duration.zero);
  }
  runApp(
    // DevicePreview(builder: (context) =>
    ProviderScope(
      observers: [Logger()],
      child: MultiProvider(
        providers: [
          ListenableProvider(create: (_) => AppStateProvider()),
        ],
        child: const App(),
      ),
    ),
    // ),
  );
}

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    debugPrint(
        '[${provider.name ?? provider.runtimeType}] previousValue: $previousValue value: $newValue');
  }
}



class App extends HookConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );


    final appTheme = ref.watch(appThemeProvider);
    return Material(
      child:
          LayoutBuilder(builder: (layoutContext, BoxConstraints constraints) {
        return OrientationBuilder(builder: (context, Orientation orientation) {
          return ScreenUtilInit(
              designSize: Size(1450, 700),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return MaterialApp(
                  scrollBehavior: MyCustomScrollBehavior(),
                  theme: appTheme.data,
                  darkTheme: AppTheme.dark().data,
                  themeMode: appTheme.mode,
                  debugShowCheckedModeBanner: false,
                  // builder: (context, child) {
                  //   ScreenUtil.init(
                  //     // // context: context,
                  //     // BoxConstraints(
                  //     //     maxWidth: MediaQuery.of(context).size.width,
                  //     //     maxHeight: MediaQuery.of(context).size.height),
                  //     designSize: getValueForScreenType(
                  //         context: context,
                  //         mobile: const Size(376, 667),
                  //         tablet: (!kIsWeb && context.isLandscape)
                  //             ? const Size(1024, 768)
                  //             : const Size(768, 1024)),
                  //   );
                  //   return MediaQuery(
                  //     child: child!,
                  //     data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  //   );
                  // },
                  navigatorKey: locator<NavigationUtils>().globalStateKey,
                  onGenerateRoute: locator<NavigationUtils>().generateRoute,
                  // initialRoute: routeSplash,
                  home: SplashScreen(),
                );
              });
        });
      }),
    );
  }
}
