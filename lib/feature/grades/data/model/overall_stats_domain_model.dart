import 'package:flutter/material.dart';
import 'package:registro_elettronico/feature/subjects/domain/model/subject_domain_model.dart';

class OverallStatsDomainModel {
  final double average;
  final int insufficienze;
  final int sufficienze;
  final double votoMin;
  final double votoMax;
  final SubjectDomainModel bestSubject;
  final SubjectDomainModel worstSubject;

  OverallStatsDomainModel({
    @required this.average,
    @required this.insufficienze,
    @required this.sufficienze,
    @required this.votoMin,
    @required this.votoMax,
    @required this.bestSubject,
    @required this.worstSubject,
  });

  OverallStatsDomainModel copyWith({
    double average,
    int insufficienze,
    int sufficienze,
    double votoMin,
    double votoMax,
    SubjectDomainModel bestSubject,
    SubjectDomainModel worstSubject,
  }) {
    return OverallStatsDomainModel(
      average: average ?? this.average,
      insufficienze: insufficienze ?? this.insufficienze,
      sufficienze: sufficienze ?? this.sufficienze,
      votoMin: votoMin ?? this.votoMin,
      votoMax: votoMax ?? this.votoMax,
      bestSubject: bestSubject ?? this.bestSubject,
      worstSubject: worstSubject ?? this.worstSubject,
    );
  }

  @override
  String toString() {
    return 'OverallStatsDomainModel(average: $average, insufficienze: $insufficienze, sufficienze: $sufficienze, votoMin: $votoMin, votoMax: $votoMax, bestSubject: $bestSubject, worstSubject: $worstSubject)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is OverallStatsDomainModel &&
        o.average == average &&
        o.insufficienze == insufficienze &&
        o.sufficienze == sufficienze &&
        o.votoMin == votoMin &&
        o.votoMax == votoMax &&
        o.bestSubject == bestSubject &&
        o.worstSubject == worstSubject;
  }

  @override
  int get hashCode {
    return average.hashCode ^
        insufficienze.hashCode ^
        sufficienze.hashCode ^
        votoMin.hashCode ^
        votoMax.hashCode ^
        bestSubject.hashCode ^
        worstSubject.hashCode;
  }
}
