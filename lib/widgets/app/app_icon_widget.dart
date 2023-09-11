import 'package:allay/index.dart';

class AppIconWidget extends StatelessWidget {
  const AppIconWidget({
    super.key,
    this.size = 48,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size / 4),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        borderRadius: BorderRadius.circular(size / 4),
        child: Image.asset(
          'assets/images/icon.png',
          width: size,
        ),
      ),
    );
  }
}
