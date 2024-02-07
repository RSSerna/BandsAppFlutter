import 'dart:convert';

import 'package:bandnameapp/features/bands/domain/entities/bands.dart';

class BandsModel extends Bands {
  const BandsModel(
      {required super.id, required super.name, required super.votes});

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "votes": votes,
      };

  factory BandsModel.fromJson(String str) => BandsModel.fromMap(
        json.decode(str),
      );

  String toJson() => json.encode(toMap());

  factory BandsModel.fromMap(Map<String, dynamic> json) => BandsModel(
        id: json["id"],
        name: json["name"],
        votes: json["votes"],
      );
}
