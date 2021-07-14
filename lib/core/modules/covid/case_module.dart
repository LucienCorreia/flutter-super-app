import 'package:flutter_modular/flutter_modular.dart';

import '../../../domain/repositories/covid/covid_repository.dart';
import '../../../domain/usecases/covid/search_cases_usecase.dart';
import '../../../domain/usecases/covid/get_cases_usecase.dart';
import '../../../external/datasources/covid/external_covid_datasource.dart';
import '../../../infra/datasources/covid/external_covid_datasource.dart';
import '../../../infra/repositories/covid/covid_repository.dart';
import '../../../presenter/pages/covid/pages/cases/cases_page.dart';
import 'cases/cases_value_notifier_module.dart';

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
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => CasesPage(),
    ),
    ModuleRoute(
      '/value-notifier',
      module: CasesValueNotifierModule(),
    ),
  ];
}
