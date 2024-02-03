import 'package:flutter/material.dart';
import 'package:flutter_grpc_client/src/service/theme_service.dart';

class BaseDialog extends StatelessWidget {
  const BaseDialog({
    super.key,
    this.title,
    this.content,
    this.actions,
  });

  final String? title;
  final Widget? content;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      titlePadding: const EdgeInsets.all(16),
      contentPadding: const EdgeInsets.all(16).copyWith(
        top: title != null ? 0 : 16,
      ),
      actionsPadding: const EdgeInsets.all(16),
      title: title != null
          ? Text(
              title!,
              style: context.textTheme.displayMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: context.theme.colorScheme.onSurface,
              ),
            )
          : null,
      content: content,
      actions: actions,
    );
  }
}
