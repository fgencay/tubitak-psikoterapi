# PRD - Yapay Zeka Destekli Psikolojik Asistan Mobil Uygulama

## 📋 Proje Özeti

**Proje Adı:** Psikolojik Asistan (PsiKolay)

**Versiyon:** 1.1.0

**Tarih:** Ocak 2026 (Son Güncelleme)


### Genel Bakış
Yapay zeka destekli psikolojik destek ve telkin uygulaması, kullanıcıların ruh hallerini takip etmelerini, yapay zeka ile konuşarak psikolojik destek almalarını ve duygusal sağlıklarını yönetmelerini sağlayan bir mobil platformdur.

---

## 🎯 Hedefler ve Amaçlar

### Ana Hedefler
1. **Erişilebilir Psikolojik Destek:** 7/24 kullanıcılara yapay zeka destekli psikolojik destek sunmak
2. **Ruh Hali Takibi:** Kullanıcıların duygusal durumlarını düzenli olarak izlemelerini sağlamak
3. **Kişiselleştirilmiş Deneyim:** Her kullanıcıya özel telkin ve destek sunmak
4. **Sürdürülebilir Model:** Freemium iş modeli ile gelir elde etmek

---

## 🚀 Özellikler ve İşlevler

### 1. Chat Ekranı (Ana Özellik)

#### 1.1 Temel Özellikler
- **WhatsApp-benzeri arayüz**
  - Mesaj baloncukları (kullanıcı sağda, AI solda)
  - Zaman damgaları
  - Mesaj durumu göstergeleri (gönderildi, okundu)
  - Yazıyor göstergesi (typing indicator)

#### 1.2 AI Konuşma Özellikleri (Fine-Tuned Model ile)

- **Doğal Dil İşleme**
  - Türkçe tam desteği (model Türkçe veri setiyle fine-tune edilmiştir)
  - Duygu analizi (fine-tuning ile modele entegre)
  - Bağlam hafızası (konuşma geçmişi modele context olarak verilir)
  - Kültürel olarak uygun yanıtlar (Türkiye bağlamına özel eğitilmiş)
  
- **Telkin ve Destek (Fine-Tuning ile Öğrenilmiş)**
  - Empati kurma (veri setindeki örneklerle öğrenilmiş)
  - Aktif dinleme yanıtları
  - Bilişsel davranışçı terapi (BDT) temelli öneriler
  - Mindfulness ve nefes egzersizleri önerileri
  - Pozitif pekiştirme ve motivasyon
  - Her kullanıcıya tutarlı terapötik yaklaşım
  
- **Güvenlik Önlemleri (Model Davranışına Gömülü)**
  - Kriz tespiti (intihar, kendine zarar verme ifadeleri - fine-tuning ile hassaslaştırılmış)
  - Acil durum yönlendirmeleri (ALO 182, 112 gibi hatlar)
  - Profesyonel destek önerileri
  - Zararlı içerik üretmeme garantisi (veri seti temizliği ile)

#### 1.3 Konuşma Geçmişi
- Tüm konuşmaların kaydedilmesi
- ?Tarih bazlı filtreleme
- Arama özelliği
- Konuşmaları silme

#### 1.4 Freemium Limitleri (Fine-Tuned Model Kullanımı)

**Ücretsiz Kullanıcılar:**
- Günlük 20 mesaj hakkı
- Standart fine-tuned model yanıtları
- Son 1 günlük geçmiş
- Temel bağlam hafızası (son 10 mesaj)

**Premium Kullanıcılar:**
- Sınırsız mesaj
- Gelişmiş fine-tuned model (daha büyük model, daha detaylı yanıtlar)
- Tüm geçmiş erişimi
- Genişletilmiş bağlam hafızası (son 50+ mesaj)
- Öncelikli yanıt süreleri
- Özel telkin programları (model kişiselleştirilmiş prompt ile çalışır)
- Daha uzun ve detaylı yanıtlar

---

### 2. Ana Ekran (Dashboard)

#### 2.1 Ruh Hali Giriş Modülü
**Günlük Ruh Hali Kaydı:**
- **Seçim Yöntemi:**
  - Emoji tabanlı (😊 😐 😢 😰 😡 ...)
  - Slider (1-10 arası)
  - Renkli butonlar
  

- **Hatırlatıcılar:**
  - Günlük bildirimler
  - Özelleştirilebilir saatler
  - Özelleştirilmiş kişiye özel bildirimler (onay dahilinde)

#### 2.2 Haftalık Durum Tablosu
  


#### 2.3 İçgörüler ve Öneriler
- Kişiselleştirilmiş öneriler
- İlerleme rozetleri/başarımlar

---

### 3. Ayarlar Ekranı

#### 3.1 Profil Ayarları
**Kişisel Bilgiler:**
- İsim/Kullanıcı adı
- Profil fotoğrafı
- Yaş aralığı
- Cinsiyet (opsiyonel)


**Psikolojik Profil:**
- İlgi alanları
- Hedefler


#### 3.2 Bildirim Ayarları
- Günlük hatırlatıcılar
- Chat bildirimleri
- Ruh hali kayıt hatırlatıcıları
- Sessiz saatler

#### 3.3 Gizlilik ve Güvenlik
- Şifre değiştirme
- Verilerimi indir
- Hesabı sil
- Gizlilik politikası
- Kullanım şartları

#### 3.4 Uygulama Ayarları
- Dil seçimi (Türkçe, İngilizce)
- Tema (Açık/Koyu mod)
- Yazı tipi boyutu
- Bildirim sesleri
- Veri kullanımı (otomatik medya indirme)

