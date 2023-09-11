import 'package:allay/index.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('Settings'),
      body: BasedListView(
        children: [
          BasedListSection(
            title: const Text(
              'Settings',
              style: TextStyle(fontSize: 18),
            ),
            children: [
              BasedListTitle(
                leadingIcon: Icons.translate_rounded,
                titleText: 'Language',
                onTap: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(title: const Text('Language')),
                      body: BasedListView(
                        children: [
                          BasedListSection(
                            children: [
                              BasedListTitle(
                                titleText: 'Follow System',
                                onTap: () {},
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              BasedListTitle(
                leadingIcon: Icons.color_lens_rounded,
                titleText: 'Color Scheme',
                onTap: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(title: const Text('Color Scheme')),
                    ),
                  ),
                ),
              ),
            ],
          ),
          BasedListSection(
            title: const Text('About'),
            children: [
              BasedListTitle(
                leading: const AppIconWidget(size: 24),
                titleText: Allay.name,
                subtitleText: 'version 0.0.1+1 | arm64-v8a | RELEASE',
                onTap: () => Clipboard.setData(
                  const ClipboardData(
                    text: 'version 0.0.1+1 | arm64-v8a | RELEASE',
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
