import 'package:dartz/dartz.dart';
import 'package:first_assignment/features/home/domain/entities/sponser_entities.dart';
import 'package:first_assignment/features/home/domain/use_cases/get_sponsers_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/use_cases/use_case.dart';

part 'sponser_state.dart';

class SponserCubit extends Cubit<SponserState> {
  SponserCubit({required GetSponsersUseCase getSponsersUseCase})
      : _getSponsersUseCase = getSponsersUseCase,
        super(const InitialState(isLoading: false));

  final GetSponsersUseCase _getSponsersUseCase;

  getSponser() async {
    emit(const InitialState(isLoading: true));
    final failureOrSuccess = await _getSponsersUseCase(NoParams());
    emit(await _failureOrSuccess(failureOrSuccess));
  }
}

Future<SponserState> _failureOrSuccess(
    Either<Failure, SponserEntity> failureOrSuccess) async {
  return failureOrSuccess.fold(
    (failure) => Error(message: failure.message),
    (sponserEntity) => Success(sponserEntity: sponserEntity),
  );
}
