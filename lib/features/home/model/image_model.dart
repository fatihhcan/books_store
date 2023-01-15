import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/model/base_model.dart';

part 'image_model.g.dart';

@JsonSerializable()

class ImageModel extends BaseModel<ImageModel>{
    String? url;
    ImageModel({
        this.url,
    });

 

factory ImageModel.fromJson(Map<String, dynamic> json) => _$ImageModelFromJson(json);
    
    @override
    ImageModel fromJson(Map<String, dynamic> json) {
    return _$ImageModelFromJson(json);
    }

    @override
    Map<String, dynamic> toJson() {
    return _$ImageModelToJson(this);
    }
}