#### 3.5 Premium Yönetimi
- Abonelik durumu
- Paket seçimi
- Ödeme yöntemi
- Fatura geçmişi
- Aboneliği iptal et
- ?Kullanım istatistikleri (mesaj sayısı vs.)

#### 3.6 Destek ve Yardım
- SSS (Sık Sorulan Sorular)
- İletişim
- Uygulama turu
- Geri bildirim gönder
- Uygulama versiyonu

---

## 💳 Premium/Freemium Model

### Ücretsiz Plan (Free Tier)
**Özellikler:**
- ✅ Günlük 10 mesaj hakkı
- ✅ GPT-3.5-turbo fine-tuned model ile temel AI yanıtları
- ✅ Ruh hali kaydı 
- ✅ Son 7 günlük chat geçmişi
- ✅ Temel bildirimler
- ✅ Kısa bağlam hafızası (son 10 mesaj)
- ❌ Gelişmiş GPT-4 fine-tuned model
- ❌ Gelişmiş analiz
- ❌ Özel telkin programları
- ❌ Uzun bağlam hafızası

### Premium Plan Seçenekleri

**1. Aylık Plan**
- Fiyat: ₺99/ay
- Sınırsız mesajlaşma
- Tüm özellikler aktif
- İstediğiniz zaman iptal

**2. 3 Aylık Plan**
- Fiyat: ₺249 (₺83/ay - %16 indirim)
- Tüm premium özellikler
- 3 ay taahhüt

**3. Yıllık Plan**
- Fiyat: ₺799 (₺66/ay - %33 indirim)
- Tüm premium özellikler
- En avantajlı paket
- 1 ay ücretsiz bonus

### Premium Özellikleri (Fine-Tuned Model Avantajları)
- ✅ Sınırsız AI mesajlaşma
- ✅ Gelişmiş fine-tuned model (GPT-4 tabanlı, daha empatik ve detaylı)
- ✅ Tüm geçmiş erişimi ve uzun konuşma hafızası
- ✅ Özel telkin programları (kişiselleştirilmiş sistem promptları ile)
- ✅ Hedef takibi ve kişiselleştirilmiş planlar
- ✅ Daha hızlı yanıt süresi (priority queue)
- ✅ Gelişmiş bağlam anlama (daha fazla token limiti)

### Ödeme Yöntemleri
- Kredi/Banka kartı
- Google Play / App Store abonelik
- Havale/EFT (özel durumlar)

---

## 🔧 Teknik Gereksinimler

### Frontend (Mobil Uygulama)

#### Platform ve Framework
- **Flutter** (Stable Channel, Son sürüm)
- **Dart**
- **Flutter'ın kendi paket yönetimi ve widget sistemi**

#### UI Kütüphaneleri ve Araçlar
- **Flutter Material** ve/veya **Flutter Cupertino Widgets**
- **Provider** veya **Riverpod** (state management)
- **GoRouter** veya **auto_route** (navigasyon)
- **flutter_svg** (vektörel görseller için)
- **fl_chart** veya **charts_flutter** (grafikler için)
- **AnimationController** (animasyonlar için)
- **GestureDetector** (gesture’lar için)

#### State Management
- **Provider** veya **Riverpod** (durum yönetimi)
- **GetX** veya **Bloc** (alternatif olarak)
- **Shared Preferences** (küçük yerel veriler için)
- **Theme yönetimi için built-in ThemeProvider**

#### UI Bileşenleri ve Ek Paketler
- **flutter_image** veya **cached_network_image** (optimize görseller için)
- **flutter_safe_area** veya **safe_area widget**
- **flutter_haptic** veya **vibration** (dokunsal geri bildirim için)
- **flutter_gradient_colors** veya **Container’ın gradient parametresi** (arkaplanlar için)

#### Form ve Doğrulama
- **flutter_form_builder** veya **reactive_forms**
- **Form alan validasyonu için built-in validator fonksiyonları**

#### Storage/Depolama
- **Firebase Firestore** (tüm veriler için, çevrimdışı senkronizasyon dahil)
- **Firebase Storage** (resim, dosya, medya yükleme)
- **Shared Preferences** (basit lokal veriler için, ör: ayarlar)

#### Kimlik Doğrulama
- **Firebase Auth** (Google, Apple, Email/Şifre, SMS ile vb. sosyal giriş seçenekleri dahil)
- **Gerekirse OAuth sağlayıcıları** (Google, Apple)

#### Bildirimler
- **Firebase Cloud Messaging (FCM)**
- **local_notifications** paketi (yerel bildirimler için)

#### Grafikler & Görselleştirme
- **fl_chart**
- **syncfusion_flutter_charts** (alternatif)
- **table_calendar** (takvim görünümü için)

---

### Backend (Sunucu ve Servisler)

#### Platform ve Yönetim
- **Firebase Platformu tüm servisler için kullanılacaktır.**

#### Backend Servisleri
- **Firebase Authentication:** Kimlik doğrulama, Google/Apple/SMS/E-mail ile giriş.
- **Firebase Firestore:** Tüm kullanıcı verileri, ruh hali, chat geçmişi, premium üyelikleri vs. gerçek zamanlı olarak saklanacaktır.
- **Firebase Functions:** Arka plan işleri, premium kontrolü, rapor üretimi gibi iş mantıkları sunucuya ihtiyaç olmadan burada koşturulacak.
- **Firebase Storage:** Dosya ve görsel yükleme.
- **Firebase Cloud Messaging:** Push bildirimleri.
- **Firebase Hosting:** Gerekiyorsa landing page veya web paneli barındırma.
- **Crashlytics veya Cloud Logging:** Hata ve log takibi.

