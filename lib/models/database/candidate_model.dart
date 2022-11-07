import 'dart:convert';

class CandidateModel {
  const CandidateModel({required this.name, required this.weight});
  
  factory CandidateModel.fromMap(Map<String, dynamic> map) => CandidateModel(
      name: map['name'],
      weight: map['weight'],
  );
  
  factory CandidateModel.fromJson(String str) => CandidateModel.fromMap(json.decode(str));
  
  final String name;
  final int weight;
  
  Map<String, dynamic> toMap() => {
      'name': name,
      'weight': weight,
  };
  
  String toJson() => json.encode(toMap());
  
}

