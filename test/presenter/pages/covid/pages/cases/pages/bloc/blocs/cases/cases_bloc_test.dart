import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_super_app/core/modules/covid/case_module.dart';
import 'package:flutter_super_app/infra/datasources/covid/external_covid_datasource.dart';
import 'package:flutter_super_app/infra/models/covid/case_model.dart';
import 'package:flutter_super_app/presenter/pages/covid/pages/cases/bloc/blocs/cases/cases_bloc.dart';
import 'package:flutter_super_app/presenter/pages/covid/pages/cases/bloc/blocs/cases/cases_bloc_states.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'cases_bloc_test.mocks.dart';

class ExternalCovidDatasource extends Mock
    implements ExternalCovidDatasourceInterface {}

@GenerateMocks([ExternalCovidDatasource])
void main() {
  late MockExternalCovidDatasource externalCovidDatasourceMock;

  setUpAll(() {
    initModule(
      CaseModule(),
      replaceBinds: [
        Bind<ExternalCovidDatasourceInterface>(
          (i) => MockExternalCovidDatasource(),
        ),
      ],
    );

    externalCovidDatasourceMock = Modular.get();
  });

  group('CasesBloc', () {
    blocTest<CasesBloc, CasesBlocState>(
      'Should emits [CasesBlocStateLoading, CasesBlocStateLoaded] when successful',
      build: () {
        when(externalCovidDatasourceMock.getCases())
            .thenAnswer((_) => Future.value(CaseModel.fakeList(300)));

        return CasesBloc(
          getCasesUsecase: Modular.get(),
          searchCasesUsecase: Modular.get(),
        );
      },
      act: (bloc) => bloc.add(''),
      expect: () => [
        isA<CasesBlocStateLoading>(),
        isA<CasesBlocStateLoaded>(),
      ],
    );

    blocTest<CasesBloc, CasesBlocState>(
      'Should emits [CasesBlocStateLoading, CasesBlocStateLoaded, CasesBlocStateLoading, CasesBlocStateLoaded, CasesBlocStateLoading, CasesBlocStateLoaded] when successful',
      build: () {
        when(externalCovidDatasourceMock.getCases())
            .thenAnswer((_) => Future.value(CaseModel.fakeList(300)));

        return CasesBloc(
          getCasesUsecase: Modular.get(),
          searchCasesUsecase: Modular.get(),
        );
      },
      act: (bloc) async {
        bloc.add('');
        bloc.add('a');
        bloc.add('');
      },
      expect: () => [
        isA<CasesBlocStateLoading>(),
        isA<CasesBlocStateLoaded>(),
        isA<CasesBlocStateLoading>(),
        isA<CasesBlocStateLoaded>(),
        isA<CasesBlocStateLoading>(),
        isA<CasesBlocStateLoaded>(),
      ],
    );

    blocTest<CasesBloc, CasesBlocState>(
      'Should emits [CasesBlocStateLoading, CasesBlocStateFailure] when failure',
      build: () {
        when(externalCovidDatasourceMock.getCases())
            .thenAnswer((_) => throw Exception('API error!'));

        print(Modular.get<ExternalCovidDatasourceInterface>());

        return CasesBloc(
          getCasesUsecase: Modular.get(),
          searchCasesUsecase: Modular.get(),
        );
      },
      act: (bloc) {
        bloc.add('');
      },
      expect: () => [
        isA<CasesBlocStateLoading>(),
        isA<CasesBlocStateFailure>(),
      ],
    );
  });
}