#### AI ve LLM Entegrasyonu

**Fine-Tuning Yaklaşımı:**
- **Fine-Tuned (İnce Ayarlı) LLM Kullanımı:** Uygulamamız, özel olarak hazırlanmış psikolojik destek veri seti ile eğitilmiş (fine-tuned) bir dil modelini kullanır.
- **Model Seçenekleri:**
  - OpenAI GPT-4 veya GPT-3.5-turbo (fine-tuned versiyon)
  - Alternatif: Açık kaynak modeller (Llama, Mistral) kendi sunucularımızda fine-tune edilerek
- **Fine-Tuning Veri Seti İçeriği:**
  - Psikolojik destek diyalogları (profesyonel psikologlarca onaylanmış)
  - Empati kurma örnekleri
  - Bilişsel Davranışçı Terapi (BDT) temelli rehberlik örnekleri
  - Kriz durumu tespit ve yönlendirme senaryoları
  - Türkçe doğal dil kalıpları ve kültürel bağlam
  
**Neden RAG Değil, Fine-Tuning?**
- Fine-tuning ile modelin tüm ağırlıkları psikolojik destek için optimize edilir
- Her sorguda vektör araması yapmaya gerek kalmaz (daha hızlı yanıt)
- Model, psikolojik destek verme konusunda uzmanlaşmış olur
- Maliyet açısından daha öngörülebilir
- Daha tutarlı kişilik ve üslup
- Embedding ve vektör veritabanına ihtiyaç olmaz

**Teknik Entegrasyon:**
- AI modeli Firebase Functions üzerinden HTTP request ile çağrılır
- Kullanıcı mesajları doğrudan fine-tuned modele gönderilir
- Model yanıtı alınır, güvenlik filtresinden geçirilir ve kullanıcıya iletilir
- Konuşma geçmişi context olarak modele eklenebilir (token limitleri dahilinde)

**Güvenlik ve Moderasyon:**
- Fine-tuning aşamasında zararlı içerik filtrelenmesi
- Yanıt sonrası content moderation API kontrolü
- Kriz durumu anahtar kelime tespiti
- Profesyonel yardım yönlendirme mekanizması

#### Ödeme & Premium Entegrasyon
- **Stripe / Iyzico** gibi servislerin webhook kontrolü yine Firebase Functions ile sağlanır.
- Premium, abonelik yönetimi, geçmiş görüntüleme vs. Firestore üzerinden saklanır.

#### API ve Diğer
- Tüm frontend işlemleri doğrudan Firestore ve Functions’ı kullanarak çalışır. Ayrı bir REST veya GraphQL API yoktur.

#### Test ve İzleme
- Testler için Flutter'ın built-in test frameworkleri (unit/widget/integration test).
- Firebase Emulator Suite ile geliştirme ve test ortamı.
- Hata izleme için Firebase Crashlytics ve Cloud Logging.

---

## 🔄 Flutter - Firebase - Fine-Tuned AI Entegrasyon Akışı

### Mimari Genel Bakış

```
[Flutter App]
     ↓
[Firebase Firestore] ← Kullanıcı verileri, chat geçmişi
     ↓
[Firebase Functions] ← AI request handler
     ↓
[OpenAI Fine-Tuned Model API] veya [Kendi Fine-Tuned Modelimiz]
     ↓
[Response] → Content Moderation → [Firebase Functions]
     ↓
[Flutter App] ← Güvenli yanıt
```

### Detaylı Akış

#### 1. Kullanıcı Mesaj Gönderimi (Flutter)
```dart
// Flutter tarafında
Future<void> sendMessage(String userMessage) async {
  // Firestore'a mesajı kaydet
  await FirebaseFirestore.instance
    .collection('users/${userId}/chats')
    .add({
      'message': userMessage,
      'role': 'user',
      'timestamp': FieldValue.serverTimestamp(),
    });
  
  // Firebase Function'ı çağır (Cloud Function)
  final callable = FirebaseFunctions.instance.httpsCallable('generateAIResponse');
  final result = await callable.call({
    'userId': userId,
    'message': userMessage,
    'conversationHistory': recentMessages, // Son 10-50 mesaj
  });
  
  // AI yanıtını al ve göster
  setState(() {
    messages.add(result.data['response']);
  });
}
```

