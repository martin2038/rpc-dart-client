library btrpc;

export 'src/internal.pbgrpc.dart' show RpcClient, RpcResult;
export 'package:grpc/grpc.dart' show ClientChannel;
export 'dart:typed_data' show Uint8List;

import 'dart:convert';
import 'dart:typed_data';
import 'package:grpc/grpc.dart';
import 'src/internal.pbgrpc.dart';

class BaseService {
  late final RpcClient _client;
  late final String Function() _tokenFunc;

  BaseService(ClientChannel channel, String app, String service,
      ServiceConfig? config) {
    var _config = config ?? ServiceConfig();
    _tokenFunc = _config.tokenFunc;
    _client = RpcClient(channel, '/$app/$service/', _config.errorToRpcResult,
        options: _config.options, interceptors: _config.interceptors);
  }

  /// DTO Type from JsonMap
  Future<RpcResult<DTO>> call<Param, DTO>(
      String method, DTO Function(Map<String, dynamic>) fromJson, Param? param,
      {String Function(Param)? toJson,
      Map<String, String>? headers,
      Duration? timeout}) {
    return _client.call(method, fromJson, _toJson(param, toJson),
        options: _toOptions(headers, timeout));
  }

  /// BasicType string/int/List/Map<String, dynamic> default
  /// or Use Customer jsonDecode(String) -> BasicType
  Future<RpcResult<BasicType>> call0<Param, BasicType>(
      String method, Param? param,
      {BasicType Function(String)? fromJson,
      String Function(Param)? toJson,
      Map<String, String>? headers,
      Duration? timeout}) {
    return _client.call0(
        method, fromJson ?? BaseService.defaultFromJson, _toJson(param, toJson),
        options: _toOptions(headers, timeout));
  }

  static String? _toJson<Param>(Param? param, String Function(Param)? toJson) {
    String? jsonParam;
    if (null != param) {
      var _toJson = toJson ?? BaseService.defaultToJson;
      jsonParam = _toJson(param);
    }
    return jsonParam;
  }

  CallOptions? _toOptions(Map<String, String>? headers, Duration? timeout) {
    var token = _tokenFunc();
    if (null == headers && null == timeout && token.isEmpty) {
      return null;
    }
    var h = headers ?? <String, String>{};
    h[ServiceConfig.AUTHORIZATION] = 'Bearer $token';
    return CallOptions(metadata: h, timeout: timeout);
  }

  /// jsonEncode
  static String defaultToJson<Param>(Param it) => jsonEncode(it);

  /// jsonDecode (string/int/list/Map<String, dynamic> , DTO not support)
  static BasicType defaultFromJson<BasicType>(String json) => jsonDecode(json);

  /// List<dynamic> -> List<DTO>
  static List<DTO> fromJsonList<DTO>(
          String json, DTO Function(dynamic e) toElement) =>
      (jsonDecode(json) as List<dynamic>).map(toElement).toList();

  /// 返回自身
  static DTO identity<DTO>(DTO it) => it;

  static Uint8List? jsonToU8(List<int>? json) {
    return json == null ? null : Uint8List.fromList(json);
  }

  static List<int>? u8ToJson(Uint8List? u8) => u8?.toList();
}

class ServiceConfig {
  static const AUTHORIZATION = 'authorization';
  static const CLIENT_ID = 'c-id';

  ///https://redmine.zhulinkeji.com/projects/bt/wiki/%E5%85%A8%E5%B1%80header
  static const CLIENT_META = 'c-meta';

  // static const ServiceConfig EMPTY = ServiceConfig(headers: {});

  final CallOptions options;

  /// 是否转换error为RpcResult，默认false，抛出error
  final bool errorToRpcResult;
  final Iterable<ClientInterceptor>? interceptors;
  final String Function() tokenFunc;

  ServiceConfig._(
      this.options, this.interceptors, this.errorToRpcResult, this.tokenFunc);

  /// accessToken : 登录用户身份令牌，JWT
  /// clientId : 唯一设备id。ios: i-$deviceId; android: a-$deviceId
  factory ServiceConfig(
      {String? accessToken,
      String? clientId,
      Map<String, dynamic>? clientMetaMap,
      String? clientMeta,
      Duration? timeout,
      String Function()? tokenFunc,
      bool errorToRpcResult = false,
      Iterable<ClientInterceptor>? interceptors}) {
    var _headers = <String, String>{};
    print('ServiceConfig accessToken :  $accessToken');
    if (accessToken != null) {
      _headers[AUTHORIZATION] = 'Bearer $accessToken';
    }
    if (clientId != null) {
      _headers[CLIENT_ID] = clientId;
    }
    if (null != clientMeta) {
      _headers[CLIENT_META] = clientMeta;
    } else if (null != clientMetaMap && clientMetaMap.isNotEmpty) {
      _headers[CLIENT_META] = jsonEncode(clientMetaMap);
    }

    return ServiceConfig._(CallOptions(metadata: _headers, timeout: timeout),
        interceptors, errorToRpcResult, tokenFunc ??= () => '');
  }
}
