import 'package:json_annotation/json_annotation.dart';

import '../../../../core/base/model/base_model.dart';


part 'request_like_model.g.dart';

@JsonSerializable()
class RequestLikeModel extends BaseModel<RequestLikeModel>{

    int? userId;
    int? productId;

    RequestLikeModel({
        this.userId,
        this.productId,
    });


    factory RequestLikeModel.fromJson(Map<String, dynamic> json) => _$RequestLikeModelFromJson(json);
    
    @override
    RequestLikeModel fromJson(Map<String, dynamic> json) {
    return _$RequestLikeModelFromJson(json);
    }

    @override
    Map<String, dynamic> toJson() {
    return _$RequestLikeModelToJson(this);
    }
}
