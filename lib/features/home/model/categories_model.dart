import 'package:json_annotation/json_annotation.dart';

import '../../../../core/base/model/base_model.dart';


part 'categories_model.g.dart';

@JsonSerializable()


class CategoriesModel extends BaseModel<CategoriesModel> {
    int? id;
    String? name;
    DateTime? createdAt;

    CategoriesModel({
        this.id,
        this.name,
        this.createdAt,
    });


    factory CategoriesModel.fromJson(Map<String, dynamic> json) => _$CategoriesModelFromJson(json);
    
    @override
    CategoriesModel fromJson(Map<String, dynamic> json) {
    return _$CategoriesModelFromJson(json);
    }

    @override
    Map<String, dynamic> toJson() {
    return _$CategoriesModelToJson(this);
    }
}
