import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_super_app/domain/usecases/covid/search_cases_usecase.dart';

import '../../../domain/repositories/covid/covid_repository.dart';
import '../../../domain/usecases/covid/get_cases_usecase.dart';
import '../../../external/datasources/covid/external_covid_datasource.dart';
import '../../../infra/datasources/covid/external_covid_datasource.dart';
import '../../../infra/repositories/covid/covid_repository.dart';
import '../../../presenter/pages/covid/pages/cases/cases_page.dart';
import '../../../presenter/pages/covid/pages/cases/cases_state.dart';

class CaseModule extends Module {
  @override
  final List<Bind> binds = [
    // datasources
    Bind<ExternalCovidDatasourceInterface>(
      (i) => ExternalCovidDatasource(
        http: i.get(),
      ),
    ),
    // repositories
    Bind<CovidRepositoryInterface>(
      (i) => CovidRepository(
        externalCovidDatasource: i.get(),
      ),
    ),
    // usecases
    Bind(
      (i) => GetCasesUsecase(
        covidRepository: i.get(),
      ),
    ),
    Bind(
      (i) => SearchCasesUsecase(),
    ),
    // states
    Bind(
      (i) => CasesState(
        getCasesUsecase: i.get(),
        searchCasesUsecase: i.get(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => CasesPage(),
    ),
  ];
}
