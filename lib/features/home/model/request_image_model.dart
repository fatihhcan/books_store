import 'package:json_annotation/json_annotation.dart';

part 'request_image_model.g.dart';

@JsonSerializable()

class RequestImageModel {
    String? fileName;
    RequestImageModel({
        this.fileName,
    });



    factory RequestImageModel.fromJson(Map<String, dynamic> json) => _$RequestImageModelFromJson(json);
    
    @override
    RequestImageModel fromJson(Map<String, dynamic> json) {
    return _$RequestImageModelFromJson(json);
    }

    @override
    Map<String, dynamic> toJson() {
    return _$RequestImageModelToJson(this);
    }
}
