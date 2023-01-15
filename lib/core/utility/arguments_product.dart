class ProductsArguments {
  final int? categoryId;
  final String? categoryName;
  ProductsArguments({
    this.categoryId,
    this.categoryName
  });
}

class ProductDetailArguments {
  final String? productName;
  final String? imgURL;
  final String? bookTitle;
  final String? bookAuthor;
  final String? bookPrice;
  final String? bookDescription;
  final int? bookId;
  ProductDetailArguments({
    this.productName,
    this.imgURL,
    this.bookTitle,
    this.bookAuthor,
    this.bookPrice,
    this.bookDescription,
    this.bookId
  });
}
