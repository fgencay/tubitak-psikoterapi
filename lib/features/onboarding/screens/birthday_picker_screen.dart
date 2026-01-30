import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../auth/widgets/gradient_background.dart';
import '../../auth/widgets/custom_button.dart' as custom;
import 'permissions_screen.dart';

/// Doğum tarihi seçim ekranı
class BirthdayPickerScreen extends StatefulWidget {
  const BirthdayPickerScreen({super.key});

  @override
  State<BirthdayPickerScreen> createState() => _BirthdayPickerScreenState();
}

class _BirthdayPickerScreenState extends State<BirthdayPickerScreen> {
  late DateTime _selectedDate;
  
  @override
  void initState() {
    super.initState();
    // Bugünden 25 yıl önce varsayılan tarih
    final now = DateTime.now();
    _selectedDate = DateTime(now.year - 25, now.month, now.day > 28 ? 28 : now.day);
  }
  
  void _handleContinue() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PermissionsScreen(),
      ),
    );
  }
  
  void _handleSkip() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PermissionsScreen(),
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
                        AppStrings.birthdayTitle,
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Alt başlık
                      Text(
                        AppStrings.birthdaySubtitle,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.textSecondary,
                          fontSize: 16,
                          height: 1.4,
                        ),
                      ),
                      
                      const SizedBox(height: 48),
                      
                      // Date Picker (Türkçe)
                      Expanded(
                        child: Localizations.override(
                          context: context,
                          locale: const Locale('tr', 'TR'),
                          child: CupertinoTheme(
                            data: const CupertinoThemeData(
                              textTheme: CupertinoTextThemeData(
                                dateTimePickerTextStyle: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.date,
                              initialDateTime: _selectedDate,
                              minimumDate: DateTime(1940, 1, 1),
                              maximumDate: DateTime.now(),
                              onDateTimeChanged: (DateTime newDate) {
                                setState(() {
                                  _selectedDate = newDate;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 24),
                      
                      // Continue butonu
                      custom.CustomButton(
                        text: AppStrings.continueButton,
                        buttonStyle: custom.ButtonStyle.black,
                        isEnabled: true,
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

