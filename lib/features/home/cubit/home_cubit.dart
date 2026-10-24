import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../services/home_service.dart';
import '../models/product_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}
class HomeLoaded extends HomeState {
  final List<ProductModel> products;
  HomeLoaded(this.products);
}
class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void fetchProducts() async {
    emit(HomeLoading());
    try {
      final products = await HomeService().getProducts();
      emit(HomeLoaded(products));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}