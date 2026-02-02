import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/theme/app_colors.dart';
import '../models/chat_message.dart';
import '../widgets/chat_bubble.dart';
import '../widgets/chat_input.dart';
import '../widgets/empty_chat_view.dart';
import '../widgets/chat_history_drawer.dart';
import 'temporary_chat_screen.dart';

/// Chat ekranı - AI ile konuşma ekranı
class ChatScreen extends StatefulWidget {
  final VoidCallback? onBackToHome;
  
  const ChatScreen({super.key, this.onBackToHome});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = [];
  final ScrollController _scrollController = ScrollController();
  bool _isAITyping = false;
  
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  
  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      Future.delayed(const Duration(milliseconds: 100), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }
  
  void _handleSendMessage(String text) {
    if (text.trim().isEmpty) return;
    
    // Kullanıcı mesajını ekle
    setState(() {
      _messages.add(
        ChatMessage(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          text: text,
          isUser: true,
          timestamp: DateTime.now(),
        ),
      );
      _isAITyping = true;
    });
    
    _scrollToBottom();
    
    // AI yanıtını simüle et (gerçek AI entegrasyonu yapılacak)
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _messages.add(
            ChatMessage(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              text: _getAIResponse(text),
              isUser: false,
              timestamp: DateTime.now(),
            ),
          );
          _isAITyping = false;
        });
        _scrollToBottom();
      }
    });
  }
  
  String _getAIResponse(String userMessage) {
    // Basit yanıtlar (gerçek AI entegrasyonu yapılacak)
    final responses = [
      'Anlıyorum, devam eder misin?',
      'Bu konuda daha fazla bilgi verebilir misin?',
      'Seni dinliyorum, nasıl hissediyorsun?',
      'Teşekkür ederim paylaştığın için. Sana nasıl yardımcı olabilirim?',
    ];
    return responses[DateTime.now().second % responses.length];
  }
  
  void _handleCamera() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.textSecondary.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 24),
              
              _buildOptionTile(
                icon: Icons.camera_alt_rounded,
                title: 'Fotoğraf Çek',
                onTap: () {
                  Navigator.pop(context);
                  // TODO: Kamera aç
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Kamera açılacak')),
                  );
                },
              ),
              
              _buildOptionTile(
                icon: Icons.photo_library_rounded,
                title: 'Galeriden Seç',
                onTap: () {
                  Navigator.pop(context);
                  // TODO: Galeri aç
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Galeri açılacak')),
                  );
                },
              ),
              
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildOptionTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.textPrimary.withOpacity(0.08),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Icon(icon, color: AppColors.textPrimary),
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  void _handleVoice() {
    HapticFeedback.mediumImpact();
    // TODO: Ses kaydı başlat
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Ses kaydı başlatılacak'),
        duration: Duration(seconds: 2),
      ),
    );
  }
  
  void _handleNewChat() {
    setState(() {
      _messages.clear();
      _isAITyping = false;
    });
  }
  
  void _handleChatSelected(String chatId, String title) {
    setState(() {
      _messages.clear();
      _isAITyping = false;
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$title sohbeti açıldı'),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ChatHistoryDrawer(
        onNewChat: _handleNewChat,
        onChatSelected: _handleChatSelected,
      ),
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
        child: Column(
          children: [
            // Header
            SafeArea(
              bottom: false,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Sol taraf - Sadece Geri Butonu
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: AppColors.textPrimary,
                        size: 24,
                      ),
                      onPressed: widget.onBackToHome,
                    ),
                    
                    // Sağ taraf - Aksiyonlar (Geçmiş + Gizli Sohbet)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Geçmiş Sohbetler
                        Builder(
                          builder: (context) => IconButton(
                            icon: Icon(
                              Icons.history_rounded,
                              color: AppColors.textPrimary,
                              size: 24,
                            ),
                            tooltip: 'Geçmiş Sohbetler',
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                          ),
                        ),
                        
                        // Gizli Sohbet
                        IconButton(
                          icon: Icon(
                            Icons.visibility_off_outlined,
                            color: AppColors.textPrimary,
                            size: 24,
                          ),
                          tooltip: 'Gizli sohbet',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TemporaryChatScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            // Mesajlar
            Expanded(
              child: _messages.isEmpty
                  ? const EmptyChatView()
                  : ListView.builder(
                      controller: _scrollController,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      itemCount: _messages.length + (_isAITyping ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == _messages.length && _isAITyping) {
                          return _buildTypingIndicator();
                        }
                        return ChatBubble(message: _messages[index]);
                      },
                    ),
            ),
            
            // Input alanı
            ChatInput(
              onSendMessage: _handleSendMessage,
              onCamera: _handleCamera,
              onVoice: _handleVoice,
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildTypingIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDot(0),
              const SizedBox(width: 6),
              _buildDot(1),
              const SizedBox(width: 6),
              _buildDot(2),
            ],
          ),
        ],
      ),
    );
  }
  
  Widget _buildDot(int index) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 600),
      builder: (context, value, child) {
        final delay = index * 0.2;
        final animValue = (value - delay).clamp(0.0, 1.0);
        final opacity = (animValue * 2).clamp(0.3, 1.0);
        
        return Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: AppColors.textSecondary.withOpacity(opacity),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      },
      onEnd: () {
        if (mounted && _isAITyping) {
          setState(() {}); // Animasyonu tekrarla
        }
      },
    );
  }
}
