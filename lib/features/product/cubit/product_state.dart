part of 'product_cubit.dart';

class ProductState {
  final bool productsLoading;
  final bool likeLoading;
  final bool unLikeLoading;
  final bool favoriteButton;

  const ProductState(
      {this.productsLoading = false,
      this.likeLoading = false,
      this.unLikeLoading = false,
      this.favoriteButton = false
      });
  @override
  List<Object?> get props => [productsLoading, likeLoading, unLikeLoading, favoriteButton];

  ProductState copyWith({
    bool? productsLoading,
    bool? likeLoading,
    bool? unLikeLoading,
    bool? favoriteButton,
  }) {
    return ProductState(
      productsLoading: productsLoading ?? this.productsLoading,
      likeLoading: likeLoading ?? this.likeLoading,
      unLikeLoading: unLikeLoading ?? this.unLikeLoading,
      favoriteButton: favoriteButton ?? this.favoriteButton,
    );
  }
}
