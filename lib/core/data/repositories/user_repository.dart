import 'package:dartz/dartz.dart';
import 'package:quiz/core/data/models/apis/login_model.dart';
import 'package:quiz/core/data/models/apis/profile_model.dart';
import 'package:quiz/core/data/models/apis/register_model.dart';
import 'package:quiz/core/data/models/common_response.dart';
import 'package:quiz/core/data/network/endpoints/user_endpoints.dart';
import 'package:quiz/core/data/network/network_config.dart';
import 'package:quiz/core/enums/request_type.dart';
import 'package:quiz/core/utils/network_util.dart';

class UserRepository {
  Future<Either<String, LoginModel>> login({
    required String name,
    required String code,
  }) async {
    try {
      return NetworkUtil.sendMultipartRequest(
        type: RequestType.POST,
        url: UserEndPoints.login,
        fields: {
          'username': name,
          'code': code,
        },
        headers: NetworkConfig.getHeaders(needAuth: false, isMultipartRequest: true),
      ).then((response) {
        if(response==null){return Left("No Internet Connectioin");}
        CommonResponse<Map<String, dynamic>> commonResponse =
        CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(LoginModel.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, ResisterModel>> register({
    required String username,
    required String phone,
    required String collage_name,
  }) async {
    try {
      return NetworkUtil.sendMultipartRequest(
        type: RequestType.POST,
        url: UserEndPoints.register,
        fields: {
          'username': username,
          'phone': phone,
          'collage_name': collage_name,
        },
        headers: NetworkConfig.getHeaders(needAuth: false, isMultipartRequest: true),
      ).then((response) {
        if(response==null){return Left("No Internet Connectioin");}
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(ResisterModel.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }


  Future<Either<String, ProfileModel>> showProfile() async {
    try {
      return NetworkUtil.sendMultipartRequest(
        type: RequestType.POST,
        url: UserEndPoints.profile,

        headers: NetworkConfig.getHeaders(needAuth: true, isMultipartRequest: true),
      ).then((response) {
        if(response==null){return Left("No Internet Connection");}
        CommonResponse<Map<String, dynamic>> commonResponse =
        CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(ProfileModel.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

}
