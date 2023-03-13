part of 'data_product_bloc.dart';

abstract class DataProductEvent extends Equatable {
  const DataProductEvent();

  @override
  List<Object> get props => [];
}

class DataProductGet extends DataProductEvent {}
