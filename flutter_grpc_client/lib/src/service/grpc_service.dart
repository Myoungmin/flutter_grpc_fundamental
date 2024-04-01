import 'package:flutter_grpc_client/protos/helloworld.pbgrpc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';

final grpcHelloServiceProvider =
    NotifierProvider<GrpcHelloService, HelloClient>(GrpcHelloService.new);

class GrpcHelloService extends Notifier<HelloClient> {
  @override
  HelloClient build() {
    _channel = ClientChannel(
      "localhost",
      port: 50051,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );

    return HelloClient(_channel);
  }

  late ClientChannel _channel;
  HelloClient get helloClient => state;

  void updateChannel(String host, int port) {
    _channel.shutdown(); // 기존 채널 종료
    // 새로운 채널로 상태 업데이트
    _channel = ClientChannel(
      host,
      port: port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    state = HelloClient(_channel);
  }
}
