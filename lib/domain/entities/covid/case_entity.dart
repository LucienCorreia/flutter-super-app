import 'package:equatable/equatable.dart';

class CaseEntity extends Equatable {
  final int? iso;
  final String? country;
  final int? population;
  final int confirmed;
  final int recovered;
  final int deaths;
  final DateTime? updated;

  const CaseEntity({
    required this.iso,
    required this.country,
    required this.population,
    required this.confirmed,
    required this.recovered,
    required this.deaths,
    required this.updated,
  });

  @override
  List<Object?> get props => [
        iso,
        country,
        population,
        confirmed,
        recovered,
        deaths,
        updated,
      ];

  num get percentConfirmedByPopulation =>
      population != null ? confirmed * 100 / population! : 0;

  num get percentRecoveredByConfirmed => recovered * 100 / confirmed;

  num get percentDeathsByPopulation => deaths * 100 / confirmed;
}
