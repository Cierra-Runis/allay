import 'package:allay/index.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10N = AllayL10N.of(context);

    return Scaffold(
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
                InfoListTitle(),
                ChangelogListTitle(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
