import 'package:flutter/material.dart';

/// Gradient arkaplan widget'ı (Tek Pastel Gradient)
class GradientBackground extends StatelessWidget {
  final Widget child;
  
  const GradientBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xFFFFD5CC), // Açık peachy pembe (sol alt)
            Color(0xFFF5F0F5), // Çok açık beyaz-mor (orta)
            Color(0xFFE0D8E8), // Açık gri-mor (sağ üst)
          ],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      child: child,
    );
  }
}

