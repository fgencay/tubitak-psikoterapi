import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

/// Avatar seçici dialog
class AvatarSelectorDialog extends StatelessWidget {
  final int? selectedIndex;
  final Function(int) onAvatarSelected;
  
  const AvatarSelectorDialog({
    super.key,
    this.selectedIndex,
    required this.onAvatarSelected,
  });
  
  // Avatar emoji listesi
  static const List<String> avatars = [
    '👨', '👩', '🧑', '👦', '👧',
    '👨‍💼', '👩‍💼', '👨‍🎓', '👩‍🎓', '👨‍⚕️',
    '👩‍⚕️', '👨‍🏫', '👩‍🏫', '👨‍🎨', '👩‍🎨',
    '🧔', '👱‍♀️', '👱‍♂️', '🧑‍🦰', '👩‍🦰',
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Avatar Seç',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Avatar grid
            SizedBox(
              width: double.maxFinite,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: avatars.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedIndex == index;
                  
                  return GestureDetector(
                    onTap: () {
                      onAvatarSelected(index);
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primary.withOpacity(0.1)
                            : AppColors.backgroundLight,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primary
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          avatars[index],
                          style: const TextStyle(fontSize: 32),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Kapat butonu
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
          ],
        ),
      ),
    );
  }
}
