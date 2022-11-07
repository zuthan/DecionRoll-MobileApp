import 'dart:convert';

class DecisionStateModel {}

class DecisionModel {
  String ownerId;
  String title;
  String state;
  DecisionModel({
    required this.title,
    required this.state,
    required this.ownerId,
  });

  Map<String, dynamic> toMap() {
    return {
      'ownerId': ownerId,
      'title': title,
      'state': state,
    };
  }

  factory DecisionModel.fromMap(Map<String, dynamic> json) {
    return DecisionModel(
        ownerId: json['ownerId'] ?? '',
        title: json['title'] ?? '',
        state: json['state'] ?? '');
  }

  String toJson() {
    return toMap().toString();
  }

  factory DecisionModel.fromJson(String source) =>
      DecisionModel.fromMap(json.decode(source));
}
