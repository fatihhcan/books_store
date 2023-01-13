import 'package:json_annotation/json_annotation.dart';

import '../../../../core/base/model/base_model.dart';


part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel extends BaseModel<RegisterModel> {
    String? email;
    int? id;
    String? name;
    DateTime? createdAt;

    RegisterModel({
        this.email,
        this.id,
        this.name,
        this.createdAt,
    });

    factory RegisterModel.fromJson(Map<String, dynamic> json) => _$RegisterModelFromJson(json);
    
    @override
    RegisterModel fromJson(Map<String, dynamic> json) {
    return _$RegisterModelFromJson(json);
    }

    @override
    Map<String, dynamic> toJson() {
    return _$RegisterModelToJson(this);
    }
}
