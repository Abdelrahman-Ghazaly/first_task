import 'package:dartz/dartz.dart';
import 'package:first_assignment/core/error/failure.dart';
import 'package:first_assignment/core/use_cases/use_case.dart';
import 'package:first_assignment/features/home/domain/entities/sponser_entities.dart';
import 'package:first_assignment/features/home/domain/repositories/home_repository.dart';

class GetSponsersUseCase implements UseCase<SponserEntity, NoParams> {
  GetSponsersUseCase({required this.repository});

  final HomeRepository repository;

  @override
  Future<Either<Failure, SponserEntity>> call(NoParams params) {
    return repository.getSponsers();
  }
}
