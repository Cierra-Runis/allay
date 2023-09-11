import 'package:allay/index.dart';

class ColorSchemeListTitle extends StatelessWidget {
  const ColorSchemeListTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final l10N = AllayL10N.of(context);

    return BasedListTitle(
      leadingIcon: Icons.color_lens_rounded,
      titleText: l10N.colorScheme,
      onTap: () => Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(title: Text(l10N.colorScheme)),
          ),
        ),
      ),
    );
  }
}
