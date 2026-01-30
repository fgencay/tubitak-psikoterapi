import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/services/user_service.dart';
import '../../auth/widgets/gradient_background.dart';
import '../../auth/widgets/custom_button.dart' as custom;
import 'pronouns_input_screen.dart';

/// İsim giriş ekranı
class NameInputScreen extends StatefulWidget {
  const NameInputScreen({super.key});

  @override
  State<NameInputScreen> createState() => _NameInputScreenState();
}

class _NameInputScreenState extends State<NameInputScreen> {
  final TextEditingController _nameController = TextEditingController();
  bool _isValid = false;
  
  @override
  void initState() {
    super.initState();
    _nameController.addListener(_validateName);
  }
  
  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
  
  void _validateName() {
    final name = _nameController.text.trim();
    setState(() {
      _isValid = name.length >= 2;
    });
  }
  
  void _handleContinue() {
    if (_isValid) {
      // Kullanıcı adını kaydet
      UserService().setUserName(_nameController.text.trim());
      
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PronounsInputScreen(),
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
                        AppStrings.nameTitle,
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Alt başlık
                      Text(
                        AppStrings.nameSubtitle,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.textSecondary,
                          fontSize: 16,
                          height: 1.4,
                        ),
                      ),
                      
                      const SizedBox(height: 48),
                      
                      // İsim input
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
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
                          controller: _nameController,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            hintText: AppStrings.namePlaceholder,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 18,
                            ),
                          ),
                          style: const TextStyle(
                            fontSize: 18,
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


