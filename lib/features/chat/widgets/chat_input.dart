import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

/// Chat mesaj giriş alanı
class ChatInput extends StatefulWidget {
  final Function(String) onSendMessage;
  final VoidCallback onCamera;
  final VoidCallback onVoice;
  
  const ChatInput({
    super.key,
    required this.onSendMessage,
    required this.onCamera,
    required this.onVoice,
  });

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final TextEditingController _controller = TextEditingController();
  bool _hasText = false;
  
  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  void _onTextChanged() {
    setState(() {
      _hasText = _controller.text.trim().isNotEmpty;
    });
  }
  
  void _handleSend() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      widget.onSendMessage(text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.4),
            border: Border(
              top: BorderSide(
                color: Colors.white.withOpacity(0.2),
                width: 1,
              ),
            ),
          ),
          child: SafeArea(
            top: false,
            child: Row(
          children: [
            // Kamera butonu
            GestureDetector(
              onTap: widget.onCamera,
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Icon(
                  Icons.camera_alt_rounded,
                  color: AppColors.textPrimary,
                  size: 24,
                ),
              ),
            ),
            
            const SizedBox(width: 12),
            
            // Metin giriş alanı
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        maxLines: null,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          hintText: 'Mesaj yaz...',
                          hintStyle: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 16,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 14,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    
                    // Ses kayıt butonu (metin yoksa göster)
                    if (!_hasText)
                      GestureDetector(
                        onTap: widget.onVoice,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Icon(
                            Icons.mic_rounded,
                            color: AppColors.textSecondary,
                            size: 28,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(width: 12),
            
            // Gönder butonu
            GestureDetector(
              onTap: _hasText ? _handleSend : null,
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: _hasText 
                      ? AppColors.textPrimary
                      : Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(24),
                  border: _hasText ? null : Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 1,
                  ),
                  boxShadow: _hasText ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ] : [],
                ),
                child: Icon(
                  Icons.arrow_upward_rounded,
                  color: _hasText ? Colors.white : AppColors.textSecondary,
                  size: 24,
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
}
