// GENERATED BY BT RPC GEN - LESS MODIFY BY HAND
// demo_service.dart 2022-01-11T18:26:28+08:00

import 'package:btrpc/btrpc.dart';
import 'demo_java_server_dto.dart';
export 'demo_java_server_dto.dart';

///  这是个例子, Demo，用来演示客户端调用
class DemoService extends BaseService {
  DemoService(ClientChannel channel, ServiceConfig? config)
      : super(channel, APP_NAME, 'Demo', config);

  Future<RpcResult<String>> str(String req,
      {Map<String, String>? headers, Duration? timeout}) {
    return call0('str', req, headers: headers, timeout: timeout);
  }

  Future<RpcResult<String>> save(User req,
      {Map<String, String>? headers, Duration? timeout}) {
    return call0('save', req, headers: headers, timeout: timeout);
  }

  /// 调用这个接口服务端会抛出RuntimeException
  Future<RpcResult<int>> testRuntimeException(
      {Map<String, String>? headers, Duration? timeout}) {
    return call0('testRuntimeException', null,
        headers: headers, timeout: timeout);
  }

  Future<RpcResult<TimeResult>> hello(TimeReq req,
      {Map<String, String>? headers, Duration? timeout}) {
    return call('hello', TimeResult.fromJson, req,
        headers: headers, timeout: timeout);
  }

  Future<RpcResult<Map<String, dynamic>>> testMap(
      {Map<String, String>? headers, Duration? timeout}) {
    return call0('testMap', null, headers: headers, timeout: timeout);
  }

  Future<RpcResult<int>> inc100(int req,
      {Map<String, String>? headers, Duration? timeout}) {
    return call0('inc100', req, headers: headers, timeout: timeout);
  }

  Future<RpcResult<List<int>>> wordLength(List<String> req,
      {Map<String, String>? headers, Duration? timeout}) {
    return call0('wordLength', req,
        headers: headers,
        timeout: timeout,
        fromJson: (l) => BaseService.fromJsonList(l, (o) => o as int));
  }

  Future<RpcResult<PagedList<User>>> plistUser(PagedQuery<User> req,
      {Map<String, String>? headers, Duration? timeout}) {
    return call(
        'plistUser',
        (m) => PagedList.fromJson(
            m, (o) => User.fromJson(o as Map<String, dynamic>)),
        req,
        toJson: (PagedQuery<User> p) =>
            BaseService.defaultToJson(p.toJson(BaseService.identity)),
        headers: headers,
        timeout: timeout);
  }

  Future<RpcResult<List<User>>> plistUser2(PagedQuery<User> req,
      {Map<String, String>? headers, Duration? timeout}) {
    return call0('plistUser2', req,
        toJson: (PagedQuery<User> p) =>
            BaseService.defaultToJson(p.toJson(BaseService.identity)),
        headers: headers,
        timeout: timeout,
        fromJson: (l) => BaseService.fromJsonList(
            l, (o) => User.fromJson(o as Map<String, dynamic>)));
  }

  Future<RpcResult<List<User>>> listUser(List<User> req,
      {Map<String, String>? headers, Duration? timeout}) {
    return call0('listUser', req,
        headers: headers,
        timeout: timeout,
        fromJson: (l) => BaseService.fromJsonList(
            l, (o) => User.fromJson(o as Map<String, dynamic>)));
  }

  Future<RpcResult<PagedList<User>>> listUser2(List<User> req,
      {Map<String, String>? headers, Duration? timeout}) {
    return call(
        'listUser2',
        (m) => PagedList.fromJson(
            m, (o) => User.fromJson(o as Map<String, dynamic>)),
        req,
        headers: headers,
        timeout: timeout);
  }

  Future<RpcResult<PagedList<int>>> listInt(PagedQuery<int> req,
      {Map<String, String>? headers, Duration? timeout}) {
    return call('listInt', (m) => PagedList.fromJson(m, (o) => o as int), req,
        toJson: (PagedQuery<int> p) =>
            BaseService.defaultToJson(p.toJson(BaseService.identity)),
        headers: headers,
        timeout: timeout);
  }

  Future<RpcResult<int>> saveImg(Img req,
      {Map<String, String>? headers, Duration? timeout}) {
    return call0('saveImg', req, headers: headers, timeout: timeout);
  }
}