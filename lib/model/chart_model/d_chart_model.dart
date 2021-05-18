// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    this.code,
    this.codein,
    this.name,
    this.high,
    this.low,
    this.varBid,
    this.pctChange,
    this.bid,
    this.ask,
    this.timestamp,
    this.createDate,
  });

  String code;
  String codein;
  String name;
  String high;
  String low;
  String varBid;
  String pctChange;
  String bid;
  String ask;
  String timestamp;
  DateTime createDate;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        code: json["code"] == null ? null : json["code"],
        codein: json["codein"] == null ? null : json["codein"],
        name: json["name"] == null ? null : json["name"],
        high: json["high"],
        low: json["low"],
        varBid: json["varBid"],
        pctChange: json["pctChange"],
        bid: json["bid"],
        ask: json["ask"],
        timestamp: json["timestamp"],
        createDate: json["create_date"] == null
            ? null
            : DateTime.parse(json["create_date"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "codein": codein == null ? null : codein,
        "name": name == null ? null : name,
        "high": high,
        "low": low,
        "varBid": varBid,
        "pctChange": pctChange,
        "bid": bid,
        "ask": ask,
        "timestamp": timestamp,
        "create_date": createDate == null ? null : createDate.toIso8601String(),
      };
}
