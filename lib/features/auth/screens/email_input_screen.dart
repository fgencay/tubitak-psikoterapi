import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../widgets/gradient_background.dart';
import '../widgets/custom_button.dart' as custom;
import 'verification_screen.dart';

/// Email giriş ekranı
class EmailInputScreen extends StatefulWidget {
  const EmailInputScreen({super.key});

  @override
  State<EmailInputScreen> createState() => _EmailInputScreenState();
}

class _EmailInputScreenState extends State<EmailInputScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool _isValid = false;
  
  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateEmail);
  }
  
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
  
  void _validateEmail() {
    final email = _emailController.text.trim();
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    setState(() {
      _isValid = emailRegex.hasMatch(email);
    });
  }
  
  void _handleContinue() {
    if (_isValid) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VerificationScreen(
            verificationType: VerificationType.email,
            contact: _emailController.text.trim(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                        AppStrings.emailTitle,
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Alt başlık
                      Text(
                        AppStrings.emailSubtitle,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.textSecondary,
                          fontSize: 15,
                          height: 1.5,
                        ),
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Email input
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.inputBackground,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          decoration: const InputDecoration(
                            hintText: AppStrings.emailPlaceholder,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 16,
                            ),
                          ),
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.textPrimary,
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
                      
                      const SizedBox(height: 16),
                      
                      // Hide My Email butonu
                      Center(
                        child: TextButton(
                          onPressed: () {
                            // Hide My Email özelliği (gelecekte implement edilecek)
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Bu özellik yakında eklenecek'),
                              ),
                            );
                          },
                          child: const Text(
                            AppStrings.hideMyEmail,
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 14,
                            ),
                          ),
                        ),
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
}


