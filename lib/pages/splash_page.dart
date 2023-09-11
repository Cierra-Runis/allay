import 'package:allay/index.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    super.key,
    required this.rootPage,
    required this.appIcon,
    required this.appName,
  });

  final Widget rootPage;
  final Widget appIcon;
  final Widget appName;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    final rootPage = widget.rootPage;
    _animation.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          Navigator.of(context).pushAndRemoveUntil(
            CupertinoPageRoute(builder: (context) => rootPage),
            (route) => false,
          );
        }
      },
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              widget.appIcon,
              widget.appName,
            ],
          ),
        ),
      ),
    );
  }
}
