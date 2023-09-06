import 'package:flutter/material.dart';

class LifeCycleDemo extends StatefulWidget {
  const LifeCycleDemo({super.key});

  @override
  State<LifeCycleDemo> createState() => _LifeCycleDemoState();
}

class _LifeCycleDemoState extends State<LifeCycleDemo>
    with WidgetsBindingObserver {
  //run below command on terminal
  //flutter run --enable-software=rendering
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      debugPrint(
          "changing the page because you paused the app or whatever you want to show the message");

      Navigator.popUntil(context, (route) => route.settings.name == "/");
    }
    debugPrint("state: $state");
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Secure Page"),
      ),
      body: Center(
        child: Text(
          "Secure Page",
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
    );
  }
}
