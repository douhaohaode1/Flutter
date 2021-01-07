
import 'package:json_annotation/json_annotation.dart';
part 'TranslationModel.g.dart';

/**
 * {
    "from": "en",
    "to": "zh",
    "trans_result": [
    {
    "src": "apple",
    "dst": "苹果",
    "src_tts": "https:\/\/fanyiapp.cdn.bcebos.com\/api\/tts\/95e906875b87d342d7325a36a4e1ab42.mp3",
    "dst_tts": "https:\/\/fanyiapp.cdn.bcebos.com\/api\/tts\/62f4ff87617655bc1f65e24cf4ed4963.mp3",
    "dict": "{\"lang\":\"1\",\"word_result\":{\"simple_means\":{\"word_name\":\"apple\",\"from\":\"original\",\"word_means\":[\"苹果\"],\"exchange\":{\"word_pl\":[\"apples\"]},\"tags\":{\"core\":[\"高考\",\"考研\"],\"other\":[\"\"]},\"symbols\":[{\"ph_en\":\"ˈæpl\",\"ph_am\":\"ˈæpl\",\"parts\":[{\"part\":\"n.\",\"means\":[\"苹果\"]}],\"ph_other\":\"\"}]}}}"
    }
    ]flutter packages pub run build_runner build
    }
 * */


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