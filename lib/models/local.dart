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

 @JsonKey(name: 'local_total_number_of_individuals_in_hospitals')
  final int hospital;  

  @JsonKey(name: 'update_date_time')
  final String date;
  
  Local({this.total, this.newCases, this.deaths, this.recovered, this.date,this.hospital});

  factory Local.fromJson(Map<String, dynamic> json) => _$LocalFromJson(json);
  Map<String, dynamic> toJson() => _$LocalToJson(this);
}
