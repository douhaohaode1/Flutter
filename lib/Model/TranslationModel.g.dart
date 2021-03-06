// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TranslationModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TranslationModel _$TranslationModelFromJson(Map<String, dynamic> json) {
  return TranslationModel(
    json['from'] as String,
    json['to'] as String,
    json['error_code'] as int,
    json['src_tts'] as String,
    json['dst_tts'] as String,
    (json['trans_result'] as List)
        ?.map((e) => e == null
            ? null
            : TransResultModle.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TranslationModelToJson(TranslationModel instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'error_code': instance.error_code,
      'src_tts': instance.src_tts,
      'dst_tts': instance.dst_tts,
      'trans_result': instance.trans_result,
    };

TransResultModle _$TransResultModleFromJson(Map<String, dynamic> json) {
  return TransResultModle(
    json['src'] as String,
    json['dst'] as String,
    json['src_tts'] as String,
    json['dst_tts'] as String,
    json['dict'] as String,
  );
}

Map<String, dynamic> _$TransResultModleToJson(TransResultModle instance) =>
    <String, dynamic>{
      'src': instance.src,
      'dst': instance.dst,
      'src_tts': instance.src_tts,
      'dst_tts': instance.dst_tts,
      'dict': instance.dict,
    };

TransListModle _$TransListModleFromJson(Map<String, dynamic> json) {
  return TransListModle(
    json['form'] as String,
    json['goto'] as String,
    json['id'] as int,
    json['title'] as String,
    json['subtitle'] as String,
    json['createData'] as String,
    json['src'] as String,
    json['dst'] as String,
    json['updateData'] as String,
    json['number'] as int,
  );
}

Map<String, dynamic> _$TransListModleToJson(TransListModle instance) =>
    <String, dynamic>{
      'form': instance.form,
      'goto': instance.goto,
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'createData': instance.createData,
      'src': instance.src,
      'dst': instance.dst,
      'updateData': instance.updateData,
      'number': instance.number,
    };
