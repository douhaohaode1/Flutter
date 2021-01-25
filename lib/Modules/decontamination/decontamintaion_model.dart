
import 'package:json_annotation/json_annotation.dart';
part 'decontamintaion_model.g.dart';


@JsonSerializable()
class DecontamintaionCodeModel{

  @JsonKey(name: "unitTypeMasterList")
  final  List <DecontamintaionCode>  unitTypeMasterList;

  @JsonKey(name: "statusMasterList")
  final  List <DecontamintaionCode> statusMasterList;

  @JsonKey(name: "reasonMasterList")
  final  List <DecontamintaionCode> reasonMasterList;

  DecontamintaionCodeModel(
      this.unitTypeMasterList,
      this.statusMasterList,
      this.reasonMasterList,
      );

  factory DecontamintaionCodeModel.fromJson(Map<String, dynamic> json) =>
      _$DecontamintaionCodeModelFromJson(json);
}

@JsonSerializable()
class DecontamintaionCode{
  final  String description;
  final  String statusCode;
  final  String durationTime;
  final  String codeId;

  DecontamintaionCode(
      this.description,
      this.statusCode,
      this.durationTime,
      this.codeId,
      );

  factory DecontamintaionCode.fromJson(Map<String, dynamic> json) =>
      _$DecontamintaionCodeFromJson(json);
}