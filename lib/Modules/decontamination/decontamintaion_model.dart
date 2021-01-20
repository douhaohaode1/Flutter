
import 'decontamination_widget.dart';

class DecontamintaionModle{
   String upn;
   String description;
   String serial;
   String unitTypeCode;
   String statusCode;
   String reasonCode;
   String comment;
  DecontamintaionModle({this.upn,this.description,this.serial,this.reasonCode,this.unitTypeCode,this.statusCode,this.comment});
}

class DecontamintaionCodeModel{
  DecontamintaionCodeModel(this.id,this.name);
   int id;
   String name;
}

List  decontamintaionDetectStyles = [
  {"title": "机器码UPN","content" :"H&491LAB100C27Z0","style":DecontaminationCellStyle.record,"mark":"upn"},
  {"title": "Description","content" :"i-Lab CART System Zeron","style":DecontaminationCellStyle.descrpotion},
  {"title": "机器番号","content" :"10086","hintText":"扫码填入","style":DecontaminationCellStyle.record,"mark":"serial"},
];

List decontamintaionUpateStyles = [
  {"title": "UPN","content" :"H7849IAB100C27X0","style":DecontaminationCellStyle.non},
  {"title": "Description","content" :"i-Lab CART System Zerons","style":DecontaminationCellStyle.non},
  {"title": "Serial","content" :"10068","style":DecontaminationCellStyle.non},
  {"title": "* Unit Yype Code","content" :"","style":DecontaminationCellStyle.menu,"mark":'unitYypeCode'},
  {"title": "* StatusCode","content" :"","style":DecontaminationCellStyle.menu,"mark":'tatusCode'},
  {"title": "Reason Code","content" :"","style":DecontaminationCellStyle.menu,"mark":'reasonCode'},
  {"title": "Comment","content" :"","style":DecontaminationCellStyle.comment},
];


