import 'package:flutter_grpc_client/src/view/base_view_model.dart';

class MainViewModel extends BaseViewModel {
  Future<void> circularIndicatorTest(int seconds) async {
    isBusy = true;
    await Future.delayed(Duration(seconds: seconds));
    isBusy = false;
  }
}
