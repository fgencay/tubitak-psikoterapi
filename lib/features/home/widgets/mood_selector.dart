import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

/// Ruh hali seçici widget - Kullanıcının ruh halini emoji ile seçmesini sağlar
class MoodSelector extends StatelessWidget {
  final String? selectedMood;
  final Function(String) onMoodSelected;
  
  const MoodSelector({
    super.key,
    this.selectedMood,
    required this.onMoodSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.85),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 24,
            offset: const Offset(0, 8),
            spreadRadius: -4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildMoodButton(
            emoji: '😊',
            mood: 'Çok Mutlu',
            isSelected: selectedMood == 'Çok Mutlu',
          ),
          _buildMoodButton(
            emoji: '🙂',
            mood: 'Mutlu',
            isSelected: selectedMood == 'Mutlu',
          ),
          _buildMoodButton(
            emoji: '😐',
            mood: 'Normal',
            isSelected: selectedMood == 'Normal',
          ),
          _buildMoodButton(
            emoji: '☹️',
            mood: 'Üzgün',
            isSelected: selectedMood == 'Üzgün',
          ),
          _buildMoodButton(
            emoji: '😢',
            mood: 'Çok Üzgün',
            isSelected: selectedMood == 'Çok Üzgün',
          ),
        ],
      ),
    );
  }
  
  Widget _buildMoodButton({
    required String emoji,
    required String mood,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () => onMoodSelected(mood),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        width: 54,
        height: 54,
        decoration: BoxDecoration(
          color: isSelected 
              ? AppColors.primary.withOpacity(0.15)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isSelected 
                ? AppColors.primary
                : Colors.transparent,
            width: 2.5,
          ),
        ),
        child: Center(
          child: Transform.scale(
            scale: isSelected ? 1.1 : 1.0,
            child: Text(
              emoji,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
