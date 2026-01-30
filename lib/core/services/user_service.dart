/// Kullanıcı bilgilerini tutan basit service
class UserService {
  static final UserService _instance = UserService._internal();
  
  factory UserService() {
    return _instance;
  }
  
  UserService._internal();
  
  String? _userName;
  String? _profileImagePath;
  int? _selectedAvatarIndex;
  String? _pronouns;
  DateTime? _birthday;
  String? _email;
  String? _phone;
  bool _isEmailVerified = false;
  bool _isPhoneVerified = false;
  
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
  
  /// Profil resmi yolunu kaydet
  void setProfileImage(String? path) {
    _profileImagePath = path;
    if (path != null) {
      _selectedAvatarIndex = null; // Avatar seçiliyse temizle
    }
  }
  
  /// Profil resmi yolunu al
  String? getProfileImage() {
    return _profileImagePath;
  }
  
  /// Avatar index kaydet
  void setAvatarIndex(int? index) {
    _selectedAvatarIndex = index;
    if (index != null) {
      _profileImagePath = null; // Profil resmi seçiliyse temizle
    }
  }
  
  /// Avatar index al
  int? getAvatarIndex() {
    return _selectedAvatarIndex;
  }
  
  /// Profil resmini temizle
  void clearProfileImage() {
    _profileImagePath = null;
    _selectedAvatarIndex = null;
  }
  
  /// Pronouns kaydet
  void setPronouns(String? pronouns) {
    _pronouns = pronouns;
  }
  
  /// Pronouns al
  String? getPronouns() {
    return _pronouns;
  }
  
  /// Doğum tarihi kaydet
  void setBirthday(DateTime? birthday) {
    _birthday = birthday;
  }
  
  /// Doğum tarihi al
  DateTime? getBirthday() {
    return _birthday;
  }
  
  /// E-posta kaydet
  void setEmail(String? email, {bool verified = false}) {
    _email = email;
    _isEmailVerified = verified;
  }
  
  /// E-posta al
  String? getEmail() {
    return _email;
  }
  
  /// Email doğrulandı olarak işaretle
  void verifyEmail() {
    _isEmailVerified = true;
  }
  
  /// Email doğrulanmış mı kontrol et
  bool isEmailVerified() {
    return _isEmailVerified;
  }
  
  /// Telefon kaydet
  void setPhone(String? phone, {bool verified = false}) {
    _phone = phone;
    _isPhoneVerified = verified;
  }
  
  /// Telefon al
  String? getPhone() {
    return _phone;
  }
  
  /// Telefon doğrulandı olarak işaretle
  void verifyPhone() {
    _isPhoneVerified = true;
  }
  
  /// Telefon doğrulanmış mı kontrol et
  bool isPhoneVerified() {
    return _isPhoneVerified;
  }
  
  /// Tüm kullanıcı bilgilerini temizle (çıkış yap / hesap sil)
  void clearAll() {
    _userName = null;
    _profileImagePath = null;
    _selectedAvatarIndex = null;
    _pronouns = null;
    _birthday = null;
    _email = null;
    _phone = null;
    _isEmailVerified = false;
    _isPhoneVerified = false;
  }
}
