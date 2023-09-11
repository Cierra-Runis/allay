import 'package:allay/index.dart';

class LinksListTitle extends StatelessWidget {
  const LinksListTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final l10N = AllayL10N.of(context);

    return BasedListTitle(
      leadingIcon: Icons.link_rounded,
      titleText: l10N.links,
      onTap: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(l10N.links),
          content: BasedListView(
            children: [
              TextButton(
                onPressed: () => launchUrlString(Allay.github),
                child: Text(l10N.sourceCode),
              ),
            ],
          ).adaptAlertDialog,
        ),
      ),
    );
  }
}
