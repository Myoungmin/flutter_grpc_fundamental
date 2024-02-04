import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

class GrpcService with ChangeNotifier {
  GrpcService()
      : _channel = ClientChannel(
          "localhost",
          port: 50051,
          options:
              const ChannelOptions(credentials: ChannelCredentials.insecure()),
        );

  final ClientChannel _channel;
  ClientChannel get channel => _channel;
}
