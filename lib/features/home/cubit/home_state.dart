part of 'home_cubit.dart';

class HomeState {
  final bool categoriesLoading;
  final bool productsLoading;
  final bool imageLoading;


  const HomeState({this.categoriesLoading = false, this.productsLoading = false, this.imageLoading = false});
  @override
  List<Object?> get props => [categoriesLoading, productsLoading, imageLoading];

  HomeState copyWith({
    bool? categoriesLoading,
    bool? productsLoading,
    bool? imageLoading,
  }) {
    return HomeState(
      categoriesLoading: categoriesLoading ?? this.categoriesLoading,
      productsLoading: productsLoading ?? this.productsLoading,
      imageLoading: imageLoading ?? this.imageLoading,
    );
  }
}
