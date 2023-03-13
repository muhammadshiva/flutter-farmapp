part of 'fetch_data_products_cubit.dart';

abstract class FetchDataProductsState extends Equatable {
  const FetchDataProductsState();

  @override
  List<Object> get props => [];
}

class FetchDataProductsInitial extends FetchDataProductsState {}

class FetchDataProductsLoading extends FetchDataProductsState {}

class FetchDataProductsSuccess extends FetchDataProductsState {
  FetchDataProductsSuccess(this.data);

  final List<DataProduct> data;

  @override
  List<Object> get props => [data];
}

class FetchDataProductsFailure extends FetchDataProductsState {

  final String? message;

  FetchDataProductsFailure({this.message});

  FetchDataProductsFailure.network(String message)
      : this(message: message);

  FetchDataProductsFailure.general(String message)
      : this(message: message);

  @override
  List<Object> get props => [message ?? "terjadi kesalahan"];
}

