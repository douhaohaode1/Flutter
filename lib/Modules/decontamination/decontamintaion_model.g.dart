// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'decontamintaion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DecontamintaionCodeModel _$DecontamintaionCodeModelFromJson(
    Map<String, dynamic> json) {
  return DecontamintaionCodeModel(
    (json['unitTypeMasterList'] as List)
        ?.map((e) => e == null
            ? null
            : DecontamintaionCode.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['statusMasterList'] as List)
        ?.map((e) => e == null
            ? null
            : DecontamintaionCode.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['reasonMasterList'] as List)
        ?.map((e) => e == null
            ? null
            : DecontamintaionCode.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DecontamintaionCodeModelToJson(
        DecontamintaionCodeModel instance) =>
    <String, dynamic>{
      'unitTypeMasterList': instance.unitTypeMasterList,
      'statusMasterList': instance.statusMasterList,
      'reasonMasterList': instance.reasonMasterList,
    };

DecontamintaionCode _$DecontamintaionCodeFromJson(Map<String, dynamic> json) {
  return DecontamintaionCode(
    json['description'] as String,
    json['statusCode'] as String,
    json['durationTime'] as String,
    json['codeId'] as String,
  );
}

Map<String, dynamic> _$DecontamintaionCodeToJson(
        DecontamintaionCode instance) =>
    <String, dynamic>{
      'description': instance.description,
      'statusCode': instance.statusCode,
      'durationTime': instance.durationTime,
      'codeId': instance.codeId,
    };
