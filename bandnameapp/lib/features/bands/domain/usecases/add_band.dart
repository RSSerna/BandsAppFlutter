import 'package:fpdart/fpdart.dart';
import 'package:bandnameapp/core/errors/failures.dart';
import 'package:bandnameapp/core/usecase/usecase.dart';
import 'package:bandnameapp/features/bands/domain/repositories/bands_repository.dart';

class AddBand implements UseCase<bool, String> {
  final BandsRepository repository;

  AddBand({required this.repository});

  @override
  Either<Failure, bool> call(String params) {
    return repository.addBand(params);
  }
}
