import '../../../../core/api/api_client.dart';
import '../../../../core/api/api_endpoints.dart';
import '../../domain/entities/sign_up_req.dart';
import '../model/sign_in_response.dart';
import '../model/sign_up_response.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSourceImpl(this.apiClient);

  @override
  Future<SignInResponse> signIn({
    required String email,
    required String password,
  }) async {
    final SignInResponse response = await apiClient
        .handleRequest<SignInResponse>(
          httpMethod: HttpMethod.post,
          endpoint: ApiEndpoints.login,
          fromJson: SignInResponse.fromJson,
          data: <String, String>{
            'email': email,
            'password': password,
          },
        );
    return response;
  }

  @override
  Future<SignUpResponse> signUp({required SignUpReq signUpReq}) async {
    final SignUpResponse response = await apiClient
        .handleRequest<SignUpResponse>(
          httpMethod: HttpMethod.post,
          endpoint: ApiEndpoints.login,
          fromJson: SignUpResponse.fromJson,
          data: signUpReq.toJson(),
        );
    return response;
  }

  @override
  Future<void> logout() async {
    await apiClient.handleRequest<void>(
      httpMethod: HttpMethod.post,
      endpoint: ApiEndpoints.logout,
    );
  }
}
