import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

/// Özel buton widget'ı (3 farklı stil: white, black, grey)
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonStyle buttonStyle;
  final Widget? icon;
  final bool isEnabled;
  
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.buttonStyle = ButtonStyle.black,
    this.icon,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;
    
    switch (buttonStyle) {
      case ButtonStyle.white:
        backgroundColor = AppColors.buttonWhite;
        textColor = AppColors.textPrimary;
        break;
      case ButtonStyle.black:
        backgroundColor = AppColors.buttonBlack;
        textColor = AppColors.textWhite;
        break;
      case ButtonStyle.grey:
        backgroundColor = Colors.transparent;
        textColor = AppColors.textSecondary;
        break;
    }
    
    if (!isEnabled) {
      backgroundColor = AppColors.buttonDisabled;
      textColor = AppColors.textTertiary;
    }
    
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          elevation: buttonStyle == ButtonStyle.white ? 1 : 0,
          shadowColor: Colors.black.withOpacity(0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              icon!,
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum ButtonStyle {
  white,
  black,
  grey,
}


