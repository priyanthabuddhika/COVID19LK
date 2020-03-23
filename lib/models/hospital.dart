import 'package:json_annotation/json_annotation.dart';

part 'hospital.g.dart';

@JsonSerializable()
class Hospital {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'cumulative_local')
  int cumulativeLocal;
  @JsonKey(name: 'cumulative_foreign')
  int cumulativeForeign;
  @JsonKey(name: 'cumulative_total')
  int cumulativeTotal;
  @JsonKey(name: 'treatment_local')
  int treatmentLocal;
  @JsonKey(name: 'treatment_foreign')
  int treatmentForeign;
  @JsonKey(name: 'treatment_total')
  int treatmentTotal;

  Hospital(
      {this.id,
      this.name,
      this.cumulativeLocal,
      this.cumulativeForeign,
      this.cumulativeTotal,
      this.treatmentLocal,
      this.treatmentForeign,
      this.treatmentTotal});

  factory Hospital.fromJson(Map<String, dynamic> json) =>
      _$HospitalFromJson(json);
  Map<String, dynamic> toJson() => _$HospitalToJson(this);
}

class HospitalList {
  List<Hospital> hospitals;
  HospitalList({this.hospitals});

  factory HospitalList.fromJson(List<dynamic> json) {
    return HospitalList(
        hospitals: json
            .map((e) => Hospital.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}
