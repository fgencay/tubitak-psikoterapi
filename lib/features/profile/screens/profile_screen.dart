import 'dart:io';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/services/user_service.dart';
import '../widgets/avatar_selector_dialog.dart';
import '../../auth/screens/get_started_screen.dart';

/// Profil ekranı - Kullanıcı profili ve ayarlar
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final UserService _userService = UserService();

  void _showImageOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.textSecondary.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              
              const SizedBox(height: 24),
              
              _buildOptionTile(
                icon: Icons.photo_library_rounded,
                title: 'Galeriden Seç',
                onTap: () {
                  Navigator.pop(context);
                  _pickFromGallery();
                },
              ),
              
              _buildOptionTile(
                icon: Icons.emoji_emotions_rounded,
                title: 'Avatar Seç',
                onTap: () {
                  Navigator.pop(context);
                  _showAvatarSelector();
                },
              ),
              
              if (_userService.getProfileImage() != null ||
                  _userService.getAvatarIndex() != null)
                _buildOptionTile(
                  icon: Icons.delete_outline_rounded,
                  title: 'Profil Resmini Kaldır',
                  onTap: () {
                    Navigator.pop(context);
                    _removeProfileImage();
                  },
                  isDestructive: true,
                ),
              
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: isDestructive
                    ? AppColors.error.withOpacity(0.1)
                    : AppColors.textPrimary.withOpacity(0.08),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Icon(
                icon,
                color: isDestructive ? AppColors.error : AppColors.textPrimary,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isDestructive ? AppColors.error : AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _pickFromGallery() {
    // TODO: Image picker entegrasyonu
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Galeri özelliği yakında eklenecek'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showAvatarSelector() {
    showDialog(
      context: context,
      builder: (context) => AvatarSelectorDialog(
        selectedIndex: _userService.getAvatarIndex(),
        onAvatarSelected: (index) {
          setState(() {
            _userService.setAvatarIndex(index);
          });
        },
      ),
    );
  }

  void _removeProfileImage() {
    setState(() {
      _userService.clearProfileImage();
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profil resmi kaldırıldı'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _handleEmailEdit() {
    final currentEmail = _userService.getEmail();
    final isVerified = _userService.isEmailVerified();
    
    if (currentEmail != null && !isVerified) {
      // Email var ama doğrulanmamış, doğrulama kodu gönder
      _showVerificationCodeDialog(currentEmail, isEmail: true);
    } else if (currentEmail != null && isVerified) {
      // Email var ve doğrulanmış, tekrar doğrulama sorgusu
      _showEmailVerificationDialog(currentEmail);
    } else {
      // Email yok, email ekle
      _showEmailInputDialog();
    }
  }
  
  void _handlePhoneEdit() {
    final currentPhone = _userService.getPhone();
    final isVerified = _userService.isPhoneVerified();
    
    if (currentPhone != null && !isVerified) {
      // Telefon var ama doğrulanmamış, doğrulama kodu gönder
      _showVerificationCodeDialog(currentPhone, isEmail: false);
    } else if (currentPhone != null && isVerified) {
      // Telefon var ve doğrulanmış, tekrar doğrulama sorgusu
      _showPhoneVerificationDialog(currentPhone);
    } else {
      // Telefon yok, telefon ekle
      _showPhoneInputDialog();
    }
  }
  
  void _showPhoneInputDialog() {
    final phoneController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          'Telefon Ekle',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: '5XX XXX XX XX',
                prefixText: '+90 ',
                prefixStyle: const TextStyle(
                  fontSize: 16,
                  color: AppColors.textPrimary,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: AppColors.textPrimary.withOpacity(0.3),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: AppColors.textPrimary.withOpacity(0.3),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: AppColors.textPrimary,
                    width: 2,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'İptal',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final phone = phoneController.text.trim();
              if (phone.isNotEmpty) {
                Navigator.pop(context);
                _showVerificationCodeDialog(
                  '+90 $phone',
                  isEmail: false,
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.textPrimary,
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Devam',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  void _showPhoneVerificationDialog(String phone) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          'Telefon Doğrulaması',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Telefon numaranıza doğrulama kodu göndermek ister misiniz?',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              phone,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'İptal',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _showVerificationCodeDialog(phone, isEmail: false);
            },
            child: Text(
              'Kod Gönder',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  void _showEmailInputDialog() {
    final emailController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          'E-posta Ekle',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'ornek@email.com',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: AppColors.textPrimary.withOpacity(0.3),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: AppColors.textPrimary.withOpacity(0.3),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: AppColors.textPrimary,
                    width: 2,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'İptal',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final email = emailController.text.trim();
              if (email.isNotEmpty) {
                Navigator.pop(context);
                _showVerificationCodeDialog(email, isEmail: true);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.textPrimary,
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Devam',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  void _showEmailVerificationDialog(String email) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          'E-posta Doğrulaması',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'E-posta adresinize doğrulama kodu göndermek ister misiniz?',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              email,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'İptal',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _showVerificationCodeDialog(email, isEmail: true);
            },
            child: Text(
              'Kod Gönder',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  void _showVerificationCodeDialog(String contact, {required bool isEmail}) {
    final codeController = TextEditingController();
    
    // Email veya telefonu doğrulanmamış olarak kaydet
    setState(() {
      if (isEmail) {
        _userService.setEmail(contact, verified: false);
      } else {
        _userService.setPhone(contact, verified: false);
      }
    });
    
    // TODO: Gerçek API'ye kod gönderme isteği
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isEmail
              ? '$contact adresine doğrulama kodu gönderildi'
              : '$contact numarasına doğrulama kodu gönderildi',
        ),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          'Doğrulama Kodu',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isEmail
                  ? 'E-posta adresinize gönderilen 6 haneli kodu girin'
                  : 'Telefon numaranıza gönderilen 6 haneli kodu girin',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: codeController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 6,
              decoration: InputDecoration(
                hintText: '000000',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: AppColors.textPrimary.withOpacity(0.3),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: AppColors.textPrimary.withOpacity(0.3),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: AppColors.textPrimary,
                    width: 2,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                counterText: '',
              ),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                letterSpacing: 8,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'İptal',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final code = codeController.text.trim();
              if (code.length == 6) {
                // TODO: Kodu backend'e doğrulat
                Navigator.pop(context);
                
                setState(() {
                  if (isEmail) {
                    _userService.setEmail(contact, verified: true);
                  } else {
                    _userService.setPhone(contact, verified: true);
                  }
                });
                
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      isEmail
                          ? 'E-posta başarıyla doğrulandı!'
                          : 'Telefon başarıyla doğrulandı!',
                    ),
                    duration: const Duration(seconds: 2),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.textPrimary,
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Doğrula',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  void _showPrivacyPolicy() {
    // TODO: Gizlilik politikası ekranı
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Gizlilik politikası sayfası yakında eklenecek'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _logout() {
    _userService.clearAll();
    
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const GetStartedScreen()),
      (route) => false,
    );
  }

  void _deleteAccount() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          'Hesabı Sil',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        content: Text(
          'Hesabınızı silmek istediğinize emin misiniz? Bu işlem geri alınamaz.',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.textSecondary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'İptal',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _userService.clearAll();
              
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const GetStartedScreen(),
                ),
                (route) => false,
              );
            },
            child: Text(
              'Evet, Sil',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.error,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    final avatarIndex = _userService.getAvatarIndex();
    final profileImage = _userService.getProfileImage();
    
    if (avatarIndex != null) {
      // Avatar göster
      return Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            AvatarSelectorDialog.avatars[avatarIndex],
            style: const TextStyle(fontSize: 64),
          ),
        ),
      );
    } else if (profileImage != null) {
      // Galeri resmini göster
      return Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
          image: DecorationImage(
            image: FileImage(File(profileImage)),
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      // Varsayılan ikon
      return Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(
          Icons.person_rounded,
          size: 64,
          color: AppColors.textSecondary.withOpacity(0.5),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final userName = _userService.getUserName();
    
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xFFFFD5CC), // Açık peachy pembe
              Color(0xFFF5F0F5), // Çok açık beyaz-mor
              Color(0xFFE0D8E8), // Açık gri-mor
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              children: [
                // Profil resmi ve düzenle butonu
                Stack(
                  children: [
                    _buildProfileImage(),
                    
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: _showImageOptions,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.textPrimary,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.edit_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 24),
                
                // Kullanıcı adı
                Text(
                  userName,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // Bilgi kartı
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 20,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kişisel Bilgiler',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      
                      const SizedBox(height: 24),
                      
                      _buildSimpleInfoRow(
                        label: 'İsim',
                        value: userName,
                      ),
                      
                      const SizedBox(height: 20),
                      
                      _buildSimpleInfoRow(
                        label: 'Zamirler',
                        value: _formatPronouns(_userService.getPronouns()),
                      ),
                      
                      const SizedBox(height: 20),
                      
                      _buildSimpleInfoRow(
                        label: 'Doğum Tarihi',
                        value: _formatBirthday(_userService.getBirthday()),
                      ),
                      
                      const SizedBox(height: 20),
                      
                      _buildEmailInfoRow(),
                      
                      const SizedBox(height: 20),
                      
                      _buildPhoneInfoRow(),
                    ],
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Gizlilik politikası butonu
                _buildActionButton(
                  icon: Icons.privacy_tip_outlined,
                  text: 'Gizlilik Politikası',
                  onTap: _showPrivacyPolicy,
                ),
                
                const SizedBox(height: 12),
                
                // Çıkış yap butonu
                _buildActionButton(
                  icon: Icons.logout_rounded,
                  text: 'Çıkış Yap',
                  onTap: _logout,
                ),
                
                const SizedBox(height: 12),
                
                // Hesabı sil butonu
                _buildActionButton(
                  icon: Icons.delete_outline_rounded,
                  text: 'Hesabı Sil',
                  onTap: _deleteAccount,
                  isDestructive: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatBirthday(DateTime? birthday) {
    if (birthday == null) return '-';
    
    // Format: M/D/YY (örn: 8/12/00)
    final month = birthday.month;
    final day = birthday.day;
    final year = birthday.year.toString().substring(2); // Son 2 rakam
    
    return '$month/$day/$year';
  }
  
  String _formatPronouns(String? pronouns) {
    if (pronouns == null || pronouns.isEmpty) return '-';
    
    // Zamirler aynen gösterilsin
    return pronouns;
  }

  Widget _buildSimpleInfoRow({
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.backgroundLight.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildEmailInfoRow() {
    final email = _userService.getEmail();
    final isEmpty = email == null;
    final isVerified = _userService.isEmailVerified();
    
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: _handleEmailEdit,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.backgroundLight.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'E-posta',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
              Row(
                children: [
                  Text(
                    isEmpty ? 'Ekle' : email,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    isEmpty 
                        ? Icons.add_circle_outline 
                        : (isVerified ? Icons.verified_outlined : Icons.info_outline),
                    color: isEmpty 
                        ? AppColors.textPrimary 
                        : (isVerified ? AppColors.success : AppColors.warning),
                    size: 18,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildPhoneInfoRow() {
    final phone = _userService.getPhone();
    final isEmpty = phone == null;
    final isVerified = _userService.isPhoneVerified();
    
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: _handlePhoneEdit,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.backgroundLight.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Telefon',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
              Row(
                children: [
                  Text(
                    isEmpty ? 'Ekle' : phone,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    isEmpty 
                        ? Icons.add_circle_outline 
                        : (isVerified ? Icons.verified_outlined : Icons.info_outline),
                    color: isEmpty 
                        ? AppColors.textPrimary 
                        : (isVerified ? AppColors.success : AppColors.warning),
                    size: 18,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.85),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: isDestructive
                      ? AppColors.error
                      : AppColors.textPrimary,
                  size: 24,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isDestructive
                          ? AppColors.error
                          : AppColors.textPrimary,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: isDestructive
                      ? AppColors.error.withOpacity(0.5)
                      : AppColors.textSecondary,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
