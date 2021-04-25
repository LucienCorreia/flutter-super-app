import 'package:faker/faker.dart';
import 'package:flutter_example/domain/entities/covid/case_entity.dart';

class CaseModel extends CaseEntity {
  CaseModel({
    required int iso,
    required String country,
    required int population,
    required int confirmed,
    required int recovered,
    required int deaths,
    required DateTime updated,
  }) : super(
          iso: iso,
          country: country,
          population: population,
          confirmed: confirmed,
          recovered: recovered,
          deaths: deaths,
          updated: updated,
        );

  factory CaseModel.fromJson(Map<String, dynamic> json) {
    return CaseModel(
      iso: json['iso'],
      country: json['country'],
      population: json['population'],
      confirmed: json['confirmed'],
      recovered: json['recovered'],
      deaths: json['deaths'],
      updated: DateTime.parse(json['updated']),
    );
  }

  factory CaseModel.fake() {
    final faker = Faker();

    final population = faker.randomGenerator.integer(2000000000);
    final confirmed = faker.randomGenerator.integer(population);

    return CaseModel(
      iso: faker.randomGenerator.integer(999),
      country: faker.address.country(),
      population: population,
      confirmed: confirmed,
      recovered: faker.randomGenerator.integer(confirmed),
      deaths: faker.randomGenerator.integer(confirmed),
      updated: faker.date.dateTime(),
    );
  }

  static List<CaseModel> fakeList(int length) {
    return List<CaseModel>.generate(
      length,
      (_) => CaseModel.fake(),
    );
  }
}
