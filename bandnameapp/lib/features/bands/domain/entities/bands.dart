import 'package:equatable/equatable.dart';

class Bands extends Equatable {
  final String id;
  final String name;
  final int votes;

  const Bands({
    required this.id,
    required this.name,
    required this.votes,
  });

  @override
  List<Object?> get props => [id, name, votes];
}
