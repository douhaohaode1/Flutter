
import 'package:json_annotation/json_annotation.dart';
part 'TranslationModel.g.dart';

@JsonSerializable()
class TranslationModel{

  final String from;
  final String to;
  final int error_code;
  final String src_tts;
  final String dst_tts;

  @JsonKey(name: "trans_result")
  final List<TransResultModle> trans_result;

  TranslationModel(
      this.from,
      this.to,
      this.error_code,
      this.src_tts,
      this.dst_tts,
      this.trans_result,
      );

  factory TranslationModel.fromJson(Map<String, dynamic> json) =>
      _$TranslationModelFromJson(json);
}

@JsonSerializable()
class TransResultModle{

    final String src;
    final String dst;

    final String src_tts;
    final String dst_tts;

    final String dict;

    TransResultModle(
        this.src,
        this.dst,
        this.src_tts,
        this.dst_tts,
        this.dict,
        );

    factory TransResultModle.fromJson(Map<String, dynamic> json) =>
        _$TransResultModleFromJson(json);
}


@JsonSerializable()
class TransListModle{

  final String form;
  final String goto;
  final int id;
  final String title;
  final String subtitle;
  final String createData;
  final String src;
  final String dst;
  final String updateData;
  final int number;

  TransListModle(
      this.form,
      this.goto,
      this.id,
      this.title,
      this.subtitle,
      this.createData,
      this.src,
      this.dst,
      this.updateData,
      this.number,
      );

  factory TransListModle.fromJson(Map<String, dynamic> json) =>
      _$TransListModleFromJson(json);
}