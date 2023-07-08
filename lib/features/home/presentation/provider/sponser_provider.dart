import 'package:dartz/dartz.dart';
import 'package:first_assignment/core/error/failure.dart';
import 'package:first_assignment/core/use_cases/use_case.dart';
import 'package:first_assignment/features/home/domain/entities/sponser_entities.dart';
import 'package:first_assignment/features/home/domain/use_cases/get_sponsers_use_case.dart';
import 'package:flutter/material.dart';

class SponserProvider extends ChangeNotifier {
  SponserProvider({required GetSponsersUseCase getSponsersUseCase})
      : _getSponsersUseCase = getSponsersUseCase;

  final GetSponsersUseCase _getSponsersUseCase;
  SponserEntity? _sponserEntities;
  String _errorMessage = '';

  String get errorMessage => _errorMessage;
  SponserEntity? get sponserEntity => _sponserEntities;

  Future<void> getSponser() async {
    final Either<Failure, SponserEntity> failureOrSponserEntity =
        await _getSponsersUseCase(NoParams());

    failureOrSponserEntity.fold(
      (faliure) => _errorMessage = faliure.message,
      (sponserEntities) => _sponserEntities = sponserEntities,
    );
    notifyListeners();
  }
}
