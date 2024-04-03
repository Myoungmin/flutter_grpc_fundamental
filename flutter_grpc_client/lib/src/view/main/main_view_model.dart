import 'package:flutter_grpc_client/protos/hello.pb.dart';
import 'package:flutter_grpc_client/src/service/grpc_service.dart';
import 'package:flutter_grpc_client/src/view/base_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';

final mainViewModelProvider =
    NotifierProvider.autoDispose<MainViewModel, MainViewState>(
        MainViewModel.new);

class MainViewState extends BaseViewState {
  MainViewState({
    required this.isBusy,
    required this.strTextButton,
  });

  @override
  final bool isBusy;

  final String strTextButton;

  MainViewState copyWith({bool? isBusy, String? strTextButton}) {
    return MainViewState(
      isBusy: isBusy ?? this.isBusy,
      strTextButton: strTextButton ?? this.strTextButton,
    );
  }
}

class MainViewModel extends BaseViewModel<MainViewState> {
  @override
  MainViewState build() {
    return MainViewState(isBusy: false, strTextButton: "gRPC sayHello");
  }

  Future<void> circularIndicatorTest(int seconds) async {
    state = state.copyWith(isBusy: true);
    await Future.delayed(Duration(seconds: seconds));
    state = state.copyWith(isBusy: false);
  }

  Future<void> sayHello() async {
    ResponseFuture<HelloResponse> resultFuture = ref
        .watch(grpcHelloServiceProvider)
        .sayHello(HelloRequest(name: 'hello'));

    HelloResponse response = await resultFuture;
    state = state.copyWith(strTextButton: response.message);
  }
}
