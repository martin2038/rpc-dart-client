import 'dart:typed_data';

import 'package:btrpc/btrpc.dart';
import 'package:grpc/grpc.dart';
import '../example/demo_service.dart';

import 'dart:convert';

Future<void> main(List<String> args) async {
  final channel = ClientChannel('example.testbtyxapi.com');

  // final channel = ClientChannel('127.0.0.1',
  //     port: 50051,
  //     options: ChannelOptions(credentials: ChannelCredentials.insecure()));

  final demoService = DemoService(
      channel,
      ServiceConfig(
          accessToken: 'test.jwt.accessToken',
          clientId: 'i-xxxxx',
          tokenFunc: testTokenFactory,
          errorToRpcResult: false));

  var req = TimeReq('张三123', 20);
  print('Test jsonEncode: ${jsonEncode(req)}');

  var list = [1, 2, 3, 4];
  var u8list = Uint8List.fromList(list);

  print('Test jsonEncode : ${jsonEncode(list)}');

  print('Test jsonEncode : ${jsonEncode(u8list)}');

  var n =
      "jT0Bxjk4atVF9Q40bUXLtuHNhQ3zUVZXkqs4sg1b7qpqh3i8tsc5mp7ql9Ecj4LrUcdAIPfVu3xjH1_Ku2X03gOJDmzkwLcryYyvafJbj8uUrNoWvtCo2BvrLh9VT0BG5g3Iij5iybP26lNAGcN3IUfjkotaMCf_a9F7Wk4Dak8";

//https://github.com/appsup-dart/crypto_keys/blob/master/lib/src/keys.dart
  List<int> _base64ToBytes(String encoded) {
    encoded += List.filled((4 - encoded.length % 4) % 4, '=').join();
    return base64Url.decode(encoded);
  }

  BigInt _base64ToInt(String encoded) {
    final b256 = BigInt.from(256);
    return _base64ToBytes(encoded)
        .fold(BigInt.zero, (a, b) => a * b256 + BigInt.from(b));
  }

  print('_base64ToInt: ${_base64ToInt(n)}');
  var headers = {'c-id': 'override c-id'};

  await dumpCall(demoService.hello(req, headers: headers));

  await dumpCall(demoService.str('I am Dart !', headers: headers));

  await dumpCall(demoService.testMap());

  await dumpCall(demoService.inc100(2021));

  await dumpCall(demoService.wordLength(['Dart', 'Java', 'TypeScript']));

  var user = User();
  user.id = 123;
  user.name = "测试Dart";
  user.stat = UserStatus.VIP;

  await dumpCall(demoService.save(user));

  /// ---- 范型测试
  var pq = PagedQuery<User>(10);
  pq.q = user;

  Map<String, dynamic> dumpPageList(PagedList<User> p0) =>
      p0.toJson((value) => value.toJson());

  await dumpCall(
    demoService.plistUser(pq),
    dump: dumpPageList,
  );

  await dumpCall(demoService.plistUser2(pq));

  await dumpCall(demoService.listUser([user]));

  await dumpCall(demoService.listUser2([user]), dump: dumpPageList);

  var pq2 = PagedQuery<int>(10);
  pq2.q = 123;
  await dumpCall(
    demoService.listInt(pq2),
    dump: (PagedList<int> p0) => p0.toJson((value) => value),
  );

  /// ---- 异常状态测试

  req = TimeReq('张三123', 200);

  await dumpCall(demoService.hello(req));

  await dumpCall(demoService.testRuntimeException());

  await channel.shutdown();
}

String testTokenFactory() {
  return DateTime.now().toString();
}

Future<void> dumpCall<DTO>(Future<RpcResult<DTO>> future,
    {dynamic Function(DTO)? dump, String debug = ''}) async {
  print('----------------$debug--------------------');
  try {
    final response = await future;
    print('Get code: ${response.code} , message: ${response.message}');
    var dto = response.data;
    if (null != dto) {
      print('    data: ${null != dump ? dump(dto) : dto}');
      if (null == dump) {
        print('    jsonDataStr: ${BaseService.defaultToJson(dto)}');
      }
    }
  } catch (e) {
    print('Caught [${e.runtimeType}]: $e');
  }
}


  // final channel = ClientChannel('127.0.0.1',
  //     port: 50051,
  //     options: ChannelOptions(credentials: ChannelCredentials.insecure()));

// , //'backoffice.testbtyxapi.com',
// port: 443, //50051,
// // port: 50051,
// options: ChannelOptions(credentials: ChannelCredentials.insecure()
//     // ,codecRegistry:
//     //     CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
//     ),
