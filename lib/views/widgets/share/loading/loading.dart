import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../services/colors.dart';

class Loading extends StatelessWidget {
  const Loading({
    required this.child,
    required this.isLoading,
    this.color = mainColor,
    this.size = 50.0,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final bool isLoading;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: SpinKitChasingDots(size: size, color: color),
          )
        : child;
  }
}
