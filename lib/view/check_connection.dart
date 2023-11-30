import 'package:fake_store/service/network_check.dart';
import 'package:flutter/material.dart';

class CheckConnectionView extends StatefulWidget {
  const CheckConnectionView({super.key});
  @override
  State<StatefulWidget> createState() => _CheckConnectionViewState();
}

class _CheckConnectionViewState extends State<CheckConnectionView> {
  late final INetworkCheck checkManager;
 static NetworkCheckResults? networkCheckResults;
  @override
  void initState() {
    super.initState();
    checkManager = NetworkCheck();
    checkManager.handleNetworkCheck((results) {
      updateResults(results);
    });
  }

  Future<void> fetchFirstResults() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final results = await checkManager.checkFirstTime();
      updateResults(results);
    });
  }

  void updateResults(NetworkCheckResults results) {
    setState(() {
      networkCheckResults = results;
    });
  }

  final String offLine = 'You are offline';
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstChild: const SizedBox.shrink(),
        secondChild: Container(
          color: Colors.red,
          height: MediaQuery.of(context).size.height * 0.3,
          child: Center(
              child: Text(offLine,
                  style: Theme.of(context).textTheme.headlineMedium)),
        ),
        crossFadeState: (networkCheckResults == NetworkCheckResults.on)
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        duration: CrossFadeDuration().crossfadeDuration);
  }

 
}

class CrossFadeDuration {
  Duration crossfadeDuration = const Duration(seconds: 1);
}
