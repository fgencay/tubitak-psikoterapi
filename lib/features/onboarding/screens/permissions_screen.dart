import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/widgets/main_layout.dart';
import '../../auth/widgets/gradient_background.dart';
import '../../auth/widgets/custom_button.dart' as custom;

/// İzinler ekranı
class PermissionsScreen extends StatefulWidget {
  const PermissionsScreen({super.key});

  @override
  State<PermissionsScreen> createState() => _PermissionsScreenState();
}

class _PermissionsScreenState extends State<PermissionsScreen> {
  bool _notificationsEnabled = true;
  bool _calendarEnabled = true;
  bool _locationEnabled = false;
  
  void _handleContinue() {
    // Ana ekrana yönlendir
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const MainLayout()),
      (route) => false,
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
                        AppStrings.permissionsTitle,
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Alt başlık
                      Text(
                        AppStrings.permissionsSubtitle,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.textSecondary,
                          fontSize: 16,
                          height: 1.4,
                        ),
                      ),
                      
                      const SizedBox(height: 40),
                      
                      // Bildirimler
                      _buildPermissionCard(
                        icon: Icons.notifications,
                        title: AppStrings.notificationsTitle,
                        subtitle: AppStrings.notificationsSubtitle,
                        isEnabled: _notificationsEnabled,
                        onTap: () {
                          setState(() {
                            _notificationsEnabled = !_notificationsEnabled;
                          });
                        },
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Takvim
                      _buildPermissionCard(
                        icon: Icons.calendar_today,
                        title: AppStrings.calendarTitle,
                        subtitle: AppStrings.calendarSubtitle,
                        isEnabled: _calendarEnabled,
                        onTap: () {
                          setState(() {
                            _calendarEnabled = !_calendarEnabled;
                          });
                        },
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Konum
                      _buildPermissionCard(
                        icon: Icons.location_on_outlined,
                        title: AppStrings.locationTitle,
                        subtitle: AppStrings.locationSubtitle,
                        isEnabled: _locationEnabled,
                        onTap: () {
                          setState(() {
                            _locationEnabled = !_locationEnabled;
                          });
                        },
                      ),
                      
                      const Spacer(),
                      
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
  
  Widget _buildPermissionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isEnabled,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isEnabled ? Colors.white : Colors.white.withOpacity(0.5),
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
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                // İkon
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.textPrimary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    color: AppColors.textPrimary,
                    size: 24,
                  ),
                ),
                
                const SizedBox(width: 16),
                
                // Metinler
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: isEnabled 
                              ? AppColors.textPrimary
                              : AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 14,
                          color: isEnabled 
                              ? AppColors.textSecondary
                              : AppColors.textTertiary,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Boş alan (checkmark kaldırıldı)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

