import 'package:allay/index.dart';

class AppNameWidget extends StatelessWidget {
  const AppNameWidget({
    super.key,
    this.name = Allay.name,
    this.fontSize,
  });

  final String name;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(name, style: TextStyle(fontSize: fontSize));
  }
}
