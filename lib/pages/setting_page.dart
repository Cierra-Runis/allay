import 'package:allay/index.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10N = AllayL10N.of(context);

    return Scaffold(
      key: Key(l10N.settings),
      body: SafeArea(
        child: BasedListView(
          children: [
            BasedListSection(
              title: Text(
                l10N.settings,
                style: const TextStyle(fontSize: 18),
              ),
              children: const [
                LanguageListTitle(),
                ColorSchemeListTitle(),
              ],
            ),
            BasedListSection(
              title: Text(l10N.about),
              children: const [
                AppInfoListTitle(),
                LinksListTitle(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AppInfoListTitle extends StatelessWidget {
  const AppInfoListTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BasedListTitle(
      leading: const AppIconWidget(size: 24),
      titleText: Allay.name,
      subtitleText: ['v0.0.1+1', 'arm64-v8a', 'RELEASE'].join(' | '),
      trailingIcon: Icons.copy_all_rounded,
      onTap: () => Clipboard.setData(
        ClipboardData(
          text: ['v0.0.1+1', 'arm64-v8a', 'RELEASE'].join(' | '),
        ),
      ),
    );
  }
}
