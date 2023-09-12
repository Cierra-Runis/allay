import 'package:allay/index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    await FlutterDisplayMode.setHighRefreshRate();
  }
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      useMaterial3: true,
      colorScheme: Allay.lightColorScheme,
      appBarTheme: const AppBarTheme(centerTitle: true),
      fontFamily: Allay.fontFamily,
    );

    final darkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: Allay.darkColorScheme,
      appBarTheme: const AppBarTheme(centerTitle: true),
      fontFamily: Allay.fontFamily,
    );

    return MaterialApp(
      scrollBehavior: const _PlatformScrollBehavior(),
      theme: theme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      home: const SplashPage(
        rootPage: RootPage(),
        appIcon: AppIconWidget(),
        appName: AppNameWidget(fontSize: 32),
      ),
      localizationsDelegates: const [
        AllayL10N.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('zh', 'CN'),
        Locale('ja'),
      ],
    );
  }
}

class _PlatformScrollBehavior extends CupertinoScrollBehavior {
  const _PlatformScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
