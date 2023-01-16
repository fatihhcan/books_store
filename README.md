# Books Store

Online book shop application.

# Viedeos


https://user-images.githubusercontent.com/45641833/212577470-b9a4172a-775a-4cc3-b1e3-e7d2944048eb.mp4

https://user-images.githubusercontent.com/45641833/212577492-4af850e1-a59f-49c3-8e6b-5d1371c8d0b9.mov



# Subject

- BLoC/Cubit was used for State Management.
- Dio was used for API requests.
- Equatable was used to check if your objects are equal.
- JSON serializable/annotation was used for automatically generate code.
- SharedPrefs was used for the caching process.
- Screen Util adapting screen and font size.

# Tasks 📋

## Splash Screen - 1/6 
Waiting for 3 seconds. Token control and routing are being performed.
**splash_cubit.dart**
```dart

  Future<void> routeDelayLogin() async {
    Future.delayed(const Duration(seconds: 3), () {
      //route
      if (SharedPrefs.getToken.isNotEmpty) {
         navigation.navigateToPage(path: NavigationConstants.HOME_VIEW);
      } else {
         navigation.navigateToPage(path: NavigationConstants.LOGIN_VIEW);
      } 
    });
  }

```

## Login - 2/6 

Email validations are being performed. The password is between 6-20 Decimals and alphanumeric.
If Remember Me is selected, the token is registered. 

**reqex.dart**

```dart
String? validateEmail(String? value) {
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);

  return value!.isNotEmpty && !regex.hasMatch(value)
      ? 'Enter a valid email address'
      : null;
}

String? validatePassword(String? value) {
  const pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,20}$';
  final regex = RegExp(pattern);

  return value!.isNotEmpty && !regex.hasMatch(value)
      ? 'Enter a valid password'
      : null;
} 
```

**auth_cubit.dart**

```dart
  Future<void> login(String email, String password) async {
    loginLoading(true);

    if (email.isNotEmpty && password.isNotEmpty) {
      await authService.fetchAccessToken(email, password);
      await navigationHome();
    } else {
      customShowAlertDialog(context!);
    }

    loginLoading(false);
  }

    navigationHome() {
    if (AppStateManager.instance.accessToken.isNotEmpty) {
      navigation.navigateToPage(path: NavigationConstants.HOME_VIEW);
      if (state.rememberMe) {
        SharedPrefs.setToken(AppStateManager.instance.accessToken);
      }
    } else {
      navigation.navigateToPage(path: NavigationConstants.LOGIN_VIEW);
    }
  }
```

**auth_service.dart**

```dart
  @override
  Future<LoginModel?> fetchAccessToken(String email, String password) async {
    try {
      final response = await client.post(NetWorkRoutes.TOKEN.value,
          options: Options(headers: {
            'Content-Type': 'application/json',
          }),
          data: RequestLoginModel(email: email, password: password).toJson());
      final LoginModel? result =
          ResponseParser<LoginModel>(response: response['action_login'])
              .fromMap(model: LoginModel());
      //save token into appstate

      AppStateManager.instance.accessToken = result?.token ?? '';
      return result;
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
    }
  }
```

## Register - 3/6 

Redirect to the home page after registration. Redirect to the login screen when logged in again.

**auth_cubit.dart**

```dart
  Future<void> register(String email, String name, String password) async {
    registerLoading(true);
    if (email.isNotEmpty && password.isNotEmpty && name.isNotEmpty) {
      await authService.fetchRegister(email, name, password);
      navigationRegisterToHome();
    } else {
      customShowAlertDialog(context!);
    }
    registerLoading(false);
  }
```

**auth_service.dart**

```dart
  @override
  Future<RegisterModel?> fetchRegister(
      String email, String name, String password) async {
    try {
      final response = await client.post(NetWorkRoutes.REGISTER.value,
          options: Options(headers: {
            'Content-Type': 'application/json',
          }),
          data:
              RequestRegisterModel(email: email, name: name, password: password)
                  .toJson());
      final RegisterModel? result =
          ResponseParser<RegisterModel>(response: response['action_register'])
              .fromMap(model: RegisterModel());
      SharedPrefs.setUserId(result!.id!);
      return result;
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
    }
  }
```