#### 2. Firebase Function - AI Request Handler
```javascript
// Firebase Functions (Node.js)
exports.generateAIResponse = functions.https.onCall(async (data, context) => {
  const { userId, message, conversationHistory } = data;
  
  // Kullanıcı premium kontrolü
  const userDoc = await admin.firestore()
    .collection('users').doc(userId).get();
  const isPremium = userDoc.data().isPremium;
  
  // Günlük mesaj limiti kontrolü (ücretsiz kullanıcılar için)
  if (!isPremium) {
    const today = new Date().toISOString().split('T')[0];
    const messageCount = await getMessageCount(userId, today);
    if (messageCount >= 10) {
      throw new functions.https.HttpsError(
        'resource-exhausted', 
        'Günlük mesaj limitine ulaştınız.'
      );
    }
  }
  
  // Fine-tuned model seçimi
  const model = isPremium 
    ? 'ft:gpt-4-0613:psikolay:premium:abc123'  // Premium fine-tuned model
    : 'ft:gpt-3.5-turbo:psikolay:free:xyz789'; // Free fine-tuned model
  
  // OpenAI API çağrısı
  const completion = await openai.chat.completions.create({
    model: model,
    messages: [
      {
        role: "system",
        content: "Sen PsiKolay adlı empatik bir psikolojik destek asistanısın..."
      },
      ...conversationHistory,
      { role: "user", content: message }
    ],
    max_tokens: isPremium ? 500 : 200,
    temperature: 0.7,
  });
  
  const aiResponse = completion.choices[0].message.content;
  
  // Content Moderation (güvenlik kontrolü)
  const moderationResult = await openai.moderations.create({
    input: aiResponse
  });
  
  if (moderationResult.results[0].flagged) {
    // Zararlı içerik tespit edildi, güvenli varsayılan yanıt
    return {
      response: "Üzgünüm, şu anda size yardımcı olamıyorum. Lütfen profesyonel destek alın.",
      flagged: true
    };
  }
  
  // Kriz durumu kontrolü (intihar, kendine zarar)
  const crisisKeywords = ['intihar', 'ölmek istiyorum', 'kendime zarar'];
  const hasCrisisKeyword = crisisKeywords.some(kw => 
    message.toLowerCase().includes(kw)
  );
  
  if (hasCrisisKeyword) {
    // Acil durum yanıtı ekle
    const emergencyResponse = aiResponse + "\n\n⚠️ Acil destek için ALO 182 (Psikolojik Danışma Hattı) veya 112'yi arayabilirsiniz.";
    
    // Firestore'a kaydet
    await admin.firestore()
      .collection('users').doc(userId)
      .collection('chats').add({
        message: emergencyResponse,
        role: 'assistant',
        isCrisis: true,
        timestamp: admin.firestore.FieldValue.serverTimestamp()
      });
    
    return { response: emergencyResponse, isCrisis: true };
  }
  
  // Normal yanıtı Firestore'a kaydet
  await admin.firestore()
    .collection('users').doc(userId)
    .collection('chats').add({
      message: aiResponse,
      role: 'assistant',
      timestamp: admin.firestore.FieldValue.serverTimestamp()
    });
  
  return { response: aiResponse };
});
```

#### 3. Bağlam Hafızası Yönetimi
```dart
// Flutter tarafında - Son N mesajı al
Future<List<Map<String, String>>> getRecentMessages(int limit) async {
  final snapshot = await FirebaseFirestore.instance
    .collection('users/${userId}/chats')
    .orderBy('timestamp', descending: true)
    .limit(limit)
    .get();
  
  return snapshot.docs.map((doc) => {
    'role': doc['role'],
    'content': doc['message']
  }).toList().reversed.toList();
}
```

### Performans Optimizasyonları

#### 1. Caching Stratejisi
```javascript
// Benzer soruları cache'le (Redis veya Firebase)
const cacheKey = crypto.createHash('md5').update(message).digest('hex');
const cached = await getFromCache(cacheKey);
if (cached) return { response: cached, fromCache: true };
```

#### 2. Stream Yanıtları (Real-time)
```dart
// Flutter - Firestore stream ile gerçek zamanlı mesaj
StreamBuilder<QuerySnapshot>(
  stream: FirebaseFirestore.instance
    .collection('users/${userId}/chats')
    .orderBy('timestamp')
    .snapshots(),
  builder: (context, snapshot) {
    if (!snapshot.hasData) return CircularProgressIndicator();
    return ListView(children: snapshot.data!.docs.map(...).toList());
  },
)
```

#### 3. Token Optimizasyonu
- Gereksiz konuşma geçmişi gönderilmemesi
- Özetleme: Uzun konuşmalar özetlenip context olarak verilir
- Sliding window: Sadece son N mesaj

### Maliyet İzleme ve Yönetimi

```javascript
// Her AI call sonrası maliyet logla
await admin.firestore().collection('analytics').add({
  userId: userId,
  model: model,
  tokensUsed: completion.usage.total_tokens,
  cost: calculateCost(completion.usage),
  timestamp: admin.firestore.FieldValue.serverTimestamp()
});
```

---

### Altyapı ve DevOps

#### Hosting & Altyapı
Tüm backend servisleri, veritabanı, dosya depolama ve bildirimler Firebase üzerinde barındırılır.
- Başka bir sunucuya veya harici cloud’a ihtiyaç yoktur.
- Geliştirme/test için Firebase Emulator Suite genellikle yeterlidir.

#### CI/CD
- **GitHub Actions** veya **GitLab CI** (Flutter build ve test otomasyonu için)
- Otomatik test, linter ve deployment pipeline’ı.
- Uygulama marketlerine yükleme için standart Flutter süreçleri (Google Play Console, App Store Connect)


---

## 🤖 Fine-Tuning Süreci ve Veri Seti Hazırlığı

### Fine-Tuning Genel Bakış
Fine-tuning, önceden eğitilmiş büyük dil modellerini (LLM) belirli bir görev için özelleştirme sürecidir. Uygulamamız için psikolojik destek verme görevi için model özelleştirilecektir.

### Veri Seti Hazırlığı

#### Veri Seti İçeriği ve Yapısı
**Format:** JSON Lines (.jsonl) formatında, her satır bir eğitim örneği
```json
{"messages": [
  {"role": "system", "content": "Sen PsiKolay adlı empatik bir psikolojik destek asistanısın. Türkçe konuşursun ve kullanıcılara psikolojik destek sunarsın."},
  {"role": "user", "content": "Bugün kendimi çok yalnız hissediyorum."},
  {"role": "assistant", "content": "Yalnızlık hissetmek zor bir duygu. Bu duyguyu yaşadığın için üzgünüm. Bu duyguyu ne zamandan beri hissediyorsun?"}
]}
```

