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
        skipLoadingOnRefresh: false,
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
          child: Text(
            '$error',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 10),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: Wrap(
        direction: Axis.vertical,
        spacing: 8,
        children: [
          FloatingActionButton.small(
            onPressed: () => ref.refresh(changelogProvider),
            child: const Icon(Icons.refresh_rounded),
          ),
          FloatingActionButton.small(
            onPressed: () => launchUrlString(Allay.changelogBlob),
            child: const Icon(UniconsLine.github_alt),
          )
        ],
      ),
    );
  }
}