## Home Page - 4/6 

The products from the API are listed. When you click on the product, it goes to the product details.

**home_service.dart**

```dart
@override
  Future<List<CategoriesModel?>> fetchCategories() async {
    try {
      final response = await client.get(NetWorkRoutes.CATEGORIES.value,
          options: Options(headers: {
            'Content-Type': 'application/json',
          }));
      final List<CategoriesModel> result =
          ResponseParser<CategoriesModel>(response: response['category'])
              .fromList(model: CategoriesModel());

      AppStateManager.instance.categories = result;
      return result;
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
    }
  }

@override
  Future<List<ProductsModel?>> fetchProducts(String categoryId) async {
    try {
      final response =
          await client.get('${NetWorkRoutes.PRODUCT.value}/$categoryId',
              options: Options(headers: {
                'Content-Type': 'application/json',
              }));
      final List<ProductsModel> result =
          ResponseParser<ProductsModel>(response: response['product'])
              .fromList(model: ProductsModel());

      AppStateManager.instance.products = result;
      return result;
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
    }
  }

@override
  Future<ImageModel?> fetchImage(String fileName) async {
    try {
      final response = await client.post(NetWorkRoutes.IMAGE.value,
          options: Options(headers: {
            'Content-Type': 'application/json',
          }),
          data: RequestImageModel(
            fileName: fileName,
          ).toJson());
      final ImageModel? result =
          ResponseParser<ImageModel>(response: response['action_product_image'])
              .fromMap(model: ImageModel());

      AppStateManager.instance.image = result;
      return result;
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
    }
  }
```
## Products by Category Page - 5/6 

Products are listed by category. When you click on the product, it goes to the product details.

**arguments_products.dart**

```dart
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

```
**home_view.dart**
```dart
   GestureDetector(
     onTap: () => cubit.navigateProducts(cubit.categoriesList[index].id, cubit.categoriesList[index].name, context), 
    child: Text(TextConstants.viewAll, style: context.textTheme.subtitle1!.copyWith(color: context.appColors.burntSienna),)
),
```

## Products Detail Page - 6/6

The selected product information is shown. Favorite additions and subtractions are performed.

**product_service.dart**
```dart
  @override
  Future<RequestLikeModel?> fetchLike(int? userId, int? productId) async {
    try {
      final response = await client.post(NetWorkRoutes.LIKE.value,
          options: Options(headers: {
            'Content-Type': 'application/json',
          }),
          data:  RequestLikeModel(
                  userId: userId,
                  productId: productId)
              .toJson()
          );
      final RequestLikeModel? result =
          ResponseParser<RequestLikeModel>(response: response).fromMap(model: RequestLikeModel());
      
      //AppStateManager.instance.image = result ;
      return result;
      
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
    }
  }

  @override
  Future<RequestLikeModel?> fetchUnLike(int? userId, int? productId) async {
    try {
      final response = await client.post(NetWorkRoutes.UNLIKE.value,
          options: Options(headers: {
            'Content-Type': 'application/json',
          }),
          data:  RequestLikeModel(
                  userId: userId,
                  productId: productId)
              .toJson()
          );
      final RequestLikeModel? result =
          ResponseParser<RequestLikeModel>(response: response).fromMap(model: RequestLikeModel());
      
      //AppStateManager.instance.image = result ;
      return result;
      
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
    }
  }
```
**product_cubit.dart**
```dart
  favoriteToggleFetch(int? userId, int? productId) async {
    if (state.favoriteButton) {
     await fetchLike(userId, productId);
    } else {
      await fetchUnLike(userId, productId);
    }
  }
```

# Folder Structure

```
books_store_app
│   
└───lib
    │
    └───core
    │    │    
    │    └───base
    │    │
    │    └───components
    │    │    
    │    └───constants
    │    │
    │    └───extensions
    │    │
    │    └───init
    │    │
    │    └───utility
    └───features
         └───auth
         └───home
         └───product
         └───splash
```
