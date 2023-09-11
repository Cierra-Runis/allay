import 'package:allay/index.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10N = AllayL10N.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10N.language)),
      body: BasedListView(
        children: [
          BasedListSection(
            title: Text(l10N.supportedLanguages),
            children: [
              for (final locale in AllayL10N.delegate.supportedLocales)
                BasedListTitle(
                  leadingIcon: Localizations.localeOf(context) == locale
                      ? Icons.check_rounded
                      : null,
                  titleText: locale.toLanguageTag(),
                )
            ],
          )
        ],
      ),
    );
  }
}
