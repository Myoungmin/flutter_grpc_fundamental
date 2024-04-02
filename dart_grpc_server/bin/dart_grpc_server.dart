import 'package:dart_grpc_server/src/generated/hello.pbgrpc.dart';
import 'package:grpc/grpc.dart';

class HelloService extends HelloServiceBase {
  @override
  Future<HelloResponse> sayHello(ServiceCall call, HelloRequest request) async {
    return HelloResponse()..message = 'Hello, ${request.name}!';
  }
}

Future<void> main(List<String> args) async {
  final server = Server.create(
    services: [HelloService()],
    codecRegistry: CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  );
  await server.serve(port: 50051);
  print('Server listening on port ${server.port}...');
}
