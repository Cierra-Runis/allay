import 'package:allay/index.dart';

class BasedListView extends StatelessWidget {
  final EdgeInsets padding;
  final List<Widget> children;
  final bool shrinkWrap;

  const BasedListView({
    super.key,
    this.padding = const EdgeInsets.only(top: 8),
    this.children = const [],
    this.shrinkWrap = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: padding,
      shrinkWrap: shrinkWrap,
      children: children,
    );
  }
}
