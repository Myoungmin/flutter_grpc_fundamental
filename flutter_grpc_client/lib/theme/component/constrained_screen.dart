import 'package:flutter/material.dart';
import 'package:flutter_grpc_client/src/service/theme_service.dart';
import 'package:flutter_grpc_client/theme/res/layout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConstrainedScreen extends ConsumerWidget {
  const ConstrainedScreen({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      alignment: Alignment.center,
      color: ref.colorScheme.surface,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: Breakpoints.desktop,
        ),
        child: child,
      ),
    );
  }
}