#### Veri Kaynakları
1. **Profesyonel Psikolojik Diyaloglar:**
   - Etik onay alınmış, anonimleştirilmiş terapi diyalogları
   - Psikologlarca gözden geçirilmiş örnek konuşmalar
   
2. **Bilişsel Davranışçı Terapi (BDT) Senaryoları:**
   - BDT tekniklerini içeren örnek diyaloglar
   - Düşünce-duygu-davranış bağlantısı örnekleri
   
3. **Kriz Yönetimi Örnekleri:**
   - İntihar riski tespiti ve yönlendirme
   - Panik atak yönetimi
   - Acil durum protokolleri
   
4. **Mindfulness ve Rahatlama Teknikleri:**
   - Nefes egzersizleri rehberlikleri
   - Meditasyon önerileri
   - Rahatlama tekniklerinin açıklamaları

#### Veri Seti Gereksinimleri
- **Minimum Örnek Sayısı:** 500-1000 kaliteli diyalog örneği (OpenAI önerisi)
- **Optimum Örnek Sayısı:** 2000-5000 örnek (daha iyi sonuçlar için)
- **Çeşitlilik:** Farklı ruh halleri, durumlar, yaş grupları
- **Denge:** Her kategoriden dengeli örnekler
- **Kalite Kontrolü:** Her örnek en az 2 psikolog tarafından gözden geçirilmeli

#### Veri Seti Kategorileri ve Dağılımı
| Kategori | Oran | Örnek Sayısı (2000 toplam) |
|----------|------|----------------------------|
| Genel Destek ve Empati | 30% | 600 |
| Anksiyete ve Stres | 20% | 400 |
| Depresyon ve Üzüntü | 15% | 300 |
| İlişki Sorunları | 15% | 300 |
| Öfke Yönetimi | 10% | 200 |
| Kriz Durumları | 5% | 100 |
| Mindfulness ve Egzersizler | 5% | 100 |

### Fine-Tuning Süreci

#### Adım 1: Veri Hazırlığı
1. Ham verileri toplama
2. Anonimleştirme ve gizlilik kontrolü
3. JSONL formatına dönüştürme
4. Train/validation split (%90/%10)
5. Veri kalite kontrolü

#### Adım 2: Model Seçimi
**Ücretsiz Kullanıcılar için:**
- GPT-3.5-turbo fine-tuned
- Maliyet etkin
- Hızlı yanıt süresi

**Premium Kullanıcılar için:**
- GPT-4 fine-tuned veya GPT-4o fine-tuned
- Daha detaylı ve empatik yanıtlar
- Gelişmiş bağlam anlama

**Alternatif (Kendi Modelimiz):**
- Llama 3.1 veya Mistral fine-tuned
- Kendi sunucularımızda barındırma
- Tam kontrol ve gizlilik

#### Adım 3: Fine-Tuning Parametreleri
```python
# OpenAI Fine-Tuning örnek parametreler
{
  "model": "gpt-3.5-turbo",
  "training_file": "file-abc123",
  "validation_file": "file-xyz789",
  "hyperparameters": {
    "n_epochs": 3,
    "batch_size": 8,
    "learning_rate_multiplier": 0.1
  }
}
```

#### Adım 4: Eğitim ve Değerlendirme
1. Fine-tuning işlemini başlatma (OpenAI API veya kendi altyapımız)
2. Training loss ve validation loss izleme
3. Overfitting kontrolü
4. Model performans metrikleri
   - Empati skoru
   - Yanıt uygunluğu
   - Güvenlik skoru
   - Türkçe dil kalitesi

#### Adım 5: Test ve Validasyon
1. Test seti üzerinde değerlendirme
2. Psikologlarla birlikte manuel inceleme
3. A/B testing (eski model vs yeni model)
4. Kullanıcı feedback toplama
5. Edge case testleri (kriz durumları)

#### Adım 6: Deployment
1. Üretim ortamına model deployment
2. API endpoint oluşturma
3. Firebase Functions entegrasyonu
4. Monitoring ve logging kurulumu
5. Rollback planı hazırlama

### Continuous Fine-Tuning (Sürekli İyileştirme)

#### Veri Toplama Döngüsü
1. **Kullanıcı Etkileşimleri:** (Anonimleştirilmiş, izinli)
   - Olumlu feedback alan konuşmalar
   - Düzeltilmiş/iyileştirilmiş yanıtlar
   
2. **Psikolog İncelemesi:**
   - Haftalık konuşma örnekleri incelemesi
   - Yeni eğitim örnekleri oluşturma
   
3. **Yeniden Eğitim:**
   - Aylık veya çeyrek dönemlik model güncellemeleri
   - Yeni verilerle fine-tuning
   - A/B testing ile karşılaştırma

### Maliyet Tahmini (Fine-Tuning)

#### OpenAI Fine-Tuning Maliyetleri (Tahmini)
**GPT-3.5-turbo Fine-Tuning:**
- Training: $0.008 / 1K tokens
- Usage: $0.012 / 1K tokens (input), $0.016 / 1K tokens (output)
- 2000 örnek, ortalama 200 token/örnek = 400K token
- İlk eğitim maliyeti: ~$3.2
- Aylık usage (10K kullanıcı, günde 10 mesaj): ~$480-800

