part of 'product_cubit.dart';

class ProductState {
  final bool categoriesLoading;
  final bool productsLoading;
  final bool imageLoading;


  const ProductState({this.categoriesLoading = false, this.productsLoading = false, this.imageLoading = false});
  @override
  List<Object?> get props => [categoriesLoading, productsLoading, imageLoading];

  ProductState copyWith({
    bool? categoriesLoading,
    bool? productsLoading,
    bool? imageLoading,
  }) {
    return ProductState(
      categoriesLoading: categoriesLoading ?? this.categoriesLoading,
      productsLoading: productsLoading ?? this.productsLoading,
      imageLoading: imageLoading ?? this.imageLoading,
    );
  }
}
