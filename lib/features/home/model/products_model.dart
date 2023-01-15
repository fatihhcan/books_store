import 'package:json_annotation/json_annotation.dart';
import '../../../core/base/model/base_model.dart';

part 'products_model.g.dart';

@JsonSerializable()

class ProductsModel  extends BaseModel<ProductsModel>{
    String? author;
    String? cover;
    DateTime? createdAt;
    String? description;
    int? id;
    String? name;
    double? price;
    int? sales;
    String? slug;
    ProductsModel({
        this.author,
        this.cover,
        this.createdAt,
        this.description,
        this.id,
        this.name,
        this.price,
        this.sales,
        this.slug,
    });

   factory ProductsModel.fromJson(Map<String, dynamic> json) => _$ProductsModelFromJson(json);
    
    @override
    ProductsModel fromJson(Map<String, dynamic> json) {
    return _$ProductsModelFromJson(json);
    }

    @override
    Map<String, dynamic> toJson() {
    return _$ProductsModelToJson(this);
    }
}



