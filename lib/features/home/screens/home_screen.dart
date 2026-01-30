import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/services/user_service.dart';
import '../widgets/mood_selector.dart';
import '../widgets/quote_card.dart';

/// Ana ekran - kullanıcının ruh halini seçtiği ve günün sözünü gördüğü ekran
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _selectedMood;
  
  String _getGreeting() {
    final hour = DateTime.now().hour;
    
    // 15:00'a (öğlen 3'e) kadar günaydın, sonrası iyi akşamlar
    if (hour >= 5 && hour < 15) {
      return AppStrings.goodMorning;
    } else {
      return AppStrings.goodEvening;
    }
  }
  
  String _getGreetingWithName() {
    final userName = UserService().getUserName();
    return '${_getGreeting()}, $userName';
  }
  
  void _onMoodSelected(String mood) {
    setState(() {
      _selectedMood = mood;
    });
    
    // Ruh hali kaydedildiğinde bir geri bildirim göster
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Ruh haliniz kaydedildi: $mood'),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xFFFFD5CC), // Açık peachy pembe
              Color(0xFFF5F0F5), // Çok açık beyaz-mor
              Color(0xFFE0D8E8), // Açık gri-mor
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          top: true,
          bottom: false,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(28.0, 24.0, 28.0, 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  
                  // Tarih
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      _getCurrentDate(),
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Karşılama mesajı
                  Text(
                    _getGreetingWithName(),
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                      height: 1.15,
                      letterSpacing: -0.5,
                    ),
                  ),
                  
                  const SizedBox(height: 12),
                  
                  Text(
                    AppStrings.howAreYouFeeling,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSecondary,
                      height: 1.4,
                    ),
                  ),
                  
                  const SizedBox(height: 48),
                  
                  // Ruh hali seçici
                  MoodSelector(
                    selectedMood: _selectedMood,
                    onMoodSelected: _onMoodSelected,
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Günün sözü kartı
                  const QuoteCard(),
                  
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  
  String _getCurrentDate() {
    final now = DateTime.now();
    final months = [
      'Ocak', 'Şubat', 'Mart', 'Nisan', 'Mayıs', 'Haziran',
      'Temmuz', 'Ağustos', 'Eylül', 'Ekim', 'Kasım', 'Aralık'
    ];
    
    return '${now.day} ${months[now.month - 1]}';
  }
}
