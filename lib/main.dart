import 'package:allay/index.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
        appBarTheme: const AppBarTheme(centerTitle: true),
        fontFamily: 'MinecraftAE',
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.deepPurple,
        appBarTheme: const AppBarTheme(centerTitle: true),
        fontFamily: 'MinecraftAE',
      ),
      themeMode: ThemeMode.dark,
      home: const SplashPage(
        rootPage: RootPage(),
        appIcon: AppIconWidget(),
        appName: AppNameWidget(fontSize: 36),
      ),
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
    final destinationModel = NavigationDestinationModel(
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.history), label: 'History'),
        NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
      ],
      bodies: [
        Scaffold(
          key: const Key('Home'),
          appBar: AppBar(
            title: const Wrap(
              spacing: 8,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [AppIconWidget(size: 28), AppNameWidget()],
            ),
          ),
        ),
        const Scaffold(key: Key('History')),
        const SettingsPage(),
      ],
    );

    return Scaffold(
      drawer: const Drawer(),
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
