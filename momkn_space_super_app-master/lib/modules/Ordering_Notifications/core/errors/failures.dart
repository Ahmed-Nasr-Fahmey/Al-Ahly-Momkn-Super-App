import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;

  const Failure({required this.message});
  @override
  List<Object?> get props => [];
}

//Here goes the implemenation of the different failures possible, eg: Server failure
