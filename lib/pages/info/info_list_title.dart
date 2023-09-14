import 'package:allay/index.dart';

class InfoListTitle extends ConsumerWidget {
  const InfoListTitle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10N = AllayL10N.of(context);
    final currentVersion = ref.watch(currentVersionProvider);

    return BasedListTile(
      leading: const AppIconWidget(size: 24),
      titleText: l10N.version,
      subtitleText: currentVersion.when(
        data: (data) => data,
        error: (error, stackTrace) => '',
        loading: () => '',
      ),
      detailText: l10N.alreadyLatest,
      onTap: () => launchUrlString(Allay.release),
    );
  }
}