**GPT-4 Fine-Tuning:**
- Daha yüksek maliyet (henüz tam fiyatlandırma açıklanmadı)
- Sadece premium kullanıcılar için

#### Alternatif: Kendi Modelimiz
**Açık Kaynak Model (Llama 3.1-8B):**
- Fine-tuning: GPU sunucu maliyeti (tek seferlik veya aylık)
- Barındırma: Kendi sunucumuz veya cloud GPU ($0.50-2/saat)
- Daha yüksek başlangıç maliyeti, uzun vadede daha ekonomik
- Tam gizlilik ve kontrol

### Güvenlik ve Etik Kontroller

#### Fine-Tuning Güvenlik Önlemleri
1. **Veri Gizliliği:**
   - Tüm veriler anonimleştirilmiş
   - Kişisel bilgiler kaldırılmış
   - KVKK/GDPR uyumlu

2. **Bias Kontrolü:**
   - Cinsiyet, yaş, etnik köken bias testi
   - Dengeli veri seti
   - Çeşitli perspektifler

3. **Zararlı İçerik Kontrolü:**
   - Fine-tuning öncesi veri temizliği
   - Zararlı içerik filtresi
   - Content moderation API entegrasyonu

4. **Etik İnceleme:**
   - Etik kurul onayı
   - Psikolog danışmanlığı
   - Kullanıcı izinleri

---

## 🎨 UI/UX Gereksinimleri

### Design Principles
1. **Sakinlik ve Huzur**: Soft renkler, rahatlatıcı görseller
2. **Erişilebilirlik**: WCAG 2.1 AA standardı
3. **Basitlik**: Minimum 2 dokunuşla ana özelliklere erişim
4. **Tutarlılık**: Tüm ekranlarda aynı design language

### Color Palette

**Primary (Huzur - Mavi tonları):**
- Primary: `#4A90E2` (Açık mavi)
- Primary Dark: `#2E5C8A`
- Primary Light: `#E8F4FD`

**Secondary (Denge - Yeşil tonları):**
- Secondary: `#7BC043` (Açık yeşil)
- Secondary Dark: `#5A9032`

**Status Colors:**
- Success: `#4CAF50`
- Warning: `#FFC107`
- Error: `#F44336`
- Info: `#2196F3`

**Mood Colors (Ruh hali için):**
- Çok Mutlu: `#FFD700` (Gold)
- Mutlu: `#4CAF50` (Green)
- Normal: `#2196F3` (Blue)
- Üzgün: `#9E9E9E` (Grey)
- Çok Üzgün: `#5C6BC0` (Dark Blue)
- Öfkeli: `#FF5722` (Deep Orange)
- Kaygılı: `#FF9800` (Orange)

**Neutral:**
- Background Light: `#F5F7FA`
- Background Dark: `#1A1D29`
- Text Primary: `#212121`
- Text Secondary: `#757575`
- Border: `#E0E0E0`

### Typography
- **Primary Font**: Inter / SF Pro (iOS), Roboto (Android)
- **Heading**: 24-32px, Bold
- **Subheading**: 18-20px, Semi-bold
- **Body**: 14-16px, Regular
- **Caption**: 12-14px, Regular

### Spacing System (8px grid)
- xs: 4px
- sm: 8px
- md: 16px
- lg: 24px
- xl: 32px
- 2xl: 48px

