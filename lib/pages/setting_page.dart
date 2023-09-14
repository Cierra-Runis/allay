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
              titleText: l10N.settings,
              children: const [
                LanguageListTitle(),
                ColorSchemeListTitle(),
              ],
            ),
            BasedListSection(
              titleText: l10N.about,
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
