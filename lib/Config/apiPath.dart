class ApiPaths {
  // static const String baseUrl = 'http://www.google.com:81/';
  static const String baseUrl = "http://localhost:3001";


//auth
  static const String login = '/auth/login';
  static const String register = '/auth/register';

//home
  static const String houses = '/houses';


//Detail
static const String detail = '/detail';




  static const String logout = '/v1/auth/logout';
  static const String refreshToken = '/v1/auth/refresh';
  static const String resetPassword = '/v1/auth/reset-password';
  static const String verifyPassword = '/v1/auth/verify-password';
  static const String news = '/v1/app-setting/news';
  
}