### Iconography
- **Material Icons** (Flutter'da varsayılan gelir, Android/genel için)
- **Cupertino Icons** (iOS stili için)
- Ekstra ikon ihtiyacı için: `font_awesome_flutter` veya `flutter_vector_icons` paketleri
- Varsayılan ikon boyutu: 24x24px
- Outline/icon style tercihe ve temaya göre seçilebilir

### Animations
- **Page transitions**: 300ms ease-in-out
- **Button press**: 100ms scale + haptic
- **Loading states**: Skeleton loaders
- **Microinteractions**: Delightful feedback

---

## 📱 Ekran Akışları ve Wireframes

### 1. Onboarding Flow
```
Splash Screen
   ↓
Welcome Screen (3 slides)
   ↓
Sign Up / Login
   ↓
Profile Setup (ad, yaş, hedefler)
   ↓
Bildirim İzinleri
   ↓
Ana Ekran (Dashboard)
```

### 2. Ana Navigasyon (Tab Bar)
```
┌─────────────────────────────────┐
│                                 │
│       [Aktif Ekran]             │
│                                 │
└─────────────────────────────────┘
┌─────┬─────┬─────┬─────┬─────┐
│ Ana │Chat │  +  │İçgö │Ayar │
│ Sayfa│    │Kayıt│rüler│lar │
└─────┴─────┴─────┴─────┴─────┘
```

### 3. Ana Ekran (Dashboard) Layout
```
┌─────────────────────────────────┐
│ 👋 Merhaba, [İsim]              │
│ Bugün nasıl hissediyorsun?      │
├─────────────────────────────────┤
│ [😊] [😐] [😢] [😰] [😡]        │
│   Ruh Halini Kaydet            │
├─────────────────────────────────┤
│ 📊 Haftalık Durum Analizi       │
│  ┌───────────────────────────┐  │
│  │   [Çizgi Grafik]          │  │
│  │                           │  │
│  └───────────────────────────┘  │
│  Ortalama: 😊 7.2/10            │
├─────────────────────────────────┤
│ 🎯 Bugünün Önerisi              │
│ "5 dakikalık nefes egzersizi    │
│  yapmayı deneyin..."            │
└─────────────────────────────────┘
```

### 4. Chat Ekranı Layout
```
┌─────────────────────────────────┐
│ ← PsiKolay AI            […]    │
├─────────────────────────────────┤
│                                 │
│     ┌─────────────────┐         │
│     │ AI mesajı burada│ 14:23   │
│     │ gösterilir...   │         │
│     └─────────────────┘         │
│                                 │
│         ┌─────────────────┐     │
│   14:25 │Kullanıcı mesajı │     │
│         │burada...        │     │
│         └─────────────────┘     │
│                                 │
├─────────────────────────────────┤
│ [📎] ┌──────────────────┐ [🎤] │
│      │ Mesaj yaz...     │      │
│      └──────────────────┘      │
└─────────────────────────────────┘
```

**Premium Limit Modal:**
```
┌─────────────────────────────────┐
│        🔒 Limit Doldu           │
│                                 │
│  Günlük ücretsiz mesaj limitin │
│  doldu. Premium'a geçerek       │
│  sınırsız erişim sağla!         │
│                                 │
│  ✓ Sınırsız mesaj               │
│  ✓ Gelişmiş AI                  │
│  ✓ Özel programlar              │
│                                 │
│  [Premium'a Geç - ₺99/ay]      │
│  [Yarın Tekrar Dene]            │
└─────────────────────────────────┘
```

### 5. Ayarlar Ekranı Layout
```
┌─────────────────────────────────┐
│ ← Ayarlar                       │
├─────────────────────────────────┤
│ ┌─────┐                         │
│ │ [📷]│ [İsim Soyisim]          │
│ └─────┘ Premium Üye ⭐          │
├─────────────────────────────────┤
│ 👤 Profil Ayarları        >     │
│ 🔔 Bildirimler            >     │
│ 🔒 Gizlilik ve Güvenlik   >     │
│ 🌙 Görünüm (Koyu Mod)     ⚫    │
│ 💳 Premium Yönetimi       >     │
│ ❓ Yardım ve Destek       >     │
│ 📊 Verilerim              >     │
│ 🚪 Çıkış Yap                    │
└─────────────────────────────────┘
```

---

## 🔐 Güvenlik ve Uyumluluk

### Veri Güvenliği
1. **Encryption:**
   - HTTPS/TLS (transit encryption)
   - AES-256 (at-rest encryption)
   - End-to-end encryption (planlanıyor)

2. **Authentication:**
   - JWT tokens (15 min access, 7 day refresh)
   - Secure password policy (min 8 char, uppercase, number, symbol)
   - Biometric auth support
   - 2FA (opsiyonel)

3. **Authorization:**
   - Role-based access control (user, premium, admin)
   - Resource-level permissions

4. **API Security:**
   - Rate limiting (100 req/15min free, 1000 req/15min premium)
   - Input validation ve sanitization
   - SQL injection koruması (parameterized queries)
   - XSS koruması
   - CSRF tokens

### Gizlilik (KVKK/GDPR Uyumu)

1. **Veri Toplama:**
   - Explicit consent
   - Minimal data collection
   - Purpose limitation
   - Transparent privacy policy

2. **Kullanıcı Hakları:**
   - Veri erişim hakkı (data export)
   - Düzeltme hakkı
   - Silme hakkı (right to be forgotten)
   - Veri taşınabilirliği

3. **Veri Saklama:**
   - Active users: süresiz (consent ile)
   - Deleted accounts: 30 gün grace period, sonra kalıcı silme
   - Anonymized analytics: süresiz

4. **Third-party Sharing:**
   - Hiçbir kişisel veri üçüncü partilerle paylaşılmaz
   - Analytics: anonymous data only
   - Payment: tokenized data

### Sağlık Verileri Uyumu
- **Not:** Uygulama medikal tavsiye vermez (disclaimer)
- Kriz durumlarında profesyonel yardım önerisi
- Mental health resources listesi
- İçerik moderasyon (zararlı içerik filtreleme)

### Yasal Gereklilikler
- Kullanım Şartları
- Gizlilik Politikası
- Çerez Politikası
- KVKK Aydınlatma Metni
- Kullanıcı onayları (checkbox)

---

## 🚧 Riskler ve Varsayımlar

### Teknik Riskler

**1. Fine-Tuned Model Yanıt Kalitesi ve Güvenliği**
- **Risk:** Fine-tuned modelin zararlı veya uygunsuz yanıtlar vermesi
- **Mitigation:** 
  - Fine-tuning veri seti dikkatli seçilmesi ve temizlenmesi
  - Profesyonel psikologlarla veri seti validasyonu
  - Zararlı içerik örnekleriyle negatif örneklem eğitimi
  - Çoklu güvenlik katmanları
  - Content moderation API (yanıt sonrası kontrol)
  - Human-in-the-loop review (initial phase)
  - Continuous fine-tuning (yeni örneklerle model güncelleme)
  - A/B testing ile model versiyonlarını karşılaştırma
  - Kullanıcı feedback sistemi (yanıtları derecelendirme)

**2. Fine-Tuning ve API Maliyetleri**
- **Risk:** Fine-tuning maliyetleri ve API kullanım maliyetlerinin beklenenin üzerinde olması
- **Mitigation:**
  - Freemium model ile kontrollü kullanım
  - Fine-tuning için kaliteli ama optimize edilmiş veri seti (gereksiz örnekler çıkarılmış)
  - Yanıt caching stratejileri (benzer sorular için)
  - Rate limiting (ücretsiz: günlük 20 mesaj, premium: unlimited)
  - Model seçimi: GPT-3.5-turbo fine-tuned (ekonomik) vs GPT-4 fine-tuned (premium)
  - Kendi modelimizi fine-tune etme opsiyonu (açık kaynak modeller)
  - Token optimizasyonu (gereksiz context gönderilmemesi)

**3. Performans ve Ölçeklenebilirlik**
- **Risk:** Kullanıcı sayısı artarken performans düşüşü
- **Mitigation:**
  - Horizontal scaling
  - Load balancing
  - Database indexing
  - Caching (Redis)
  - CDN kullanımı

**4. Veri Güvenliği Açıkları**
- **Risk:** Hassas psikolojik verilerin sızması
- **Mitigation:**
  - Güçlü encryption
  - Regular security audits
  - Penetration testing
  - Compliance checks

### İş Riskleri

**1. Düşük Conversion Rate**
- **Risk:** Free kullanıcıların premium'a geçmemesi
- **Mitigation:**
  - A/B testing (pricing, features)
  - Value proposition optimization
  - Referral programs
  - Limited-time offers

**2. Yasal Sorunlar**
- **Risk:** Sağlık danışmanlığı yasal sorunları
- **Mitigation:**
  - Açık disclaimer'lar
  - "Medikal tavsiye değildir" uyarıları
  - Yasal danışmanlık
  - T&C ve Privacy Policy

**3. Rekabet**
- **Risk:** Benzer uygulamaların piyasaya çıkması
- **Mitigation:**
  - Sürekli yenilik
  - Community building
  - Türkçe içerik avantajı
  - Hızlı iteration

**4. Kullanıcı Benimsemesi**
- **Risk:** Hedef kullanıcıların uygulamayı benimsememesi
- **Mitigation:**
  - User research
  - Beta testing ve feedback
  - Marketing strategy
  - Influencer partnerships

### Varsayımlar

1. **Pazar Talebi:** Türkiye'de dijital psikolojik destek talebi var ve artıyor
2. **Teknoloji Kabulü:** Hedef kitle AI ile konuşmaya açık
3. **Ödeme İstekliliği:** Kullanıcılar değer görürlerse ödemeye hazır
4. **API Erişimi:** OpenAI API erişimi sürekli ve kararlı olacak
5. **Yasal Uygunluk:** Mevcut çerçevede uygulama yasal sorun yaşamayacak

---

## 📚 Ekler ve Referanslar

### Teknoloji Dokümantasyonu

**Flutter & Mobil Geliştirme:**
- [Flutter & Dart Documentation](https://docs.flutter.dev/)
- [Flutter Packages (pub.dev)](https://pub.dev/)
- [Firebase Documentation for Flutter](https://firebase.flutter.dev/)
- [Flutter State Management (Provider/Riverpod)](https://docs.flutter.dev/data-and-backend/state-mgmt)

**AI ve Fine-Tuning:**
- [OpenAI API Documentation](https://platform.openai.com/docs)
- [OpenAI Fine-Tuning Guide](https://platform.openai.com/docs/guides/fine-tuning)
- [Hugging Face Fine-Tuning](https://huggingface.co/docs/transformers/training)
- [LangChain Documentation](https://docs.langchain.com/)

**Backend ve Veritabanı:**
- [Firebase Documentation](https://firebase.google.com/docs)
- [Firestore Security Rules](https://firebase.google.com/docs/firestore/security/get-started)
- [Firebase Functions](https://firebase.google.com/docs/functions)

**Ödeme Entegrasyonu:**
- [Stripe API Documentation](https://stripe.com/docs/api)
- [Iyzico API Documentation](https://dev.iyzipay.com/)

### Design Resources
- [Material Design](https://material.io/)
- [iOS Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/)
- [Figma Community Files](https://www.figma.com/community)

### Psikoloji Kaynakları
- Bilişsel Davranışçı Terapi (BDT) prensipleri
- Mindfulness ve farkındalık teknikleri
- Duygu düzenleme stratejileri
- Kriz müdahale protokolleri

### Yasal ve Uyumluluk
- [KVKK (Türkiye)](https://www.kvkk.gov.tr/)
- [GDPR Guidelines](https://gdpr.eu/)
- App Store Review Guidelines
- Google Play Policies


**Gözden Geçirme Checklist:**
- [ ] Özellikler tam ve net mi?
- [ ] Teknik stack uygun mu?
- [ ] Yasal gereklilikler belirlendi mi?
- [ ] Başarı metrikleri ölçülebilir mi?

---

## 📝 Döküman Versiyon Geçmişi

| Versiyon | Tarih | Değişiklikler | Yazar |
|----------|-------|---------------|-------|
| 1.0.0 | Ekim 2025 | İlk versiyon | TÜBİTAK 2209-A Ekibi |
| 1.1.0 | Ocak 2026 | RAG yerine Fine-Tuning yaklaşımına geçiş, detaylı fine-tuning süreci eklendi, Flutter-Firebase-AI entegrasyon akışı eklendi | TÜBİTAK 2209-A Ekibi |

---

## 📞 İletişim ve Destek

**Proje Yöneticisi:** [İsim]  
**Email:** [email@example.com]  
**GitHub:** [repository-link]  
**Slack/Discord:** [workspace-link]

---

**Son Güncelleme:** Ocak 2026  
**Durum:** ✅ Fine-Tuning Yaklaşımı ile Güncellenmiş - Geliştirme Aşamasında

---

*Bu döküman proje geliştikçe güncellenecektir. Tüm değişiklikler versiyon geçmişinde kayıt altına alınacaktır.*

