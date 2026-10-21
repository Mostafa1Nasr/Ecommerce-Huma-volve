import 'package:dio/dio.dart';

class AuthService {
  // تعريف الـ Dio مع الـ Base URL بتاع الـ API
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://api.escuelajs.co/api/v1'));

  // دالة تسجيل الدخول (Login)
  Future<bool> login({required String email, required String password}) async {
    try {
      final response = await _dio.post('/auth/login', data: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 201 || response.statusCode == 200) {
        // الـ API ده بيرجع access_token لما الـ login ينجح
        print('Login Success! Token: ${response.data['access_token']}');
        return true;
      }
      return false;
    } catch (e) {
      print('Login Error: $e');
      return false;
    }
  }

  // دالة إنشاء حساب جديد (Register)
  Future<bool> register({required String name, required String email, required String password}) async {
    try {
      final response = await _dio.post('/users/', data: {
        'name': name,
        'email': email,
        'password': password,
        'avatar': 'https://picsum.photos/800', // الـ API ده بيطلب صورة إجبارية، فحطينا لينك صورة عشوائية
      });

      if (response.statusCode == 201 || response.statusCode == 200) {
        print('Registration Success!');
        return true;
      }
      return false;
    } catch (e) {
      print('Registration Error: $e');
      return false;
    }
  }
}