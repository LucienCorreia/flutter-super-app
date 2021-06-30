import '../../entities/covid/case_entity.dart';

class SearchCasesUsecase {
  List<CaseEntity> call({
    required List<CaseEntity> cases,
    required String search,
  }) {
    return cases
        .where(
          (element) => element.country != null
              ? element.country!.startsWith(search)
              : false,
        )
        .toList();
  }
}
