import 'package:json_annotation/json_annotation.dart';

part 'request_register_model.g.dart';

@JsonSerializable()

class RequestRegisterModel {
    RequestRegisterModel({
        this.email,
        this.name,
        this.password,
    });

    String? email;
    String? name;
    String? password;

    factory RequestRegisterModel.fromJson(Map<String, dynamic> json) => _$RequestRegisterModelFromJson(json);
    
    @override
    RequestRegisterModel fromJson(Map<String, dynamic> json) {
    return _$RequestRegisterModelFromJson(json);
    }

    @override
    Map<String, dynamic> toJson() {
    return _$RequestRegisterModelToJson(this);
    }
}
