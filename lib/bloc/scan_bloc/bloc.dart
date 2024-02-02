import 'package:checkout/bloc/scan_bloc/event.dart';
import 'package:checkout/bloc/scan_bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  ScanBloc(this.productRepository) : super(ScanInitial()) {
    on<ScanButtonPressed>(_scanButtonPressed);
    on<FetchProduct>(_fetchProduct);
  }
}
