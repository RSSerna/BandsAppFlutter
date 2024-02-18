import 'package:fpdart/fpdart.dart';
import 'package:bandnameapp/core/errors/failures.dart';
import 'package:bandnameapp/core/usecase/usecase.dart';
import 'package:bandnameapp/features/bands/domain/repositories/bands_repository.dart';

class DeleteBand implements UseCase<bool, String> {
  final BandsRepository repository;

  DeleteBand({required this.repository});

  @override
  Either<Failure, bool> call(String params) {
    return repository.deleteBand(params);
  }
}
