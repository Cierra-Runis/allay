import 'package:allay/index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    await FlutterDisplayMode.setHighRefreshRate();
  }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.deepPurple,
      appBarTheme: const AppBarTheme(centerTitle: true),
      fontFamily: Allay.fontFamily,
    );

    final darkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorSchemeSeed: Colors.deepPurple,
      appBarTheme: const AppBarTheme(centerTitle: true),
      fontFamily: Allay.fontFamily,
    );

    return MaterialApp(
      scrollBehavior: const PlatformScrollBehavior(),
      theme: theme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      home: const SplashPage(
        rootPage: RootPage(),
        appIcon: AppIconWidget(),
        appName: AppNameWidget(fontSize: 36),
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

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10N = AllayL10N.of(context);

    final destinationModel = NavigationDestinationModel(
      destinations: [
        NavigationDestination(
          icon: const Icon(Icons.home),
          label: l10N.home,
        ),
        NavigationDestination(
          icon: const Icon(Icons.history),
          label: l10N.history,
        ),
        NavigationDestination(
          icon: const Icon(Icons.settings),
          label: l10N.settings,
        ),
      ],
      bodies: [
        Scaffold(
          key: Key(l10N.home),
          appBar: AppBar(
            title: const Wrap(
              spacing: 8,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [AppIconWidget(size: 28), AppNameWidget()],
            ),
          ),
        ),
        Scaffold(key: Key(l10N.history)),
        const SettingsPage(),
      ],
    );

    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: destinationModel.bodies.elementAtOrNull(_selectedIndex),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        destinations: destinationModel.destinations,
        onDestinationSelected: (value) => setState(
          () => _selectedIndex = value,
        ),
      ),
    );
  }
}

class NavigationDestinationModel {
  const NavigationDestinationModel({
    required this.destinations,
    required this.bodies,
  });
  final List<NavigationDestination> destinations;
  final List<Widget> bodies;
}

class PlatformScrollBehavior extends CupertinoScrollBehavior {
  const PlatformScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
