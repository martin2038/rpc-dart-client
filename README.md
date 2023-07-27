<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

btrpc client for Dart.

## Usage

see `example/demo_service.dart` 



先生成json序列化代码，使用了`json_serializable`

https://pub.dev/packages/json_serializable

```bash
$ dart run build_runner build 

Resolving dependencies in /rpc-dart-client... (3.1s)
Got dependencies in /rpc-dart-client.
Building package executable... (2.8s)
Built build_runner:build_runner.
[INFO] Generating build script completed, took 130ms
[INFO] Precompiling build script... completed, took 3.0s
[INFO] Building new asset graph completed, took 346ms
[INFO] Checking for unexpected pre-existing outputs. completed, took 0ms
[INFO] Generating SDK summary completed, took 1.8s
[INFO] Running build completed, took 3.7s
[INFO] Caching finalized dependency graph completed, took 11ms
[INFO] Succeeded after 3.7s with 2 outputs (17 actions)

# 运行测试程序
$ dart test/test_service.dart      

$ git tag 1.0.0
$ git push origin --tags
```


### 项目引用

`pubspec.yaml:`

```yaml
dependencies:
 btrpc:
    git:
      url: https://gitlab.zhulinkeji.com/middleware/rpc-dart-client.git
      ref: 1.0.0
```