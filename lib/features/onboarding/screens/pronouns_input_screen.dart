import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../auth/widgets/gradient_background.dart';
import '../../auth/widgets/custom_button.dart' as custom;
import 'birthday_picker_screen.dart';

/// Kimlik/Cinsiyet seçim ekranı
class PronounsInputScreen extends StatefulWidget {
  const PronounsInputScreen({super.key});

  @override
  State<PronounsInputScreen> createState() => _PronounsInputScreenState();
}

class _PronounsInputScreenState extends State<PronounsInputScreen> with SingleTickerProviderStateMixin {
  String? _selectedPronoun;
  late AnimationController _scaleController;
  
  final List<String> _pronounOptions = [
    AppStrings.pronounsFemale,
    AppStrings.pronounsMale,
    AppStrings.pronounsOther,
    AppStrings.pronounsPreferNotToSay,
  ];
  
  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
  }
  
  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }
  
  void _handleContinue() {
    if (_selectedPronoun != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const BirthdayPickerScreen(),
        ),
      );
    }
  }
  
  void _selectPronoun(String pronoun) {
    setState(() {
      _selectedPronoun = pronoun;
    });
    _scaleController.forward().then((_) => _scaleController.reverse());
  }
  
  void _handleSkip() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BirthdayPickerScreen(),
      ),
    );
  }
  

  Widget _buildModernOptionCard(String option) {
    final isSelected = _selectedPronoun == option;
    
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _selectPronoun(option),
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Row(
              children: [
                // Radio icon
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected 
                          ? AppColors.textPrimary
                          : Colors.grey.shade300,
                      width: 2,
                    ),
                    color: isSelected 
                        ? AppColors.textPrimary
                        : Colors.transparent,
                  ),
                  child: isSelected
                      ? const Icon(
                          Icons.check,
                          size: 16,
                          color: Colors.white,
                        )
                      : null,
                ),
                const SizedBox(width: 16),
                // Opsiyon metni
                Expanded(
                  child: Text(
                    option,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: isSelected 
                          ? AppColors.textPrimary
                          : AppColors.textSecondary,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
                    const Spacer(),
                    TextButton(
                      onPressed: _handleSkip,
                      child: const Text(
                        AppStrings.skip,
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 16,
                        ),
                      ),
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
                        AppStrings.pronounsTitle,
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: 38,
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Alt başlık
                      Text(
                        AppStrings.pronounsSubtitle,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.textSecondary,
                          fontSize: 16,
                          height: 1.6,
                        ),
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Modern Seçenek Kartları
                      ..._pronounOptions.asMap().entries.map((entry) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: _buildModernOptionCard(entry.value),
                        );
                      }).toList(),
                      
                      const Spacer(),
                      
                      // Continue butonu
                      custom.CustomButton(
                        text: AppStrings.continueButton,
                        buttonStyle: custom.ButtonStyle.black,
                        isEnabled: _selectedPronoun != null,
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

