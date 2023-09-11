import 'package:allay/index.dart';

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

    final destinationModel = _NavigationDestinationModel(
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
        const HomePage(),
        const Scaffold(),
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

class _NavigationDestinationModel {
  const _NavigationDestinationModel({
    required this.destinations,
    required this.bodies,
  });
  final List<NavigationDestination> destinations;
  final List<Widget> bodies;
}
