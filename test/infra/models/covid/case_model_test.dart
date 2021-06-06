import 'package:flutter_super_app/domain/entities/covid/case_entity.dart';
import 'package:flutter_super_app/infra/models/covid/case_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CaseModel', () {
    test('fromJson', () {
      final json = {
        'iso': 123,
        'country': 'Brazil',
        'population': 210000000,
        'confirmed': 10000000,
        'recovered': 9000000,
        'deaths': 750000,
      };

      final caseModel = CaseModel.fromJson(json);

      final caseModelCopy = CaseModel(
        iso: 123,
        country: 'Brazil',
        population: 210000000,
        confirmed: 10000000,
        recovered: 9000000,
        deaths: 750000,
      );

      expect(caseModel, isA<CaseEntity>());
      expect(caseModel, isA<CaseModel>());
      expect(caseModel, equals(caseModelCopy));
    });

    test('fake', () {
      final caseModelFake = CaseModel.fake();

      expect(caseModelFake, isA<CaseEntity>());
      expect(caseModelFake, isA<CaseModel>());
    });
  });
}
