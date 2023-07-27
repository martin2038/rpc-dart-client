///
//  Generated code. Do not modify.
//  source: internal.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;
import 'dart:convert';

import 'dart:core';
import 'dart:math';

import 'package:grpc/service_api.dart' as $grpc;
import 'internal.pb.dart' as $0;
// import 'package:grpc/grpc.dart' show GrpcError;
// export 'internal.pb.dart';

class RpcResult<DTO> {
  static const int OK = 0;
  final int code;
  final bool isError;
  String? message;
  DTO? data;

  RpcResult(this.code, {this.isError = false, this.message, this.data});

  bool isOk() => this.code == OK;
}

class RpcClient extends $grpc.Client {
  final String pathPre;
  final Map<String, $grpc.ClientMethod<$0.InputProto, $0.OutputProto>>
      methodMap = {};
  final bool errorToRpcResult;
  RpcClient($grpc.ClientChannel channel, this.pathPre, this.errorToRpcResult,
      {$grpc.CallOptions? options,
      Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  /// DTO with fromJsonMap
  Future<RpcResult<DTO>> call<DTO>(String method,
      DTO Function(Map<String, dynamic>) fromJson, String? jsonStr,
      {$grpc.CallOptions? options}) {
    return _call((o) => o.hasUtf8() ? fromJson(jsonDecode(o.utf8)) : null,
        method, $0.InputProto.fromStr(jsonStr),
        options: options);
  }

  /// DTO with fromJsonString and StringJson Input
  Future<RpcResult<DTO>> call0<DTO>(
      String method, DTO Function(String) fromJsonStr, String? jsonStr,
      {$grpc.CallOptions? options}) {
    return _call((o) => o.hasUtf8() ? fromJsonStr(o.utf8) : null, method,
        $0.InputProto.fromStr(jsonStr),
        options: options);
  }

  /// DTO with fromJsonString
  Future<RpcResult<DTO>> call1<DTO>(String method,
      DTO Function(String) fromJsonStr, Map<String, dynamic>? paramJson,
      {$grpc.CallOptions? options}) {
    return _call((o) => o.hasUtf8() ? fromJsonStr(o.utf8) : null, method,
        $0.InputProto.from(paramJson),
        options: options);
  }

  /// jsonMap Return
  Future<RpcResult<Map<String, dynamic>>> call2(
      String method, Map<String, dynamic>? paramJson,
      {$grpc.CallOptions? options}) {
    return _call<Map<String, dynamic>>(
        (o) => o.hasUtf8() ? jsonDecode(o.utf8) : null,
        method,
        $0.InputProto.from(paramJson),
        options: options);
  }

  /// bytes Return
  Future<RpcResult<List<int>>> call3(
      String method, Map<String, dynamic>? paramJson,
      {$grpc.CallOptions? options}) {
    return _call<List<int>>(
        (o) => o.hasBs() ? o.bs : null, method, $0.InputProto.from(paramJson),
        options: options);
  }

  Future<RpcResult<DTO>> _call<DTO>(DTO? Function($0.OutputProto) convertRes,
      String method, $0.InputProto param,
      {$grpc.CallOptions? options}) {
    var fullMethodName = '$pathPre$method';
    var rpcMethod = methodMap.putIfAbsent(
        fullMethodName,
        () => $grpc.ClientMethod<$0.InputProto, $0.OutputProto>(
            fullMethodName,
            ($0.InputProto value) => value.writeToBuffer(),
            (List<int> value) => $0.OutputProto.fromBuffer(value)));
    Function? onError;
    if (errorToRpcResult) {
      //GrpcError
      onError =
          (e) => RpcResult<DTO>(e.code, isError: true, message: e.message);
    }
    return $createUnaryCall(rpcMethod, param, options: options).then(
        (o) => RpcResult<DTO>(o.c, message: o.m, data: convertRes(o)),
        onError: onError);
  }
}

// mixin MxJson<DTO> {
//   // Map<String, dynamic> toJson();
//   DTO fromJson(Map<String, dynamic> json);
// }
