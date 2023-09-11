import 'package:allay/index.dart';

class ChangelogListTitle extends StatelessWidget {
  const ChangelogListTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final l10N = AllayL10N.of(context);

    return BasedListTitle(
      leadingIcon: Icons.history_rounded,
      titleText: l10N.changelog,
      onTap: () => Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => const ChangelogPage(),
        ),
      ),
    );
  }
}

class ChangelogPage extends ConsumerWidget {
  const ChangelogPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10N = AllayL10N.of(context);
    final changelog = ref.watch(changelogProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10N.changelog)),
      body: changelog.when(
        data: (data) => Markdown(
          styleSheet: MarkdownStyleSheet(
            blockquoteDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
          data: data,
        ),
        error: (error, stackTrace) => Center(
          child: Text('$error'),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
