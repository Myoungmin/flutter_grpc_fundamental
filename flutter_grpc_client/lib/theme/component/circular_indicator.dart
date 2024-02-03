import 'package:flutter/material.dart';
import 'package:flutter_grpc_client/src/service/theme_service.dart';

class CircularIndicator extends StatelessWidget {
  const CircularIndicator({
    super.key,
    required this.child,
    required this.isBusy,
  });

  final Widget child;
  final bool isBusy;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        IgnorePointer(
          ignoring: !isBusy,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 222),
            opacity: isBusy ? 1 : 0,
            child: Container(
              color: Colors.black.withOpacity(0.5),
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                color: context.colorScheme.primary,
                value: isBusy ? null : 0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
