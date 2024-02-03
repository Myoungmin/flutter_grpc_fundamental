import 'package:flutter/material.dart';
import 'package:flutter_grpc_client/src/service/theme_service.dart';
import 'package:flutter_grpc_client/src/view/base_view.dart';
import 'package:flutter_grpc_client/src/view/main/main_view_model.dart';
import 'package:flutter_grpc_client/theme/component/base_dialog.dart';
import 'package:flutter_grpc_client/theme/res/layout.dart';
import 'package:flutter_grpc_client/util/lang/generated/l10n.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: MainViewModel(),
      builder: (context, viewModel) => Scaffold(
        appBar: AppBar(
          title: Text(
            S.current.hello,
            style: context.textTheme.titleLarge?.copyWith(
              color: context.colorScheme.onSurface,
            ),
          ),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return BaseDialog(
                    title: S.current.hello,
                    content: Text(
                      S.current.hello,
                      style: context.textTheme.titleLarge?.copyWith(
                        color: context.theme.colorScheme.onSurface,
                      ),
                    ),
                    actions: [
                      TextButton(
                        child: Text(
                          S.current.cancel,
                          style: context.textTheme.bodyLarge?.copyWith(
                            color: context.theme.colorScheme.onSurface,
                          ),
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                          await Future.delayed(const Duration(seconds: 1));
                          await viewModel.circularIndicatorTest(2);
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Text(
              context.layout(
                S.current.desktop,
                mobile: S.current.mobile,
                tablet: S.current.tablet,
                desktop: S.current.desktop,
              ),
              style: context.textTheme.displayLarge?.copyWith(
                color: context.colorScheme.onSurface,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
