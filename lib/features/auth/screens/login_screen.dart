import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/services/user_service.dart';
import '../../../core/widgets/main_layout.dart';
import '../widgets/gradient_background.dart';
import '../widgets/custom_button.dart' as custom;

/// Login (Giriş) Ekranı
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _identifierController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  
  @override
  void initState() {
    super.initState();
    _identifierController.addListener(_validateInput);
    _passwordController.addListener(_validateInput);
  }
  
  @override
  void dispose() {
    _identifierController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  
  void _validateInput() {
    setState(() {});
  }
  
  bool get _isValid {
    final identifier = _identifierController.text.trim();
    // E-posta kontrolü (@ içeriyorsa)
    if (identifier.contains('@')) {
      return identifier.length > 5 && _passwordController.text.isNotEmpty;
    }
    // Telefon kontrolü (sadece rakam ve 10 hane)
    final digitsOnly = identifier.replaceAll(RegExp(r'[^0-9]'), '');
    return digitsOnly.length == 10 && _passwordController.text.isNotEmpty;
  }
  
  void _handleLogin() {
    if (!_isValid) return;
    
    final userService = UserService();
    final storedEmail = userService.getEmail();
    final storedPhone = userService.getPhone();
    final storedPassword = userService.getPassword();
    
    String identifier = _identifierController.text.trim();
    String password = _passwordController.text;
    
    // E-posta veya telefon otomatik algılama
    bool isMatch = false;
    if (identifier.contains('@')) {
      // E-posta girişi
      if (storedEmail != null) {
        isMatch = storedEmail == identifier && storedPassword == password;
      }
    } else {
      // Telefon girişi (sadece rakamları al)
      final digitsOnly = identifier.replaceAll(RegExp(r'[^0-9]'), '');
      if (storedPhone != null) {
        isMatch = storedPhone == digitsOnly && storedPassword == password;
      }
    }
    
    if (isMatch) {
      // Başarılı giriş
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const MainLayout()),
        (route) => false,
      );
    } else {
      // Hatalı giriş
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('E-posta/Telefon veya şifre hatalı!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Geri butonu
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: AppColors.textPrimary,
                  ),
                  padding: EdgeInsets.zero,
                ),
                
                const SizedBox(height: 24),
                
                // Başlık
                Text(
                  'Giriş Yap',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                
                const SizedBox(height: 8),
                
                // Alt başlık
                Text(
                  'Hesabınıza giriş yapın',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 15,
                    height: 1.5,
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // Telefon veya E-posta input
                TextField(
                  controller: _identifierController,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: 'Telefon veya e-postanızı girin',
                    filled: true,
                    fillColor: AppColors.inputBackground,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: AppColors.textPrimary.withOpacity(0.3),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: AppColors.textPrimary.withOpacity(0.3),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: AppColors.textPrimary,
                        width: 2,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.textPrimary,
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Şifre input
                TextField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: 'Şifre',
                    filled: true,
                    fillColor: AppColors.inputBackground,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: AppColors.textPrimary.withOpacity(0.3),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: AppColors.textPrimary.withOpacity(0.3),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: AppColors.textPrimary,
                        width: 2,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: AppColors.textSecondary,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.textPrimary,
                  ),
                ),
                
                const Spacer(),
                
                // Giriş butonu
                custom.CustomButton(
                  text: 'Giriş Yap',
                  buttonStyle: custom.ButtonStyle.black,
                  isEnabled: _isValid,
                  onPressed: _handleLogin,
                ),
                
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
