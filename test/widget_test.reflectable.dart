// This file has been generated by the reflectable package.
// https://github.com/dart-lang/reflectable.

import 'dart:core';
import 'package:dart_json_mapper/src/model/annotations.dart' as prefix0;
import 'package:flutter_demo/Model/ResultModel.dart' as prefix1;

// ignore_for_file: prefer_adjacent_string_concatenation
// ignore_for_file: prefer_collection_literals
// ignore_for_file: unnecessary_const
// ignore_for_file: implementation_imports

// ignore:unused_import
import 'package:reflectable/mirrors.dart' as m;
// ignore:unused_import
import 'package:reflectable/src/reflectable_builder_based.dart' as r;
// ignore:unused_import
import 'package:reflectable/reflectable.dart' as r show Reflectable;

final _data = <r.Reflectable, r.ReflectorData>{
  const prefix0.JsonSerializable(): r.ReflectorData(
      <m.TypeMirror>[
        r.NonGenericClassMirrorImpl(
            r'ResutlModel',
            r'.ResutlModel',
            7,
            0,
            const prefix0.JsonSerializable(),
            const <int>[0, 1, 2, 30],
            const <int>[31, 32, 33, 34, 35, 24, 25, 26, 27, 28, 29],
            const <int>[],
            -1,
            {},
            {},
            {r'': (bool b) => () => b ? prefix1.ResutlModel() : null},
            -1,
            0,
            const <int>[],
            const <Object>[prefix0.jsonSerializable],
            null),
        r.NonGenericClassMirrorImpl(
            r'ListModel',
            r'.ListModel',
            7,
            1,
            const prefix0.JsonSerializable(),
            const <int>[3, 4, 5, 6, 7, 8, 9, 50],
            const <int>[
              31,
              32,
              33,
              34,
              35,
              36,
              37,
              38,
              39,
              40,
              41,
              42,
              43,
              44,
              45,
              46,
              47,
              48,
              49
            ],
            const <int>[],
            -1,
            {},
            {},
            {r'': (bool b) => () => b ? prefix1.ListModel() : null},
            -1,
            1,
            const <int>[],
            const <Object>[prefix0.jsonSerializable],
            null),
        r.NonGenericClassMirrorImpl(
            r'itemModel',
            r'.itemModel',
            7,
            2,
            const prefix0.JsonSerializable(),
            const <int>[
              10,
              11,
              12,
              13,
              14,
              15,
              16,
              17,
              18,
              19,
              20,
              21,
              22,
              23,
              79
            ],
            const <int>[
              31,
              32,
              33,
              34,
              35,
              51,
              52,
              53,
              54,
              55,
              56,
              57,
              58,
              59,
              60,
              61,
              62,
              63,
              64,
              65,
              66,
              67,
              68,
              69,
              70,
              71,
              72,
              73,
              74,
              75,
              76,
              77,
              78
            ],
            const <int>[],
            -1,
            {},
            {},
            {r'': (bool b) => () => b ? prefix1.itemModel() : null},
            -1,
            2,
            const <int>[],
            const <Object>[prefix0.jsonSerializable],
            null)
      ],
      <m.DeclarationMirror>[
        r.VariableMirrorImpl(
            r'data',
            32773,
            0,
            const prefix0.JsonSerializable(),
            1,
            1,
            1,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: "data")]),
        r.VariableMirrorImpl(
            r'errorCode',
            32773,
            0,
            const prefix0.JsonSerializable(),
            -1,
            3,
            3,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: "errorCode")]),
        r.VariableMirrorImpl(
            r'errorMsg',
            32773,
            0,
            const prefix0.JsonSerializable(),
            -1,
            4,
            4,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: "errorMsg")]),
        r.VariableMirrorImpl(
            r'curPage',
            32773,
            1,
            const prefix0.JsonSerializable(),
            -1,
            3,
            3,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: "curPage")]),
        r.VariableMirrorImpl(
            r'offset',
            32773,
            1,
            const prefix0.JsonSerializable(),
            -1,
            3,
            3,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: "offset")]),
        r.VariableMirrorImpl(
            r'over',
            32773,
            1,
            const prefix0.JsonSerializable(),
            -1,
            5,
            5,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: "over")]),
        r.VariableMirrorImpl(
            r'pageCount',
            32773,
            1,
            const prefix0.JsonSerializable(),
            -1,
            3,
            3,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: "pageCount")]),
        r.VariableMirrorImpl(
            r'size',
            32773,
            1,
            const prefix0.JsonSerializable(),
            -1,
            3,
            3,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: "size")]),
        r.VariableMirrorImpl(
            r'total',
            32773,
            1,
            const prefix0.JsonSerializable(),
            -1,
            3,
            3,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: "total")]),
        r.VariableMirrorImpl(
            r'datas',
            2129925,
            1,
            const prefix0.JsonSerializable(),
            -1,
            6,
            7,
            null,
            const <Object>[const prefix0.JsonProperty(name: "datas")]),
        r.VariableMirrorImpl(
            r'apkLink',
            32773,
            2,
            const prefix0.JsonSerializable(),
            -1,
            4,
            4,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: "apkLink")]),
        r.VariableMirrorImpl(
            r'chapterId',
            32773,
            2,
            const prefix0.JsonSerializable(),
            -1,
            3,
            3,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: "chapterId")]),
        r.VariableMirrorImpl(
            r'chapterName',
            32773,
            2,
            const prefix0.JsonSerializable(),
            -1,
            4,
            4,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: "chapterName")]),
        r.VariableMirrorImpl(
            r'collect',
            32773,
            2,
            const prefix0.JsonSerializable(),
            -1,
            5,
            5,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: "collect")]),
        r.VariableMirrorImpl(
            r'envelopePic',
            32773,
            2,
            const prefix0.JsonSerializable(),
            -1,
            4,
            4,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: "envelopePic")]),
        r.VariableMirrorImpl(
            r'fresh',
            32773,
            2,
            const prefix0.JsonSerializable(),
            -1,
            5,
            5,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: "fresh")]),
        r.VariableMirrorImpl(
            r'id',
            32773,
            2,
            const prefix0.JsonSerializable(),
            -1,
            3,
            3,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: "id")]),
        r.VariableMirrorImpl(
            r'niceDate',
            32773,
            2,
            const prefix0.JsonSerializable(),
            -1,
            4,
            4,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: "niceDate")]),
        r.VariableMirrorImpl(
            r'publishTime',
            32773,
            2,
            const prefix0.JsonSerializable(),
            -1,
            3,
            3,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: "publishTime")]),
        r.VariableMirrorImpl(
            r'shareDate',
            32773,
            2,
            const prefix0.JsonSerializable(),
            -1,
            3,
            3,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: "shareDate")]),
        r.VariableMirrorImpl(
            r'superChapterName',
            32773,
            2,
            const prefix0.JsonSerializable(),
            -1,
            4,
            4, const <int>[], const <Object>[
          const prefix0.JsonProperty(name: "superChapterName")
        ]),
        r.VariableMirrorImpl(
            r'title',
            32773,
            2,
            const prefix0.JsonSerializable(),
            -1,
            4,
            4,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: "title")]),
        r.VariableMirrorImpl(
            r'type',
            32773,
            2,
            const prefix0.JsonSerializable(),
            -1,
            3,
            3,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: "type")]),
        r.VariableMirrorImpl(
            r'visible',
            32773,
            2,
            const prefix0.JsonSerializable(),
            -1,
            3,
            3,
            const <int>[],
            const <Object>[const prefix0.JsonProperty(name: "visible")]),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 0, 24),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 0, 25),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 1, 26),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 1, 27),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 2, 28),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 2, 29),
        r.MethodMirrorImpl(r'', 64, 0, -1, 0, 0, const <int>[], const <int>[],
            const prefix0.JsonSerializable(), const []),
        r.MethodMirrorImpl(r'==', 131074, null, -1, 5, 5, const <int>[],
            const <int>[3], const prefix0.JsonSerializable(), const []),
        r.MethodMirrorImpl(r'toString', 131074, null, -1, 4, 4, const <int>[],
            const <int>[], const prefix0.JsonSerializable(), const []),
        r.MethodMirrorImpl(
            r'noSuchMethod',
            65538,
            null,
            null,
            null,
            null,
            const <int>[],
            const <int>[4],
            const prefix0.JsonSerializable(),
            const []),
        r.MethodMirrorImpl(r'hashCode', 131075, null, -1, 3, 3, const <int>[],
            const <int>[], const prefix0.JsonSerializable(), const []),
        r.MethodMirrorImpl(
            r'runtimeType',
            131075,
            null,
            -1,
            8,
            8,
            const <int>[],
            const <int>[],
            const prefix0.JsonSerializable(),
            const []),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 3, 36),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 3, 37),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 4, 38),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 4, 39),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 5, 40),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 5, 41),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 6, 42),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 6, 43),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 7, 44),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 7, 45),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 8, 46),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 8, 47),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 9, 48),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 9, 49),
        r.MethodMirrorImpl(r'', 64, 1, -1, 1, 1, const <int>[], const <int>[],
            const prefix0.JsonSerializable(), const []),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 10, 51),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 10, 52),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 11, 53),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 11, 54),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 12, 55),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 12, 56),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 13, 57),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 13, 58),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 14, 59),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 14, 60),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 15, 61),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 15, 62),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 16, 63),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 16, 64),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 17, 65),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 17, 66),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 18, 67),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 18, 68),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 19, 69),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 19, 70),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 20, 71),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 20, 72),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 21, 73),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 21, 74),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 22, 75),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 22, 76),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 23, 77),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 23, 78),
        r.MethodMirrorImpl(r'', 64, 2, -1, 2, 2, const <int>[], const <int>[],
            const prefix0.JsonSerializable(), const [])
      ],
      <m.ParameterMirror>[
        r.ParameterMirrorImpl(
            r'_data',
            32870,
            25,
            const prefix0.JsonSerializable(),
            1,
            1,
            1,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_errorCode',
            32870,
            27,
            const prefix0.JsonSerializable(),
            -1,
            3,
            3,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_errorMsg',
            32870,
            29,
            const prefix0.JsonSerializable(),
            -1,
            4,
            4,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'other',
            32774,
            31,
            const prefix0.JsonSerializable(),
            -1,
            9,
            9,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'invocation',
            32774,
            33,
            const prefix0.JsonSerializable(),
            -1,
            10,
            10,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_curPage',
            32870,
            37,
            const prefix0.JsonSerializable(),
            -1,
            3,
            3,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_offset',
            32870,
            39,
            const prefix0.JsonSerializable(),
            -1,
            3,
            3,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_over',
            32870,
            41,
            const prefix0.JsonSerializable(),
            -1,
            5,
            5,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_pageCount',
            32870,
            43,
            const prefix0.JsonSerializable(),
            -1,
            3,
            3,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_size',
            32870,
            45,
            const prefix0.JsonSerializable(),
            -1,
            3,
            3,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_total',
            32870,
            47,
            const prefix0.JsonSerializable(),
            -1,
            3,
            3,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_datas',
            2130022,
            49,
            const prefix0.JsonSerializable(),
            -1,
            6,
            7,
            null,
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_apkLink',
            32870,
            52,
            const prefix0.JsonSerializable(),
            -1,
            4,
            4,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_chapterId',
            32870,
            54,
            const prefix0.JsonSerializable(),
            -1,
            3,
            3,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_chapterName',
            32870,
            56,
            const prefix0.JsonSerializable(),
            -1,
            4,
            4,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_collect',
            32870,
            58,
            const prefix0.JsonSerializable(),
            -1,
            5,
            5,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_envelopePic',
            32870,
            60,
            const prefix0.JsonSerializable(),
            -1,
            4,
            4,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_fresh',
            32870,
            62,
            const prefix0.JsonSerializable(),
            -1,
            5,
            5,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_id',
            32870,
            64,
            const prefix0.JsonSerializable(),
            -1,
            3,
            3,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_niceDate',
            32870,
            66,
            const prefix0.JsonSerializable(),
            -1,
            4,
            4,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_publishTime',
            32870,
            68,
            const prefix0.JsonSerializable(),
            -1,
            3,
            3,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_shareDate',
            32870,
            70,
            const prefix0.JsonSerializable(),
            -1,
            3,
            3,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_superChapterName',
            32870,
            72,
            const prefix0.JsonSerializable(),
            -1,
            4,
            4,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_title',
            32870,
            74,
            const prefix0.JsonSerializable(),
            -1,
            4,
            4,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_type',
            32870,
            76,
            const prefix0.JsonSerializable(),
            -1,
            3,
            3,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_visible',
            32870,
            78,
            const prefix0.JsonSerializable(),
            -1,
            3,
            3,
            const <int>[],
            const [],
            null,
            null)
      ],
      <Type>[
        prefix1.ResutlModel,
        prefix1.ListModel,
        prefix1.itemModel,
        int,
        String,
        bool,
        const m.TypeValue<List<dynamic>>().type,
        List,
        Type,
        Object,
        Invocation
      ],
      3,
      {
        r'==': (dynamic instance) => (x) => instance == x,
        r'toString': (dynamic instance) => instance.toString,
        r'noSuchMethod': (dynamic instance) => instance.noSuchMethod,
        r'hashCode': (dynamic instance) => instance.hashCode,
        r'runtimeType': (dynamic instance) => instance.runtimeType,
        r'data': (dynamic instance) => instance.data,
        r'errorCode': (dynamic instance) => instance.errorCode,
        r'errorMsg': (dynamic instance) => instance.errorMsg,
        r'curPage': (dynamic instance) => instance.curPage,
        r'offset': (dynamic instance) => instance.offset,
        r'over': (dynamic instance) => instance.over,
        r'pageCount': (dynamic instance) => instance.pageCount,
        r'size': (dynamic instance) => instance.size,
        r'total': (dynamic instance) => instance.total,
        r'datas': (dynamic instance) => instance.datas,
        r'apkLink': (dynamic instance) => instance.apkLink,
        r'chapterId': (dynamic instance) => instance.chapterId,
        r'chapterName': (dynamic instance) => instance.chapterName,
        r'collect': (dynamic instance) => instance.collect,
        r'envelopePic': (dynamic instance) => instance.envelopePic,
        r'fresh': (dynamic instance) => instance.fresh,
        r'id': (dynamic instance) => instance.id,
        r'niceDate': (dynamic instance) => instance.niceDate,
        r'publishTime': (dynamic instance) => instance.publishTime,
        r'shareDate': (dynamic instance) => instance.shareDate,
        r'superChapterName': (dynamic instance) => instance.superChapterName,
        r'title': (dynamic instance) => instance.title,
        r'type': (dynamic instance) => instance.type,
        r'visible': (dynamic instance) => instance.visible
      },
      {
        r'data=': (dynamic instance, value) => instance.data = value,
        r'errorCode=': (dynamic instance, value) => instance.errorCode = value,
        r'errorMsg=': (dynamic instance, value) => instance.errorMsg = value,
        r'curPage=': (dynamic instance, value) => instance.curPage = value,
        r'offset=': (dynamic instance, value) => instance.offset = value,
        r'over=': (dynamic instance, value) => instance.over = value,
        r'pageCount=': (dynamic instance, value) => instance.pageCount = value,
        r'size=': (dynamic instance, value) => instance.size = value,
        r'total=': (dynamic instance, value) => instance.total = value,
        r'datas=': (dynamic instance, value) => instance.datas = value,
        r'apkLink=': (dynamic instance, value) => instance.apkLink = value,
        r'chapterId=': (dynamic instance, value) => instance.chapterId = value,
        r'chapterName=': (dynamic instance, value) =>
            instance.chapterName = value,
        r'collect=': (dynamic instance, value) => instance.collect = value,
        r'envelopePic=': (dynamic instance, value) =>
            instance.envelopePic = value,
        r'fresh=': (dynamic instance, value) => instance.fresh = value,
        r'id=': (dynamic instance, value) => instance.id = value,
        r'niceDate=': (dynamic instance, value) => instance.niceDate = value,
        r'publishTime=': (dynamic instance, value) =>
            instance.publishTime = value,
        r'shareDate=': (dynamic instance, value) => instance.shareDate = value,
        r'superChapterName=': (dynamic instance, value) =>
            instance.superChapterName = value,
        r'title=': (dynamic instance, value) => instance.title = value,
        r'type=': (dynamic instance, value) => instance.type = value,
        r'visible=': (dynamic instance, value) => instance.visible = value
      },
      null,
      [])
};

final _memberSymbolMap = null;

void initializeReflectable() {
  r.data = _data;
  r.memberSymbolMap = _memberSymbolMap;
}
