import 'package:fpdart/fpdart.dart';
import 'package:bandnameapp/core/errors/exceptions.dart';
import 'package:bandnameapp/core/errors/failures.dart';
import 'package:bandnameapp/features/bands/data/datasources/bands_remote_data_source.dart';
import 'package:bandnameapp/features/bands/domain/repositories/bands_repository.dart';

class BandsRepositoryImpl extends BandsRepository {
  final BandsRemoteDataSource bandsRemoteDataSource;

  BandsRepositoryImpl({
    required this.bandsRemoteDataSource,
  });

  @override
  Either<Failure, bool> addBand(String bandName) {
    try {
      return Right(bandsRemoteDataSource.addBand(bandName));
    } on SocketException {
      return Left(SocketFailure());
    }
  }

  @override
  Either<Failure, bool> deleteBand(String id) {
    try {
      return Right(bandsRemoteDataSource.deleteBand(id));
    } on SocketException {
      return Left(SocketFailure());
    }
  }

  @override
  Either<Failure, bool> voteBand(String id) {
    try {
      return Right(bandsRemoteDataSource.voteBand(id));
    } on SocketException {
      return Left(SocketFailure());
    }
  }
}
