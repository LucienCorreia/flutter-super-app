// Mocks generated by Mockito 5.0.10 from annotations
// in flutter_super_app/test/presenter/pages/covid/pages/cases/pages/cases_page_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:flutter_super_app/domain/entities/covid/case_entity.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

import 'cases_page_test.dart' as _i2;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [ExternalCovidDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockExternalCovidDatasource extends _i1.Mock
    implements _i2.ExternalCovidDatasource {
  MockExternalCovidDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.CaseEntity>> getCases() => (super.noSuchMethod(
          Invocation.method(#getCases, []),
          returnValue: Future<List<_i4.CaseEntity>>.value(<_i4.CaseEntity>[]))
      as _i3.Future<List<_i4.CaseEntity>>);
  @override
  String toString() => super.toString();
}
