import 'package:allay/index.dart';

/// [BasedListTitle] 是由 [StatelessWidget] 衍生出的列表系列组件的基类
class BasedListTitle extends StatelessWidget {
  const BasedListTitle({
    super.key,
    this.onTap,
    this.disabled = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
    this.showLeadingIconBadge = false,
    this.showTitleTextBadge = false,
    this.showDetailTextBadge = false,
    this.showTrailingBadge = false,
    this.leading,
    this.leadingIcon,
    this.title,
    this.titleText,
    this.titleTextStyle,
    this.subtitle,
    this.subtitleText,
    this.subtitleTextStyle,
    this.detail,
    this.detailText,
    this.detailTextStyle,
    this.trailing,
    this.trailingIcon,
  });

  final EdgeInsets padding;

  final bool showLeadingIconBadge;
  final bool showTitleTextBadge;
  final bool showDetailTextBadge;
  final bool showTrailingBadge;

  final bool disabled;
  final VoidCallback? onTap;

  final Widget? leading;
  final IconData? leadingIcon;

  final Widget? title;
  final String? titleText;
  final TextStyle? titleTextStyle;

  final Widget? subtitle;
  final String? subtitleText;
  final TextStyle? subtitleTextStyle;

  final Widget? detail;
  final String? detailText;
  final TextStyle? detailTextStyle;

  final Widget? trailing;
  final IconData? trailingIcon;

  void _onTap() => onTap != null ? onTap!() : null;

  Widget buildDetail(BuildContext context) {
    return Badge(
      isLabelVisible: showDetailTextBadge,
      child: detailText != null
          ? Text(
              detailText!,
              style: detailTextStyle ??
                  TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.outline,
                  ),
            )
          : null,
    );
  }

  Widget buildTrailing(BuildContext context) {
    return Badge(
      isLabelVisible: showTrailingBadge,
      child: trailing ??
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Icon(
              Icons.navigate_next,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: disabled ? null : _onTap,
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(
          minHeight: 56.0,
        ),
        padding: padding,
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(8.0, 0, 24.0, 0),
              child: Badge(
                isLabelVisible: showLeadingIconBadge,
                child: leading ??
                    Icon(
                      leadingIcon,
                      color: Theme.of(context).colorScheme.outline,
                    ),
              ),
            ),
            if (titleText != null || subtitleText != null)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (titleText != null)
                      Badge(
                        isLabelVisible: showTitleTextBadge,
                        child: Text(
                          titleText ?? '',
                          style: titleTextStyle ??
                              const TextStyle(
                                fontSize: 16,
                              ),
                        ),
                      ),
                    if (subtitleText != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4, bottom: 4),
                        child: Text(
                          subtitleText ?? '',
                          style: subtitleTextStyle ??
                              TextStyle(
                                fontSize: 8,
                                color: Theme.of(context).colorScheme.outline,
                              ),
                        ),
                      ),
                  ],
                ),
              ),
            buildDetail(context),
            buildTrailing(context),
          ],
        ),
      ),
    );
  }
}

/// 由 [BasedListTitle] 衍生的组件，其右边被替换为开关
class BasedListSwitchItem extends BasedListTitle {
  final bool? value;
  final ValueChanged<bool>? onChanged;

  const BasedListSwitchItem({
    required super.onTap,
    required this.value,
    required this.onChanged,
    super.key,
    super.leading,
    super.leadingIcon,
    super.titleText,
    super.titleTextStyle,
    super.subtitleText,
    super.subtitleTextStyle,
    super.detailText,
    super.detailTextStyle,
    super.trailing,
  });

  @override
  void _onTap() {
    onChanged!(!value!);
    super._onTap();
  }

  @override
  Widget buildTrailing(BuildContext context) {
    return Transform.scale(
      scale: 0.7,
      child: Switch(
        value: value!,
        onChanged: onChanged,
      ),
    );
  }
}

/// 由 [BasedListTitle] 衍生的组件，其中部被替换为 [TextField] 输入框
class BasedListTextFieldItem extends BasedListTitle {
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;

  const BasedListTextFieldItem({
    required super.onTap,
    super.key,
    super.leading,
    super.leadingIcon,
    super.titleText,
    super.titleTextStyle,
    super.subtitleText,
    super.subtitleTextStyle,
    super.trailing = const Padding(
      padding: EdgeInsets.only(left: 4),
      child: Icon(null),
    ),
    this.hintText,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
  });

  @override
  bool get disabled => true;

  @override
  Widget buildDetail(BuildContext context) {
    return Expanded(
      child: TextField(
        decoration: InputDecoration(hintText: hintText),
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        onSubmitted: onSubmitted,
      ),
    );
  }
}
