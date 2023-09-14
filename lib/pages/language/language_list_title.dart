import 'package:allay/index.dart';

class LanguageListTitle extends StatelessWidget {
  const LanguageListTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final l10N = AllayL10N.of(context);

    return BasedListTile(
      leadingIcon: Icons.translate_rounded,
      titleText: l10N.language,
      onTap: () => Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => const LanguagePage(),
        ),
      ),
    );
  }
}
