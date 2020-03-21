import 'package:json_annotation/json_annotation.dart';

part 'local.g.dart';

@JsonSerializable()
class Local {
  @JsonKey(name: 'local_total_cases')
  final int total;

  @JsonKey(name: 'local_new_cases')
  final int newCases;

  @JsonKey(name: 'local_deaths')
  final int deaths;

  @JsonKey(name: 'local_recovered')
  final int recovered;

  @JsonKey(name: 'update_date_time')
  final String date;
  
  Local({this.total, this.newCases, this.deaths, this.recovered, this.date});

  factory Local.fromJson(Map<String, dynamic> json) => _$LocalFromJson(json);
  Map<String, dynamic> toJson() => _$LocalToJson(this);
}
