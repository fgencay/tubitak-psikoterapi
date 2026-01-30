import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

/// Geçmiş sohbetler drawer'ı
class ChatHistoryDrawer extends StatelessWidget {
  final VoidCallback onNewChat;
  final Function(String chatId, String title)? onChatSelected;
  
  const ChatHistoryDrawer({
    super.key,
    required this.onNewChat,
    this.onChatSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFF5F0F5),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xFFFFE5E0), // Açık peachy
              Color(0xFFF5F0F5), // Açık beyaz-mor
              Color(0xFFE8E0F0), // Açık gri-mor
            ],
            stops: [0.0, 0.5, 1.0],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(2, 0),
            ),
          ],
        ),
        child: SafeArea(
              child: Column(
                children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Geçmiş Sohbetler',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.close,
                            color: AppColors.textPrimary,
                            size: 24,
                          ),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                  
                  // Ayırıcı çizgi
                  Container(
                    height: 0.5,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  
                  // Yeni sohbet butonu
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.textPrimary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            onNewChat();
                          },
                          borderRadius: BorderRadius.circular(8),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Yeni Sohbet',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
            
            // Sohbet listesi
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildChatItem(
                    context,
                    title: 'Bugün',
                    items: [
                      _ChatItemData(
                        id: 'chat_1',
                        title: 'Kaygı ve Stres Yönetimi',
                        time: '15:30',
                        preview: 'Bugün kendimi biraz stresli...',
                      ),
                      _ChatItemData(
                        id: 'chat_2',
                        title: 'Uyku Sorunları',
                        time: '10:20',
                        preview: 'Son zamanlarda uyuyamıyorum...',
                      ),
                    ],
                  ),
                  
                  _buildChatItem(
                    context,
                    title: 'Dün',
                    items: [
                      _ChatItemData(
                        id: 'chat_3',
                        title: 'İlişkiler Hakkında',
                        time: 'Dün',
                        preview: 'Arkadaşlarımla konuşurken...',
                      ),
                    ],
                  ),
                  
                  _buildChatItem(
                    context,
                    title: 'Bu Hafta',
                    items: [
                      _ChatItemData(
                        id: 'chat_4',
                        title: 'Motivasyon',
                        time: '3 gün önce',
                        preview: 'Kendimi motive etmekte zorlanıyorum...',
                      ),
                      _ChatItemData(
                        id: 'chat_5',
                        title: 'Özgüven',
                        time: '5 gün önce',
                        preview: 'Özgüvenimi nasıl artırabilirim?',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
  
  Widget _buildChatItem(
    BuildContext context, {
    required String title,
    required List<_ChatItemData> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary.withOpacity(0.7),
              letterSpacing: 0.2,
            ),
          ),
        ),
        ...items.map((item) => _buildChatTile(context, item)),
      ],
    );
  }
  
  Widget _buildChatTile(BuildContext context, _ChatItemData item) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          if (onChatSelected != null) {
            onChatSelected!(item.id, item.title);
          }
        },
        splashColor: Colors.white.withOpacity(0.1),
        highlightColor: Colors.white.withOpacity(0.05),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.white.withOpacity(0.2),
                width: 0.5,
              ),
            ),
          ),
          child: Row(
            children: [
              // Metin
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.preview,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textSecondary.withOpacity(0.85),
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
              ),
              
              const SizedBox(width: 12),
              
              // Zaman
              Text(
                item.time,
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary.withOpacity(0.75),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChatItemData {
  final String id;
  final String title;
  final String time;
  final String preview;
  
  _ChatItemData({
    required this.id,
    required this.title,
    required this.time,
    required this.preview,
  });
}
