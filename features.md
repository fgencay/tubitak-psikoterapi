# Features - Psikolojik Asistan Mobil Uygulama

## 📱 Özellikler Dokümantasyonu

Bu döküman, PsiKolay uygulamasının tüm mevcut ve planlanan özelliklerini detaylı bir şekilde içermektedir.

**Son Güncelleme:** Ekim 2025  
**Versiyon:** 1.0.0

---

## 📑 İçindekiler

1. [Kimlik Doğrulama ve Onboarding](#1-kimlik-doğrulama-ve-onboarding)
2. [Chat ve AI Konuşma](#2-chat-ve-ai-konuşma)
3. [Ruh Hali Takibi](#3-ruh-hali-takibi)
4. [Dashboard ve Analizler](#4-dashboard-ve-analizler)
5. [Kullanıcı Profili ve Ayarlar](#5-kullanıcı-profili-ve-ayarlar)
6. [Premium ve Abonelik](#6-premium-ve-abonelik)
7. [Bildirimler](#7-bildirimler)
8. [Güvenlik ve Gizlilik](#8-güvenlik-ve-gizlilik)
9. [Gamification](#9-gamification)

---

## 1. Kimlik Doğrulama ve Onboarding

### 1.1 Kayıt ve Giriş

#### ✅ MVP (Faz 1)
- **Email/Şifre ile Kayıt**
  - Email validasyonu
  - Güçlü şifre gereksinimleri (min 8 karakter, büyük harf, rakam, özel karakter)
  - Email doğrulama kodu gönderimi
  - Şifre görünürlük toggle

- **Email/Şifre ile Giriş**
  - Remember me özelliği
  - Otomatik giriş (biometric)
  - Şifremi unuttum akışı

- **Sosyal Medya ile Giriş**
  - Google OAuth
  - Apple Sign In (iOS için zorunlu)

#### 🔄 Gelecek Fazlar (Faz 2-3)
- **Telefon Numarası ile Kayıt**
  - SMS doğrulama
  - OTP (One Time Password)

- **Biometric Authentication**
  - Face ID (iOS)
  - Touch ID
  - Fingerprint (Android)

- **İki Faktörlü Doğrulama (2FA)**
  - Authenticator app desteği
  - SMS 2FA
  - Email 2FA

### 1.2 Onboarding Süreci

#### ✅ MVP (Faz 1)
- **Welcome Screens (3 Adım)**
  - Adım 1: Uygulama tanıtımı
  - Adım 2: Özellikler ve faydalar
  - Adım 3: Gizlilik ve güvenlik vurgusu
  - Skip/Atla butonu

- **Profil Kurulumu**
  - İsim girişi (zorunlu)
  - Yaş aralığı seçimi (zorunlu)
  - Cinsiyet (opsiyonel)
  - Profil fotoğrafı (opsiyonel)

- **Hedef Belirleme**
  - Kullanım amacı seçimi (çoklu seçim)
    - Stres yönetimi
    - Kaygı azaltma
    - Depresyon desteği
    - Uyku kalitesi
    - İlişki sorunları
    - Öfke yönetimi
    - Özgüven geliştirme
    - Diğer

- **İzin İstekleri**
  - Bildirim izni
  - Veri kullanımı onayı (KVKK)
  - Kullanım şartları ve gizlilik politikası kabul

#### 🔄 Gelecek Fazlar (Faz 3-4)
- **Gelişmiş Profil Kurulumu**
  - Psikolojik değerlendirme anketi (PHQ-9, GAD-7)
  - Terapi geçmişi
  - İlaç kullanımı bilgisi
  - Tetikleyici durumlar

- **Kişiselleştirilmiş Yol Haritası**
  - Hedeflere göre özelleştirilmiş plan
  - Önerilen etkinlikler
  - İlk görüşme randevusu

- **Onboarding Turu**
  - İnteraktif uygulama turu
  - Özellik spotlights
  - Tooltip'ler

---

## 2. Chat ve AI Konuşma

### 2.1 Temel Chat Özellikleri

#### ✅ MVP (Faz 1)
- **Mesajlaşma Arayüzü**
  - WhatsApp-benzeri UI/UX
  - Mesaj baloncukları (kullanıcı sağda, AI solda)
  - Zaman damgaları
  - Mesaj durumu (gönderildi, iletildi, okundu)
  - Yazıyor göstergesi (typing indicator)
  - Scroll to bottom butonu

- **Mesaj Gönderme**
  - Metin mesaj gönderme
  - Enter ile gönder / Shift+Enter ile yeni satır
  - Karakter sınırı (örn: 2000 karakter)
  - Boş mesaj engelleme

- **Mesaj Alma**
  - AI'dan yanıt alma
  - Streaming response (kelime kelime görünüm)
  - Yanıt süresi göstergesi

- **Konuşma Geçmişi**
  - Sonsuz scroll
  - Tarih seperatörleri
  - Oturum bazlı gruplama
  - Son mesaja otomatik scroll

#### 🔄 Gelecek Fazlar (Faz 2-3)
- **Zengin Medya Desteği**
  - Emoji picker
  - Resim yükleme
  - Ses kaydı gönderme
  - Video mesaj (premium)

- **Mesaj İşlemleri**
  - Mesaj kopyalama
  - Mesaj favorilere ekleme
  - Mesaj paylaşma
  - Mesajı raporla (zararlı içerik)

- **Gelişmiş Chat Özellikleri**
  - Sesli mesaj dinleme
  - Mesaj arama (içerik bazlı)
  - Mesaj etiketleme
  - Mesaj thread'leri
  - Mesaj alıntılama (quote)

### 2.2 AI Yanıt Özellikleri

#### ✅ MVP (Faz 1)
- **Temel AI Yanıtları**
  - Türkçe doğal dil işleme
  - Bağlam farkındalığı (son 5 mesaj)
  - Empatik ton
  - Basit öneriler

- **Freemium Limitleri**
  - Günlük 10 mesaj limiti (ücretsiz)
  - Limit dolunca uyarı modal'ı
  - Premium'a yönlendirme
  - Kalan mesaj sayısı göstergesi

#### 🔄 Gelecek Fazlar (Faz 2-3)
- **Finetune Edilmiş Model Destekli Yanıtlar**
  - Psikoloji literatürü tabanlı yanıtlar
  - BDT (Bilişsel Davranışçı Terapi) teknikleri
  - Mindfulness egzersizleri
  - Nefes teknikleri
  - Gevşeme egzersizleri

- **Duygu Analizi**
  - Kullanıcının duygusal durumunu tespit
  - Yanıtları duygusal duruma göre uyarlama
  - Duygu geçişlerini izleme
  - Kriz durumu tespiti

- **Kriz Müdahale**
  - İntihar düşüncesi tespiti
  - Kendine zarar verme tespiti
  - Panik atak tespiti
  - Acil destek hatları önerisi
  - Profesyonel yardım yönlendirmesi

- **Konuşma Stili Seçenekleri**
  - Profesyonel ton
  - Arkadaşça ton
  - Motive edici ton
  - Sakinleştirici ton

- **Çoklu Dil Desteği**
  - İngilizce
  - Almanca (gelecekte)
  - Fransızca (gelecekte)

### 2.3 Konuşma Yönetimi

#### ✅ MVP (Faz 1)
- **Temel Yönetim**
  - Yeni konuşma başlatma
  - Aktif konuşma gösterimi
  - Konuşma silme (tüm geçmiş)

#### 🔄 Gelecek Fazlar (Faz 2-4)
- **Gelişmiş Yönetim**
  - Konuşma oturumları (sessions)
  - Oturum başlıklandırma
  - Oturum arşivleme
  - Oturum arama


- **Konuşma Templatları**
  - Hızlı başlangıç soruları
  - Sık sorulan sorular
  - Konu önerileri
  - Günlük check-in prompts

- **Konuşma Özeti**
  - AI destekli konuşma özeti
  - Ana noktalar çıkarımı
  - Eylem öğeleri (action items)
  - Duygusal yolculuk özeti

---

## 3. Ruh Hali Takibi

### 3.1 Günlük Ruh Hali Kaydı

#### ✅ MVP (Faz 1)
- **Temel Kayıt**
  - Emoji seçimi (😊 😐 😢 😰 😡 😴 😟)
  - 1-10 arası slider
  - Basit not ekleme (opsiyonel)
  - Hızlı kaydetme


#### 🔄 Gelecek Fazlar (Faz 2-4)
- **Detaylı Kayıt**
  - Renkli buton seçenekleri
  - Çoklu duygu seçimi
  - Duygu yoğunluğu seçimi
  - Tetikleyiciler (ne hissettirdi)
    - Çalışma
    - İlişkiler
    - Sağlık
    - Finans
    - Aile
    - Sosyal
    - Diğer

- **Ek Veriler**
  - Enerji seviyesi (1-10)
  - Uyku kalitesi (1-10)
  - Uyku süresi (saat)
  - Fiziksel aktivite (var/yok)
  - Aktivite türü
  - Meditasyon (var/yok)

- **Hatırlatıcılar**
  - Günlük bildirim
  - Özelleştirilebilir saat
  - Çoklu hatırlatıcı
  - Akıllı hatırlatıcı (kullanıcı davranışına göre)

- **Ses ve Video Günlük**
  - Sesli not kaydetme
  - Video günlük (premium)
  - Transkripsyon

### 3.2 Ruh Hali Geçmişi

#### ✅ MVP (Faz 1)
- **Basit Görünüm**
  - Liste halinde geçmiş kayıtlar
  - Tarih bazlı listeleme

#### 🔄 Gelecek Fazlar (Faz 2-4)
- **Gelişmiş Görünüm**
  - Takvim görünümü
  - Ay bazlı görünüm
  - Yıl bazlı görünüm
  - Özel tarih aralığı seçimi

- **Filtreleme ve Arama**
  - Duygu durumuna göre filtreleme
  - Tarih aralığı filtreleme
  - Tetikleyicilere göre arama
  - Not içeriğinde arama

- **Kayıt Düzenleme**
  - Geçmiş kayıtları düzenleme
  - Kayıt silme
  - Kayıt kopyalama (başka güne)

---

## 4. Dashboard ve Analizler

### 4.1 Ana Dashboard

#### ✅ MVP (Faz 1)

- **Hızlı Erişim**
  - motivasyon widget'ı
  - Chat başlatma butonu
  - Günün önerisi kartı

#### 🔄 Gelecek Fazlar (Faz 2-4)
- **Gelişmiş Grafikler**
  - Bar grafik (günlük karşılaştırma)
  - Isı haritası (heat map)
  - Radar chart (çoklu boyut)
  - Pie chart (duygu dağılımı)
  - Stacked area chart (katmanlı)

- **Zaman Aralıkları**
  - Son 7 gün
  - Son 30 gün
  - Son 3 ay
  - Son 6 ay
  - Son 1 yıl
  - Tüm zamanlar
  - Özel tarih aralığı

- **Karşılaştırma**
  - Haftalık karşılaştırma
  - Aylık karşılaştırma
  - Yıllık karşılaştırma
  - Geçen yıl ile karşılaştırma


### 4.3 İçgörüler ve Öneriler

#### 🔄 Gelecek Fazlar (Faz 2-4)
- **AI Destekli İçgörüler**
  - Haftalık özet ve yorum
  - Dikkat edilmesi gereken noktalar
  - Olumlu gelişmeler
  - İyileşme önerileri

- **Kişiselleştirilmiş Öneriler**
  - Aktivite önerileri
  - Egzersiz önerileri
  - Meditasyon önerileri
  - Uyku hijyeni önerileri
  - Sosyal aktivite önerileri

- **Hedef Takibi**
  - Haftalık hedef belirleme
  - Hedef ilerleme gösterimi
  - Hedef başarı oranı
  - Rozetler ve ödüller

- **Başarım Bildirimleri**
  - 7 günlük streak
  - 30 günlük streak
  - 100 günlük streak
  - En uzun pozitif dönem
  - İyileşme milestone'ları

---

## 5. Kullanıcı Profili ve Ayarlar

### 5.1 Profil Yönetimi

#### ✅ MVP (Faz 1)
- **Temel Profil Bilgileri**
  - İsim düzenleme
  - Email görüntüleme
  - Profil fotoğrafı yükleme
  - Profil fotoğrafı silme

- **Hesap İşlemleri**
  - Şifre değiştirme
  - Email değiştirme
  - Hesap silme (veri silme ile birlikte)

#### 🔄 Gelecek Fazlar (Faz 2-4)
- **Gelişmiş Profil**
  - Biyografi
  - Yaş (tam tarih)
  - Lokasyon (şehir/ülke)
  - Meslek
  - Medeni durum
  - Çocuk bilgisi

- **Psikolojik Profil**
  - Terapi geçmişi
  - Teşhisler (opsiyonel, kendi beyanı)
  - İlaç kullanımı
  - Alerjiler
  - Acil durum kişisi

- **İlgi Alanları ve Hobiler**
  - Hobiler listesi
  - İlgi alanları
  - Tercih edilen aktiviteler
  - Rahatlatıcı aktiviteler

### 5.2 Uygulama Ayarları

#### ✅ MVP (Faz 1)
- **Görünüm**
  - Açık mod
  - Koyu mod
  - Sistem teması takip et

- **Dil**
  - Türkçe (varsayılan)
  - İngilizce

- **Bildirimler**
  - Bildirimleri aç/kapat
  - Bildirim sesi

#### 🔄 Gelecek Fazlar (Faz 2-4)
- **Gelişmiş Görünüm**
  - Özel temalar (premium)
  - Yazı tipi boyutu (küçük, normal, büyük, çok büyük)
  - Yazı tipi ailesi
  - Renk şemaları
  - Animasyon hızı
  - Haptik feedback şiddeti

- **Erişilebilirlik**
  - Ekran okuyucu optimizasyonu
  - Yüksek kontrast
  - Renk körlüğü modları
  - Disleksi dostu font
  - Düğme boyutu artırma

- **Performans**
  - Animasyonları azalt
  - Düşük veri kullanım modu
  - Otomatik medya indirme
  - Cache temizleme

### 5.3 Bildirim Ayarları

#### ✅ MVP (Faz 1)
- **Temel Bildirimler**
  - Tüm bildirimleri aç/kapat
  - Chat bildirimleri

#### 🔄 Gelecek Fazlar (Faz 2-4)
- **Detaylı Bildirim Ayarları**
  - Ruh hali hatırlatıcıları
    - Sabah hatırlatıcısı
    - Akşam hatırlatıcısı
    - Öğle hatırlatıcısı
    - Özel saatler
  
  - Chat bildirimleri
    - AI yanıt bildirimleri
    - Mesaj bildirimleri
  
  - Haftalık özet
    - Haftanın özeti
    - İlerleme raporu
  
  - Motivasyon bildirimleri
    - Günlük motivasyon
    - Özel günler
    - Streak hatırlatıcıları
  
  - Sessiz saatler
    - Başlangıç saati
    - Bitiş saati
    - Haftanın günleri

- **Bildirim Kanalları**
  - Push notification
  - Email
  - SMS (opsiyonel)

### 5.4 Gizlilik ve Güvenlik

#### ✅ MVP (Faz 1)
- **Temel Güvenlik**
  - Şifre değiştirme
  - Oturum kapatma
  - Hesap silme

- **Yasal Dökümanlar**
  - Gizlilik politikası
  - Kullanım şartları
  - KVKK aydınlatma metni

#### 🔄 Gelecek Fazlar (Faz 2-4)
- **Gelişmiş Güvenlik**
  - İki faktörlü doğrulama (2FA)
  - Biometric lock (uygulama kilidi)
  - Oturum yönetimi (aktif oturumlar)
  - Oturum sonlandırma (tüm cihazlar)
  - Şüpheli aktivite bildirimleri

- **Veri Yönetimi**
  - Verilerimi indir (KVKK hakkı)
    - JSON format
    - PDF format
    - CSV format
  - Veri silme seçenekleri
    - Tüm veriler
    - Sadece chat geçmişi
    - Sadece ruh hali kayıtları
  - Veri saklama süresi ayarı

- **Gizlilik Ayarları**
  - Profil görünürlüğü (gelecekte sosyal özellikler için)
  - Analitik veri paylaşımı (anonim)
  - Kişiselleştirilmiş reklamlar (opsiyonel)

---

## 6. Premium ve Abonelik

### 6.1 Premium Paketler

#### ✅ MVP (Faz 1)
- **Ücretsiz Plan**
  - Günlük 10 mesaj
  - Temel AI yanıtları
  - 7 günlük geçmiş
  - Haftalık grafik
  - Ruh hali kaydı (sınırsız)

#### 🔄 Gelecek Fazlar (Faz 3)
- **Aylık Plan (₺99/ay)**
  - Sınırsız mesaj
  - Gelişmiş AI (finetune)
  - Tüm geçmiş
  - Gelişmiş grafikler
  - Aylık raporlar
  - Öncelikli destek

- **3 Aylık Plan (₺249)**
  - Tüm aylık özellikler
  - %16 indirim
  - 3 ay taahhüt

- **Yıllık Plan (₺799)**
  - Tüm aylık özellikler
  - %33 indirim
  - 1 ay bonus
  - En avantajlı

### 6.2 Premium Özellikleri

#### 🔄 Gelecek Fazlar (Faz 3-4)
- **Chat Özellikleri**
  - Sınırsız mesajlaşma
  - Sesli mesaj desteği
  - Video mesaj desteği
  - Gelişmiş AI modeli
  - Daha hızlı yanıt süresi
  - Öncelikli queue

- **Analiz Özellikleri**
  - Tüm grafik türleri
  - Sınırsız zaman aralığı
  - Karşılaştırmalı analizler
  - Gelişmiş istatistikler
  - Pattern tespiti
  - Tahmin modelleri

- **Raporlama**
  - Aylık detaylı raporlar
  - PDF export
  - Excel export
  - Email ile rapor gönderimi

- **İçerik**
  - Özel telkin programları
  - Guided meditation (rehberli meditasyon)
  - Nefes egzersizleri koleksiyonu
  - Uyku hikayeleri
  - ASMR içerikleri

- **Kişiselleştirme**
  - Özel temalar
  - AI kişilik seçimi
  - Hedef takibi
  - Kişiselleştirilmiş planlar

### 6.3 Abonelik Yönetimi

#### 🔄 Gelecek Fazlar (Faz 3)
- **Satın Alma**
  - Paket seçimi ekranı
  - Fiyat karşılaştırması
  - Özellik karşılaştırması
  - Güvenli ödeme

- **Ödeme Yöntemleri**
  - Kredi kartı
  - Banka kartı
  - Google Pay
  - Apple Pay
  - App Store aboneliği
  - Play Store aboneliği

- **Abonelik Kontrolü**
  - Aktif abonelik gösterimi
  - Kalan süre
  - Yenileme tarihi
  - Kullanım istatistikleri
  - Fatura geçmişi

- **Abonelik İşlemleri**
  - Paket değiştirme
  - Paket yükseltme
  - Paket düşürme
  - Abonelik iptali
  - Yeniden başlatma

- **Promosyonlar**
  - Promosyon kodu girişi
  - İndirim kuponu
  - Referans kodu
  - İlk ay ücretsiz
  - Özel kampanyalar

---

## 7. Bildirimler

### 7.1 Push Notifications

#### ✅ MVP (Faz 1)
- **Temel Bildirimler**
  - Ruh hali kaydı hatırlatıcısı
  - AI mesaj yanıtı

#### 🔄 Gelecek Fazlar (Faz 4)
- **Chat Bildirimleri**
  - AI yanıt hazır
  - Yeni özellik bildirimi

- **Ruh Hali Bildirimleri**
  - Günlük kayıt hatırlatıcısı
  - Öğle check-in
  - Akşam değerlendirme
  - Kayıt unutma uyarısı

- **Motivasyon Bildirimleri**
  - Günün sözü
  - Motivasyonel mesajlar
  - İlerleme kutlamaları
  - Streak hatırlatıcıları

- **Analiz Bildirimleri**
  - Haftalık özet hazır
  - Aylık rapor hazır
  - Trend değişikliği
  - Pattern tespiti

- **Özel Bildirimler**
  - Doğum günü mesajı
  - Yıldönümü kutlaması
  - Başarım rozeti kazanıldı
  - Seviye atlandı

### 7.2 Email Bildirimleri

#### 🔄 Gelecek Fazlar (Faz 4)
- **Haftalık Özet Email**
  - Haftanın özeti
  - Grafikler
  - İstatistikler
  - Öneriler

- **Aylık Rapor Email**
  - Detaylı analiz
  - PDF eki
  - İyileşme önerileri

- **İşlemsel Emailler**
  - Hoş geldiniz email
  - Email doğrulama
  - Şifre sıfırlama
  - Abonelik başlatma
  - Abonelik bitiş uyarısı
  - Fatura/Makbuz

- **Marketing Emailler** (onay ile)
  - Yeni özellik duyuruları
  - Blog yazıları
  - İpuçları ve püf noktaları
  - Özel kampanyalar

### 7.3 In-App Bildirimler

#### 🔄 Gelecek Fazlar (Faz 4)
- **Banner Notifications**
  - Üst banner
  - Alt banner
  - Toast mesajları

- **Modal Bildirimler**
  - Önemli duyurular
  - Özellik tanıtımları
  - Anket istekleri

- **Badge Notifications**
  - Tab bar badge
  - Icon badge
  - Sayı göstergeleri

---

## 8. Güvenlik ve Gizlilik

### 8.1 Veri Güvenliği

#### ✅ MVP (Faz 1)
- **Temel Güvenlik**
  - HTTPS/TLS iletişimi
  - Şifreleme (at-rest)
  - JWT authentication
  - Güvenli şifre politikası

#### 🔄 Gelecek Fazlar (Faz 2-3)
- **Gelişmiş Güvenlik**
  - End-to-end encryption (E2EE)
  - AES-256 şifreleme
  - Biometric authentication
  - 2FA
  - Secure enclave kullanımı

- **API Güvenliği**
  - Rate limiting
  - DDoS koruması
  - SQL injection koruması
  - XSS koruması
  - CSRF token
  - Input sanitization

### 8.2 Gizlilik Özellikleri

#### ✅ MVP (Faz 1)
- **Temel Gizlilik**
  - KVKK uyumu
  - Gizlilik politikası
  - Kullanım şartları
  - Veri toplama onayı

#### 🔄 Gelecek Fazlar (Faz 2-3)
- **Gelişmiş Gizlilik**
  - Veri minimizasyonu
  - Anonim kullanım modu
  - Veri saklama süresi kontrolü
  - Otomatik veri silme
  - Veri taşınabilirliği (data portability)
  - Unutulma hakkı (right to be forgotten)

### 8.3 Kriz Yönetimi

#### 🔄 Gelecek Fazlar (Faz 2)
- **Kriz Tespiti**
  - İntihar düşüncesi kelime tespiti
  - Kendine zarar verme ifadeleri
  - Şiddet belirtileri
  - Panik atak göstergeleri
  - Şiddetli depresyon belirtileri

- **Acil Müdahale**
  - Otomatik acil durum mesajı
  - Destek hatları gösterimi
  - 112 acil arama
  - 182 ALO 182 İntihar Önleme Hattı
  - Yakındaki hastaneler
  - Psikiyatri klinikleri

- **Güvenlik Ağı**
  - Acil durum kişisi ekleme
  - Otomatik bildirim (onay ile)
  - Güvenli plan oluşturma
  - Tetikleyici önleme

---

## 9. Gamification

### 9.1 Rozetler ve Başarımlar

#### 🔄 Gelecek Fazlar (Faz 4)
- **Günlük Rozetler**
  - İlk kayıt
  - 7 günlük streak
  - 30 günlük streak
  - 100 günlük streak
  - 365 günlük streak

- **Aktivite Rozetleri**
  - İlk chat
  - 100. mesaj
  - 1000. mesaj
  - İlk meditasyon
  - 50 meditasyon tamamlama

- **İyileşme Rozetleri**
  - 7 gün pozitif ruh hali
  - 30 gün pozitif ruh hali
  - İlk program tamamlama
  - 10 program tamamlama

### 9.2 Seviye Sistemi

#### 🔄 Gelecek Fazlar (Faz 4)
- **Seviyeler**
  - Seviye 1-100
  - Deneyim puanı (XP)
  - Seviye atlama ödülleri
  - Özel rozetler

- **XP Kazanma**
  - Günlük kayıt: 10 XP
  - Chat mesajı: 5 XP
  - Meditasyon: 20 XP
  - Program tamamlama: 100 XP
  - Haftalık hedef: 50 XP

### 9.3 Liderlik Tablosu

#### 🔄 Gelecek Fazlar (Faz 6+)
- **Sıralamalar** (Opsiyonel, anonim)
  - Haftalık liderler
  - Aylık liderler
  - Tüm zamanlar
  - Arkadaşlar arası
  - Bölgesel

- **Kategoriler**
  - En çok streak
  - En çok meditasyon
  - En aktif
  - En çok iyileşme

---

## 🎯 Özellik Öncelik Matrisi

### Faz 1 - MVP (8 Hafta)
**Zorunlu Özellikler:**
- ✅ Kimlik doğrulama (email/şifre)
- ✅ Temel chat arayüzü
- ✅ Basit AI yanıtları
- ✅ Günlük mesaj limiti (10 mesaj)
- ✅ Ruh hali kaydı (emoji seçimi)
- ✅ Basit haftalık grafik
- ✅ Temel profil ve ayarlar
- ✅ Açık/koyu mod

### Faz 2 - Finetune Edilmiş LLM ve AI (4 Hafta)
**Önemli Özellikler:**
- 🔄 Finetune edilmiş LLM entegrasyonu
- 🔄 Psikoloji temelli yanıtlar
- 🔄 Duygu analizi
- 🔄 Kriz tespiti
- 🔄 Bağlam hafızası
- 🔄 Sosyal giriş (Google, Apple)

### Faz 3 - Premium (3 Hafta)
**İş Kritik Özellikler:**
- 🔄 Abonelik sistemi
- 🔄 Ödeme entegrasyonu (Stripe/Iyzico)
- 🔄 Premium özellikleri kilitleme
- 🔄 Abonelik yönetimi
- 🔄 Fatura sistemi

### Faz 4 - Gelişmiş Özellikler (4 Hafta)
**İyileştirme Özellikleri:**
- 🔄 Gelişmiş grafikler
- 🔄 Bildirim sistemi
- 🔄 Gamification (rozetler)

---

## 📊 Özellik Kompleksitesi ve Değer Analizi

### Yüksek Değer, Düşük Kompleksite
**(Hemen Yapılmalı)**
- Açık/Koyu mod
- Bildirimler
- Ruh hali emojileri
- Basit grafikler
- Sosyal giriş
- Şifre sıfırlama

### Yüksek Değer, Yüksek Kompleksite
**(Dikkatli Planlama Gerekli)**
- Finetune sistemi
- Kriz tespiti
- Premium abonelik

### Düşük Değer, Düşük Kompleksite
**(Zaman Kalırsa)**
- Tema çeşitleri
- Font seçenekleri
- Animasyon ayarları
- Badge sistemi

### Düşük Değer, Yüksek Kompleksite
**(Yapılmayabilir)**
- Video avatar AI
- Gerçek zamanlı grup chat
- Blockchain entegrasyonu

---

## 🚀 Özellik Geliştirme Kılavuzu

Her yeni özellik için şu kriterler değerlendirilmelidir:

### 1. Kullanıcı Değeri
- Bu özellik kullanıcıların ana problemini çözüyor mu?
- Kullanıcı deneyimini ne kadar iyileştiriyor?
- Kullanıcılar bu özellik için ödeme yapar mı?

### 2. Teknik Fizibilite
- Mevcut teknoloji stack ile uyumlu mu?
- Geliştirme süresi ne kadar?
- Maintenance maliyeti nedir?

### 3. İş Değeri
- Gelir artışına katkısı var mı?
- Kullanıcı tutunma oranını artırır mı?
- Rekabet avantajı sağlar mı?

### 4. Risk Değerlendirmesi
- Güvenlik riskleri var mı?
- Yasal riskler var mı?
- Performans etkileri nedir?

---

## 📝 Notlar

- ✅ = MVP'de mevcut
- 🔄 = Gelecek fazlarda planlanmış
- ⭐ = Premium özellik
- 🚨 = Kritik önem
- 🎯 = Yüksek öncelik

---

**Son Güncelleme:** Ekim 2025  
**Toplam Özellik Sayısı:** 100+ özellik  
**MVP Özellik Sayısı:** 25 özellik

*Bu döküman proje ilerledikçe güncellenecektir.*

