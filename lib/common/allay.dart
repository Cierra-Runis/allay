import 'package:allay/index.dart';

class Allay {
  static const name = 'Allay';

  static const github = 'https://github.com/Cierra-Runis';

  static const repository = '$github/allay';

  static const release = '$repository/releases';

  static const changelogRaw = '$repository/raw/main/CHANGELOG.md';

  static const changelogBlob = '$repository/blob/main/CHANGELOG.md';

  static const fontFamily = 'MinecraftAE';

  /// 亮色模式下的颜色集
  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF0061A2), // 普通按钮前景色
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFADCFFF), // 浮动按钮背景色
    onPrimaryContainer: Color(0xFF001D36),
    secondary: Color(0xFF535F70),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFD6E4F7),
    onSecondaryContainer: Color(0xFF0F1C2B),
    tertiary: Color(0xFF6A5778),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFF2DAFF),
    onTertiaryContainer: Color(0xFF251432),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFDFCFF), // 主要容器背景色
    onBackground: Color(0xFF1A1C1E),
    surface: Color(0xFFFDFCFF), // 标题栏和卡片背景颜色
    onSurface: Color(0xFF1A1C1E), // 最基础字体色
    surfaceVariant: Color(0xFFDFE2EB),
    onSurfaceVariant: Color(0xFF42474E),
    outline: Color(0x8A000000), // 下划线，选项小字，你记颜色
    onInverseSurface: Color(0xFFF1F0F4),
    inverseSurface: Color(0xFF2F3033),
    inversePrimary: Color(0xFF9DCAFF),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFFFDFCFF),
    outlineVariant: Color(0xFFC3C7CF),
    scrim: Color(0xFF000000),
  );

  /// 暗色模式下的颜色集
  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFFFB787), // 普通按钮前景色
    onPrimary: Color(0xFF502400),
    primaryContainer: Color(0xFF363636), // 浮动按钮背景色
    onPrimaryContainer: Color(0xCCE1E1E1), // 浮动按钮前景色
    secondary: Color(0xFFE5BFA8),
    onSecondary: Color(0xFF422B1B),
    secondaryContainer: Color(0xFF5B4130),
    onSecondaryContainer: Color(0xFFFFDCC7),
    tertiary: Color(0xFFCACA93),
    onTertiary: Color(0xFF31320A),
    tertiaryContainer: Color(0xFF48491F),
    onTertiaryContainer: Color(0xFFE6E6AD),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF242424), // 主要容器背景色
    onBackground: Color(0xFFECE0DA),
    surface: Color(0xFF303030), // 标题栏和卡片背景颜色
    onSurface: Color(0xFFECE0DA), // 最基础字体色
    surfaceVariant: Color(0xFF52443C),
    onSurfaceVariant: Color(0xFFD7C3B8),
    outline: Color(0x8AFFFFFF), // 下划线，选项小字，你记颜色
    onInverseSurface: Color(0xFF201A17),
    inverseSurface: Color(0xFFECE0DA),
    inversePrimary: Color(0xFF964900),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF181818),
    outlineVariant: Color(0xFF303030),
    scrim: Color(0xFF000000),
  );
}
