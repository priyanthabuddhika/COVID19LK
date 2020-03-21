// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Local _$LocalFromJson(Map<String, dynamic> json) {
  return Local(
    total: json['data']['local_total_cases'] as int,
    newCases: json['data']['local_new_cases'] as int,
    deaths: json['data']['local_deaths'] as int,
    recovered: json['data']['local_recovered'] as int,
    date: json['data']['update_date_time'] as String,
    hospital:  json['data']['local_total_number_of_individuals_in_hospitals'] as int,
  );
}

Map<String, dynamic> _$LocalToJson(Local instance) => <String, dynamic>{
      'local_total_cases': instance.total,
      'local_new_cases': instance.newCases,
      'local_deaths': instance.deaths,
      'local_recovered': instance.recovered,
      'update_date_time': instance.date,
      'local_total_number_of_individuals_in_hospitals': instance.hospital,
    };
