///
//  Generated code. Do not modify.
//  source: internal.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:convert';
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class InputProto extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'InputProto',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'com.bt.rpc.internal'),
      createEmptyInstance: create)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'utf8')
    ..hasRequiredFields = false;

  InputProto._() : super();
  
  factory InputProto({$core.String? utf8}) {
    return InputProto.fromStr(utf8);
  }
  factory InputProto.fromStr($core.String? utf8) {
    final _result = create();
    if (utf8 != null) {
      _result.utf8 = utf8;
    }
    return _result;
  }
  factory InputProto.from($core.Map<$core.String, $core.dynamic>? paramJson) {
    final _result = create();
    if (paramJson != null) {
      _result.utf8 = jsonEncode(paramJson);
    }
    return _result;
  }
  // factory InputProto.fromBuffer($core.List<$core.int> i,
  //         [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
  //     create()..mergeFromBuffer(i, r);
  // factory InputProto.fromJson($core.String i,
  //         [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
  //     create()..mergeFromJson(i, r);
  // factory InputProto.fromJsonMap($core.Map<$core.String, $core.dynamic> json,
  //         [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
  //     create()..mergeFromJsonMap(json, r);

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  InputProto clone() => InputProto()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  InputProto copyWith(void Function(InputProto) updates) =>
      super.copyWith((message) => updates(message as InputProto))
          as InputProto; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InputProto create() => InputProto._();
  InputProto createEmptyInstance() => create();
  static $pb.PbList<InputProto> createRepeated() => $pb.PbList<InputProto>();
  @$core.pragma('dart2js:noInline')
  static InputProto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InputProto>(create);
  static InputProto? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get utf8 => $_getSZ(0);
  @$pb.TagNumber(2)
  set utf8($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUtf8() => $_has(0);
  @$pb.TagNumber(2)
  void clearUtf8() => clearField(2);
}

enum OutputProto_Data { utf8, bs, notSet }

class OutputProto extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, OutputProto_Data> _OutputProto_DataByTag = {
    3: OutputProto_Data.utf8,
    4: OutputProto_Data.bs,
    0: OutputProto_Data.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'OutputProto',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'com.bt.rpc.internal'),
      createEmptyInstance: create)
    ..oo(0, [3, 4])
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'c',
        $pb.PbFieldType.O3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'm')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'utf8')
    ..a<$core.List<$core.int>>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bs',
        $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  OutputProto._() : super();
  factory OutputProto({
    $core.int? c,
    $core.String? m,
    $core.String? utf8,
    $core.List<$core.int>? bs,
  }) {
    final _result = create();
    if (c != null) {
      _result.c = c;
    }
    if (m != null) {
      _result.m = m;
    }
    if (utf8 != null) {
      _result.utf8 = utf8;
    }
    if (bs != null) {
      _result.bs = bs;
    }
    return _result;
  }
  factory OutputProto.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  // factory OutputProto.fromJson($core.String i,
  //         [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
  //     create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  OutputProto clone() => OutputProto()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  OutputProto copyWith(void Function(OutputProto) updates) =>
      super.copyWith((message) => updates(message as OutputProto))
          as OutputProto; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OutputProto create() => OutputProto._();
  OutputProto createEmptyInstance() => create();
  static $pb.PbList<OutputProto> createRepeated() => $pb.PbList<OutputProto>();
  @$core.pragma('dart2js:noInline')
  static OutputProto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OutputProto>(create);
  static OutputProto? _defaultInstance;

  OutputProto_Data whichData() => _OutputProto_DataByTag[$_whichOneof(0)]!;
  void clearData() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.int get c => $_getIZ(0);
  @$pb.TagNumber(1)
  set c($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasC() => $_has(0);
  @$pb.TagNumber(1)
  void clearC() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get m => $_getSZ(1);
  @$pb.TagNumber(2)
  set m($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasM() => $_has(1);
  @$pb.TagNumber(2)
  void clearM() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get utf8 => $_getSZ(2);
  @$pb.TagNumber(3)
  set utf8($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUtf8() => $_has(2);
  @$pb.TagNumber(3)
  void clearUtf8() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get bs => $_getN(3);
  @$pb.TagNumber(4)
  set bs($core.List<$core.int> v) {
    $_setBytes(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasBs() => $_has(3);
  @$pb.TagNumber(4)
  void clearBs() => clearField(4);
}
