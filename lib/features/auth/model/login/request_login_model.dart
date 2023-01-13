import 'package:json_annotation/json_annotation.dart';

part 'request_login_model.g.dart';

@JsonSerializable()

class RequestLoginModel {
    String? email;
    String? password;

    RequestLoginModel({
        this.email,
        this.password,
    });



    factory RequestLoginModel.fromJson(Map<String, dynamic> json) => _$RequestLoginModelFromJson(json);
    
    @override
    RequestLoginModel fromJson(Map<String, dynamic> json) {
    return _$RequestLoginModelFromJson(json);
    }

    @override
    Map<String, dynamic> toJson() {
    return _$RequestLoginModelToJson(this);
    }
}
