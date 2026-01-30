import '../models/chat_message.dart';

/// Chat service - sohbet yönetimi için
class ChatService {
  static final ChatService _instance = ChatService._internal();
  
  factory ChatService() {
    return _instance;
  }
  
  ChatService._internal();
  
  String? _currentChatId;
  final Map<String, List<ChatMessage>> _chats = {};
  
  /// Aktif sohbet ID'sini al
  String? getCurrentChatId() => _currentChatId;
  
  /// Yeni sohbet başlat
  String startNewChat() {
    final chatId = DateTime.now().millisecondsSinceEpoch.toString();
    _currentChatId = chatId;
    _chats[chatId] = [];
    return chatId;
  }
  
  /// Sohbeti değiştir
  void switchChat(String chatId) {
    _currentChatId = chatId;
  }
  
  /// Mesaj ekle
  void addMessage(String chatId, ChatMessage message) {
    if (!_chats.containsKey(chatId)) {
      _chats[chatId] = [];
    }
    _chats[chatId]!.add(message);
  }
  
  /// Sohbet mesajlarını al
  List<ChatMessage> getChatMessages(String chatId) {
    return _chats[chatId] ?? [];
  }
  
  /// Tüm sohbetleri al
  Map<String, List<ChatMessage>> getAllChats() {
    return Map.from(_chats);
  }
}
