part of 'data_product_bloc.dart';

abstract class DataProductState extends Equatable {
  const DataProductState();

  @override
  List<Object> get props => [];
}

class DataProductInitial extends DataProductState {}

class DataProductLoading extends DataProductState {}

class DataProductFailed extends DataProductState {
  final String e;
  const DataProductFailed(this.e);
}

class DataProductSuccess extends DataProductState {
  final List<DataProductModel> dataProduct;
  const DataProductSuccess(this.dataProduct);
}
