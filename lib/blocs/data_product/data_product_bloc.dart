import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:rphu_application/models/data_product_model.dart';
import 'package:rphu_application/services/data_product_service.dart';

part 'data_product_event.dart';
part 'data_product_state.dart';

class DataProductBloc extends Bloc<DataProductEvent, DataProductState> {
  DataProductBloc() : super(DataProductInitial()) {
    on<DataProductEvent>((event, emit) async {
      if (event is DataProductGet) {
        try {
          emit(DataProductLoading());

          final dataProduct = await DataProductService().getDataProducts();

          emit(DataProductSuccess(dataProduct));
        } catch (e) {
          emit(DataProductFailed(e.toString()));
        }
      }
    });
  }
}
