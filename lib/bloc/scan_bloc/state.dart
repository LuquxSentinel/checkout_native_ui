import 'package:equatable/equatable.dart';

import '../../models/product.dart';

class ScanState extends Equatable {
  const ScanState();

  @override
  List<Object?> get props => [];
}

class ScanInitialState extends ScanState {}

class ScanFailedState extends ScanState {
  final String error;

  const ScanFailedState(this.error);

  @override
  List<Object?> get props => [error];
}

class ScanningProductState extends ScanState {}

class ScanSuccessfulState extends ScanState {
  final Product product;

  const ScanSuccessfulState({required this.product});

  @override
  List<Object?> get props => [product];
}
