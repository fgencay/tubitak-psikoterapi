import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/services/user_service.dart';
import '../widgets/gradient_background.dart';
import '../widgets/custom_button.dart' as custom;
import 'password_create_screen.dart';

enum VerificationType { email, phone }

/// Doğrulama (OTP) ekranı
class VerificationScreen extends StatefulWidget {
  final VerificationType verificationType;
  final String contact;
  
  const VerificationScreen({
    super.key,
    required this.verificationType,
    required this.contact,
  });

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(
    6,
    (index) => FocusNode(),
  );
  
  int _resendTimer = 29;
  Timer? _timer;
  bool _isValid = false;
  
  @override
  void initState() {
    super.initState();
    _startTimer();
    
    // İlk kutuya focus ver
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNodes[0].requestFocus();
    });
  }
  
  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }
  
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_resendTimer > 0) {
        setState(() {
          _resendTimer--;
        });
      } else {
        timer.cancel();
      }
    });
  }
  
  void _resendCode() {
    setState(() {
      _resendTimer = 29;
    });
    _startTimer();
    
    // Kod gönderme simülasyonu
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Kod tekrar gönderildi')),
    );
  }
  
  void _validateCode() {
    final code = _controllers.map((c) => c.text).join();
    setState(() {
      _isValid = code.length == 6;
    });
  }
  
  void _handleContinue() {
    if (_isValid) {
      // Email veya telefonu kaydet
      if (widget.verificationType == VerificationType.email) {
        UserService().setEmail(widget.contact, verified: true);
      } else {
        UserService().setPhone(widget.contact, verified: true);
      }
      
      // Doğrulama başarılı - şifre oluşturma ekranına yönlendir
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const PasswordCreateScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.verificationType == VerificationType.email
        ? AppStrings.verificationTitle
        : AppStrings.verificationPhoneTitle;
        
    final subtitle = widget.verificationType == VerificationType.email
        ? AppStrings.verificationSubtitleEmail.replaceAll('{email}', widget.contact)
        : AppStrings.verificationSubtitlePhone.replaceAll('{phone}', widget.contact);
    
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () => Navigator.pop(context),
                      color: AppColors.textPrimary,
                    ),
                  ],
                ),
              ),
              
              // İçerik
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      
                      // Başlık
                      Text(
                        title,
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Alt başlık
                      Text(
                        subtitle,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.textSecondary,
                          fontSize: 15,
                          height: 1.5,
                        ),
                      ),
                      
                      const SizedBox(height: 40),
                      
                      // OTP kutucukları
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          6,
                          (index) => _buildOTPBox(index),
                        ),
                      ),
                      
                      const SizedBox(height: 24),
                      
                      // Resend timer
                      Center(
                        child: _resendTimer > 0
                            ? Text(
                                AppStrings.resendInSeconds.replaceAll(
                                  '{seconds}',
                                  '$_resendTimer',
                                ),
                                style: const TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 14,
                                ),
                              )
                            : TextButton(
                                onPressed: _resendCode,
                                child: const Text(
                                  AppStrings.resendCode,
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                      ),
                      
                      const Spacer(),
                      
                      // Continue butonu
                      custom.CustomButton(
                        text: AppStrings.continueButton,
                        buttonStyle: custom.ButtonStyle.black,
                        isEnabled: _isValid,
                        onPressed: _handleContinue,
                      ),
                      
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildOTPBox(int index) {
    return Container(
      width: 52,
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: TextField(
          controller: _controllers[index],
          focusNode: _focusNodes[index],
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          enableInteractiveSelection: false,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: const InputDecoration(
            counterText: '',
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            height: 1.2,
          ),
          onChanged: (value) {
            setState(() {});
            if (value.isNotEmpty) {
              // Sonraki kutuya geç
              if (index < 5) {
                _focusNodes[index + 1].requestFocus();
              } else {
                // Son kutu, klavyeyi kapat
                _focusNodes[index].unfocus();
              }
            } else {
              // Boş ise önceki kutuya geç
              if (index > 0) {
                _focusNodes[index - 1].requestFocus();
              }
            }
            _validateCode();
          },
        ),
      ),
    );
  }
}

