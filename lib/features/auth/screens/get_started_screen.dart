import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../widgets/gradient_background.dart';
import '../widgets/custom_button.dart' as custom;
import 'phone_input_screen.dart';
import 'email_input_screen.dart';

/// Get Started (Başlangıç) Ekranı
class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              children: [
                const Spacer(flex: 2),
                
                // Logo (İki siyah damlacık)
                _buildLogo(),
                
                const SizedBox(height: 48),
                
                // Başlık
                Text(
                  AppStrings.getStartedTitle,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                const SizedBox(height: 16),
                
                // Alt başlık
                Text(
                  AppStrings.getStartedSubtitle,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 15,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                const Spacer(flex: 2),
                
                // Butonlar
                custom.CustomButton(
                  text: AppStrings.continueWithApple,
                  buttonStyle: custom.ButtonStyle.white,
                  icon: const Icon(
                    Icons.apple,
                    color: AppColors.textPrimary,
                    size: 24,
                  ),
                  onPressed: () {
                    // Apple ile giriş (gelecekte implement edilecek)
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Apple ile giriş yakında eklenecek'),
                      ),
                    );
                  },
                ),
                
                const SizedBox(height: 12),
                
                custom.CustomButton(
                  text: AppStrings.continueWithGoogle,
                  buttonStyle: custom.ButtonStyle.white,
                  icon: _buildGoogleIcon(),
                  onPressed: () {
                    // Google ile giriş (gelecekte implement edilecek)
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Google ile giriş yakında eklenecek'),
                      ),
                    );
                  },
                ),
                
                const SizedBox(height: 12),
                
                custom.CustomButton(
                  text: AppStrings.continueWithPhone,
                  buttonStyle: custom.ButtonStyle.black,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PhoneInputScreen(),
                      ),
                    );
                  },
                ),
                
                const SizedBox(height: 12),
                
                custom.CustomButton(
                  text: AppStrings.continueWithEmail,
                  buttonStyle: custom.ButtonStyle.grey,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EmailInputScreen(),
                      ),
                    );
                  },
                ),
                
                const SizedBox(height: 24),
                
                // Terms ve Privacy metni
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    AppStrings.termsAndPrivacy,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textTertiary,
                      fontSize: 12,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildGoogleIcon() {
    return const Text(
      'G',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
    );
  }
  
  Widget _buildLogo() {
    return SizedBox(
      width: 80,
      height: 80,
      child: Stack(
        children: [
          // Sol damlacık
          Positioned(
            left: 8,
            top: 20,
            child: Container(
              width: 32,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(4),
                ),
              ),
            ),
          ),
          // Sağ damlacık
          Positioned(
            right: 8,
            top: 20,
            child: Container(
              width: 32,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(4),
                  bottomRight: Radius.circular(16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

