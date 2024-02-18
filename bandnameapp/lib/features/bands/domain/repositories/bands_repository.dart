import 'package:bandnameapp/core/errors/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract class BandsRepository {
  Either<Failure, bool> addBand(String bandName);
  Either<Failure, bool> deleteBand(String id);
  Either<Failure, bool> voteBand(String id);
}
