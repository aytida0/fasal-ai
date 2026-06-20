// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnosis_history.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDiagnosisHistoryCollection on Isar {
  IsarCollection<DiagnosisHistory> get diagnosisHistorys => this.collection();
}

const DiagnosisHistorySchema = CollectionSchema(
  name: r'DiagnosisHistory',
  id: -3449136349129517181,
  properties: {
    r'confidence': PropertySchema(
      id: 0,
      name: r'confidence',
      type: IsarType.double,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'cropName': PropertySchema(
      id: 2,
      name: r'cropName',
      type: IsarType.string,
    ),
    r'diagnosis': PropertySchema(
      id: 3,
      name: r'diagnosis',
      type: IsarType.string,
    ),
    r'diseaseName': PropertySchema(
      id: 4,
      name: r'diseaseName',
      type: IsarType.string,
    ),
    r'imagePath': PropertySchema(
      id: 5,
      name: r'imagePath',
      type: IsarType.string,
    ),
    r'isHealthy': PropertySchema(
      id: 6,
      name: r'isHealthy',
      type: IsarType.bool,
    ),
    r'prevention': PropertySchema(
      id: 7,
      name: r'prevention',
      type: IsarType.stringList,
    ),
    r'treatments': PropertySchema(
      id: 8,
      name: r'treatments',
      type: IsarType.stringList,
    )
  },
  estimateSize: _diagnosisHistoryEstimateSize,
  serialize: _diagnosisHistorySerialize,
  deserialize: _diagnosisHistoryDeserialize,
  deserializeProp: _diagnosisHistoryDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _diagnosisHistoryGetId,
  getLinks: _diagnosisHistoryGetLinks,
  attach: _diagnosisHistoryAttach,
  version: '3.1.0+1',
);

int _diagnosisHistoryEstimateSize(
  DiagnosisHistory object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.cropName.length * 3;
  bytesCount += 3 + object.diagnosis.length * 3;
  {
    final value = object.diseaseName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.imagePath.length * 3;
  bytesCount += 3 + object.prevention.length * 3;
  {
    for (var i = 0; i < object.prevention.length; i++) {
      final value = object.prevention[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.treatments.length * 3;
  {
    for (var i = 0; i < object.treatments.length; i++) {
      final value = object.treatments[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _diagnosisHistorySerialize(
  DiagnosisHistory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.confidence);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.cropName);
  writer.writeString(offsets[3], object.diagnosis);
  writer.writeString(offsets[4], object.diseaseName);
  writer.writeString(offsets[5], object.imagePath);
  writer.writeBool(offsets[6], object.isHealthy);
  writer.writeStringList(offsets[7], object.prevention);
  writer.writeStringList(offsets[8], object.treatments);
}

DiagnosisHistory _diagnosisHistoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DiagnosisHistory();
  object.confidence = reader.readDouble(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.cropName = reader.readString(offsets[2]);
  object.diagnosis = reader.readString(offsets[3]);
  object.diseaseName = reader.readStringOrNull(offsets[4]);
  object.id = id;
  object.imagePath = reader.readString(offsets[5]);
  object.isHealthy = reader.readBool(offsets[6]);
  object.prevention = reader.readStringList(offsets[7]) ?? [];
  object.treatments = reader.readStringList(offsets[8]) ?? [];
  return object;
}

P _diagnosisHistoryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readStringList(offset) ?? []) as P;
    case 8:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _diagnosisHistoryGetId(DiagnosisHistory object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _diagnosisHistoryGetLinks(DiagnosisHistory object) {
  return [];
}

void _diagnosisHistoryAttach(
    IsarCollection<dynamic> col, Id id, DiagnosisHistory object) {
  object.id = id;
}

extension DiagnosisHistoryQueryWhereSort
    on QueryBuilder<DiagnosisHistory, DiagnosisHistory, QWhere> {
  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DiagnosisHistoryQueryWhere
    on QueryBuilder<DiagnosisHistory, DiagnosisHistory, QWhereClause> {
  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DiagnosisHistoryQueryFilter
    on QueryBuilder<DiagnosisHistory, DiagnosisHistory, QFilterCondition> {
  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      confidenceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'confidence',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      confidenceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'confidence',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      confidenceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'confidence',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      confidenceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'confidence',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      cropNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cropName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      cropNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cropName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      cropNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cropName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      cropNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cropName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      cropNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cropName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      cropNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cropName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      cropNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cropName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      cropNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cropName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      cropNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cropName',
        value: '',
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      cropNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cropName',
        value: '',
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      diagnosisEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diagnosis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      diagnosisGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'diagnosis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      diagnosisLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'diagnosis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      diagnosisBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'diagnosis',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      diagnosisStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'diagnosis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      diagnosisEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'diagnosis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      diagnosisContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'diagnosis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      diagnosisMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'diagnosis',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      diagnosisIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diagnosis',
        value: '',
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      diagnosisIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'diagnosis',
        value: '',
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      diseaseNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'diseaseName',
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      diseaseNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'diseaseName',
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      diseaseNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diseaseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      diseaseNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'diseaseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      diseaseNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'diseaseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      diseaseNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'diseaseName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      diseaseNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'diseaseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      diseaseNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'diseaseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      diseaseNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'diseaseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      diseaseNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'diseaseName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      diseaseNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diseaseName',
        value: '',
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      diseaseNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'diseaseName',
        value: '',
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      imagePathEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      imagePathGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      imagePathLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      imagePathBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imagePath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      imagePathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      imagePathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      imagePathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      imagePathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imagePath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      imagePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      imagePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      isHealthyEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isHealthy',
        value: value,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      preventionElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prevention',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      preventionElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'prevention',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      preventionElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'prevention',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      preventionElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'prevention',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      preventionElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'prevention',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      preventionElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'prevention',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      preventionElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'prevention',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      preventionElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'prevention',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      preventionElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prevention',
        value: '',
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      preventionElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'prevention',
        value: '',
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      preventionLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'prevention',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      preventionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'prevention',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      preventionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'prevention',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      preventionLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'prevention',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      preventionLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'prevention',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      preventionLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'prevention',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      treatmentsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'treatments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      treatmentsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'treatments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      treatmentsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'treatments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      treatmentsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'treatments',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      treatmentsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'treatments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      treatmentsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'treatments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      treatmentsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'treatments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      treatmentsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'treatments',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      treatmentsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'treatments',
        value: '',
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      treatmentsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'treatments',
        value: '',
      ));
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      treatmentsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'treatments',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      treatmentsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'treatments',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      treatmentsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'treatments',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      treatmentsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'treatments',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      treatmentsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'treatments',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterFilterCondition>
      treatmentsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'treatments',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension DiagnosisHistoryQueryObject
    on QueryBuilder<DiagnosisHistory, DiagnosisHistory, QFilterCondition> {}

extension DiagnosisHistoryQueryLinks
    on QueryBuilder<DiagnosisHistory, DiagnosisHistory, QFilterCondition> {}

extension DiagnosisHistoryQuerySortBy
    on QueryBuilder<DiagnosisHistory, DiagnosisHistory, QSortBy> {
  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterSortBy>
      sortByConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterSortBy>
      sortByConfidenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterSortBy>
      sortByCropName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cropName', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterSortBy>
      sortByCropNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cropName', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterSortBy>
      sortByDiagnosis() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diagnosis', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterSortBy>
      sortByDiagnosisDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diagnosis', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterSortBy>
      sortByDiseaseName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diseaseName', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterSortBy>
      sortByDiseaseNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diseaseName', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterSortBy>
      sortByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterSortBy>
      sortByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterSortBy>
      sortByIsHealthy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isHealthy', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterSortBy>
      sortByIsHealthyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isHealthy', Sort.desc);
    });
  }
}

extension DiagnosisHistoryQuerySortThenBy
    on QueryBuilder<DiagnosisHistory, DiagnosisHistory, QSortThenBy> {
  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterSortBy>
      thenByConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterSortBy>
      thenByConfidenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterSortBy>
      thenByCropName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cropName', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterSortBy>
      thenByCropNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cropName', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterSortBy>
      thenByDiagnosis() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diagnosis', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterSortBy>
      thenByDiagnosisDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diagnosis', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterSortBy>
      thenByDiseaseName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diseaseName', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterSortBy>
      thenByDiseaseNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diseaseName', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterSortBy>
      thenByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterSortBy>
      thenByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterSortBy>
      thenByIsHealthy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isHealthy', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QAfterSortBy>
      thenByIsHealthyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isHealthy', Sort.desc);
    });
  }
}

extension DiagnosisHistoryQueryWhereDistinct
    on QueryBuilder<DiagnosisHistory, DiagnosisHistory, QDistinct> {
  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QDistinct>
      distinctByConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'confidence');
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QDistinct>
      distinctByCropName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cropName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QDistinct>
      distinctByDiagnosis({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'diagnosis', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QDistinct>
      distinctByDiseaseName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'diseaseName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QDistinct>
      distinctByImagePath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imagePath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QDistinct>
      distinctByIsHealthy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isHealthy');
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QDistinct>
      distinctByPrevention() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'prevention');
    });
  }

  QueryBuilder<DiagnosisHistory, DiagnosisHistory, QDistinct>
      distinctByTreatments() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'treatments');
    });
  }
}

extension DiagnosisHistoryQueryProperty
    on QueryBuilder<DiagnosisHistory, DiagnosisHistory, QQueryProperty> {
  QueryBuilder<DiagnosisHistory, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DiagnosisHistory, double, QQueryOperations>
      confidenceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'confidence');
    });
  }

  QueryBuilder<DiagnosisHistory, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<DiagnosisHistory, String, QQueryOperations> cropNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cropName');
    });
  }

  QueryBuilder<DiagnosisHistory, String, QQueryOperations> diagnosisProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'diagnosis');
    });
  }

  QueryBuilder<DiagnosisHistory, String?, QQueryOperations>
      diseaseNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'diseaseName');
    });
  }

  QueryBuilder<DiagnosisHistory, String, QQueryOperations> imagePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imagePath');
    });
  }

  QueryBuilder<DiagnosisHistory, bool, QQueryOperations> isHealthyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isHealthy');
    });
  }

  QueryBuilder<DiagnosisHistory, List<String>, QQueryOperations>
      preventionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'prevention');
    });
  }

  QueryBuilder<DiagnosisHistory, List<String>, QQueryOperations>
      treatmentsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'treatments');
    });
  }
}
