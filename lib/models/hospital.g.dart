// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hospital _$HospitalFromJson(Map<String, dynamic> json) {
  return Hospital(
    id: json['hospital']['id'] as int,
    name : json['hospital']['name'] as String,
    cumulativeLocal: json['cumulative_local'] as int,
    cumulativeForeign: json['cumulative_foreign'] as int,
    cumulativeTotal: json['cumulative_total'] as int,
    treatmentLocal: json['treatment_local'] as int,
    treatmentForeign: json['treatment_foreign'] as int,
    treatmentTotal: json['treatment_total'] as int,
  );
}

Map<String, dynamic> _$HospitalToJson(Hospital instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cumulative_local': instance.cumulativeLocal,
      'cumulative_foreign': instance.cumulativeForeign,
      'cumulative_total': instance.cumulativeTotal,
      'treatment_local': instance.treatmentLocal,
      'treatment_foreign': instance.treatmentForeign,
      'treatment_total': instance.treatmentTotal,
    };
