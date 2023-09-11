import 'package:allay/index.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Wrap(
          spacing: 16,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [AppIconWidget(size: 28), AppNameWidget()],
        ),
      ),
    );
  }
}
