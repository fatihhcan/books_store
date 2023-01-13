import 'package:json_annotation/json_annotation.dart';

import '../../../../core/base/model/base_model.dart';


part 'login_model.g.dart';

@JsonSerializable()


class LoginModel extends BaseModel<LoginModel>  {
    String? message;
    String? token;

    LoginModel({
        this.message,
        this.token,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);
    
    @override
    LoginModel fromJson(Map<String, dynamic> json) {
    return _$LoginModelFromJson(json);
    }

    @override
    Map<String, dynamic> toJson() {
    return _$LoginModelToJson(this);
    }
}
