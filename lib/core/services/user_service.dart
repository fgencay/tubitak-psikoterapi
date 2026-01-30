/// Kullanıcı bilgilerini tutan basit service
class UserService {
  static final UserService _instance = UserService._internal();
  
  factory UserService() {
    return _instance;
  }
  
  UserService._internal();
  
  String? _userName;
  
  /// Kullanıcı adını kaydet
  void setUserName(String name) {
    _userName = name;
  }
  
  /// Kullanıcı adını al
  String getUserName() {
    return _userName ?? 'Kullanıcı';
  }
  
  /// Kullanıcı adı var mı kontrol et
  bool hasUserName() {
    return _userName != null && _userName!.isNotEmpty;
  }
}
