import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rphu_application/models/data_product_model.dart';
import 'package:rphu_application/services/data_product_service.dart';

part 'fetch_data_products_state.dart';

class FetchDataProductsCubit extends Cubit<FetchDataProductsState> {
  FetchDataProductsCubit() : super(FetchDataProductsInitial());

  final DataProductService repo = DataProductService();

  void load() async {
    emit(FetchDataProductsLoading());
    try {
      final response = await repo.fetchDataProducts();
      emit(FetchDataProductsSuccess(response.result.data));
    } catch (error) {
      emit(FetchDataProductsFailure.general(error.toString()));
    }
  }

  void loadByRphuId({required int rphuId}) async {
    emit(FetchDataProductsLoading());
    try {
      final response = await repo.fetchDataProductsDetail(rphuId: rphuId);
      emit(FetchDataProductsSuccess(response.result.data));
    } catch (error) {
      emit(FetchDataProductsFailure.general(error.toString()));
    }
  }
}
