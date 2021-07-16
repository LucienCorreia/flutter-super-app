import 'package:equatable/equatable.dart';

import '../../../../../../../../domain/entities/covid/case_entity.dart';

abstract class CasesBlocState extends Equatable {
  const CasesBlocState();
}

class CasesBlocStateLoading extends CasesBlocState {
  const CasesBlocStateLoading();

  @override
  List<Object?> get props => [];
}

class CasesBlocStateLoaded extends CasesBlocState {
  final List<CaseEntity> cases;

  const CasesBlocStateLoaded(this.cases);

  @override
  List<Object?> get props => [
        cases,
      ];
}

class CasesBlocStateFailure extends CasesBlocState {
  final Exception failure;

  const CasesBlocStateFailure(this.failure);

  @override
  List<Object?> get props => [
        failure,
      ];
}
