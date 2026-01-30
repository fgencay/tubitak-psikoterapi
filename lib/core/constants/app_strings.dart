/// Uygulama içindeki tüm metinler (Türkçe)
class AppStrings {
  // Get Started Ekranı
  static const String getStartedTitle = 'Başlayalım';
  static const String getStartedSubtitle = 
      'Ücretsiz başlayın. İstediğiniz zaman sınırsız mesajlar ve kronolojilere erişim için yükseltin.';
  static const String continueWithApple = 'Apple ile Devam Et';
  static const String continueWithGoogle = 'Google ile Devam Et';
  static const String continueWithPhone = 'Telefon ile Devam Et';
  static const String continueWithEmail = 'E-posta ile Devam Et';
  static const String termsAndPrivacy = 
      'Devam ederek Şartlarımızı ve Gizlilik Politikamızı kabul etmiş olursunuz';
  
  // Telefon Numarası Ekranı
  static const String phoneNumberTitle = 'Telefon numaranız nedir?';
  static const String phoneNumberSubtitle = 
      'Numaranız yalnızca hesabınıza giriş yapmak için kullanılacaktır';
  static const String phoneNumberPlaceholder = 'Telefon Numarası';
  static const String phoneNumberCountryCode = '+90';
  
  // Email Ekranı
  static const String emailTitle = 'E-posta adresiniz nedir?';
  static const String emailSubtitle = 
      'Bu e-postaya giriş işleminizi doğrulamak için bir kod göndereceğiz';
  static const String emailPlaceholder = 'isim@mail.com';
  static const String hideMyEmail = 'E-postamı Gizle';
  
  // Doğrulama Ekranı
  static const String verificationTitle = 'E-postanızı doğrulayın';
  static const String verificationPhoneTitle = 'Telefonunuzu doğrulayın';
  static const String verificationSubtitleEmail = 
      'Lütfen {email} adresine gönderdiğimiz kodu girin';
  static const String verificationSubtitlePhone = 
      'Lütfen {phone} numarasına gönderdiğimiz kodu girin';
  static const String resendCode = 'Kodu tekrar gönder';
  static const String resendInSeconds = '{seconds} saniye içinde tekrar gönder';
  
  // Name (İsim) Ekranı
  static const String nameTitle = 'Adınız nedir?';
  static const String nameSubtitle = 
      'Bu, PsiKolay\'ın size hitap etmek için kullanacağı isim olacak';
  static const String namePlaceholder = 'örn. Ayşe';
  
  // Pronouns (Zamirler) Ekranı
  static const String pronounsTitle = 'Kendini nasıl tanımlarsın?';
  static const String pronounsSubtitle = 
      'Sana en doğru deneyimi sunabilmemiz ve seninle bağ kurabilmemiz için bu bilgiyi bizimle paylaşabilirsin.';
  static const String pronounsPlaceholder = 'örn. o/ona';
  static const String pronounsFemale = 'Kadın';
  static const String pronounsMale = 'Erkek';
  static const String pronounsOther = 'Kendimi farklı tanımlıyorum';
  static const String pronounsPreferNotToSay = 'Belirtmek istemiyorum';
  
  // Doğum Tarihi Ekranı
  static const String birthdayTitle = 'Ne zaman doğdunuz?';
  static const String birthdaySubtitle = 
      'PsiKolay sizi doğum günü hediyesiyle sürpriz yapabilir';
  
  // Bildirim İzinleri Ekranı
  static const String permissionsTitle = 'İzinleri etkinleştir';
  static const String permissionsSubtitle = 
      'PsiKolay aşağıdaki izinlere erişimle en iyi şekilde çalışır';
  static const String notificationsTitle = 'Bildirimler';
  static const String notificationsSubtitle = 
      'PsiKolay\'ın zamanında hatırlatıcılar ve proaktif mesajlar göndermesine izin verir';
  static const String calendarTitle = 'Takvim';
  static const String calendarSubtitle = 
      'PsiKolay\'ın gününüzün nasıl olduğunu görmesine ve ilerisini planlamanıza yardımcı olmasına izin verir';
  static const String locationTitle = 'Konum';
  static const String locationSubtitle = 
      'PsiKolay\'ın konumunuza göre önerileri kişiselleştirmesine izin verir';
  
  // Genel
  static const String continueButton = 'Devam Et';
  static const String backButton = 'Geri';
  static const String skip = 'Atla';
  static const String next = 'İleri';
  
  // Ana Ekran
  static const String goodMorning = 'Günaydın';
  static const String goodEvening = 'İyi akşamlar';
  static const String howAreYouFeeling = 'Bugün nasıl hissediyorsun?';
  static const String selectYourMood = 'Ruh halini seç';
  static const String todaysQuote = 'Günün Sözü';
  static const String defaultQuote = 
      'Her gün yeni bir başlangıçtır. Bugün kendiniz için ne yapabilirsiniz?';
  
  // Bottom Navigation
  static const String navHome = 'Ana Sayfa';
  static const String navChat = 'Sohbet';
  static const String navProfile = 'Profil';
  
  // Ruh Hali Emojileri
  static const String moodVeryHappy = 'Çok Mutlu';
  static const String moodHappy = 'Mutlu';
  static const String moodNeutral = 'Normal';
  static const String moodSad = 'Üzgün';
  static const String moodVerySad = 'Çok Üzgün';
  
  // Hata Mesajları
  static const String errorInvalidEmail = 'Geçerli bir e-posta adresi girin';
  static const String errorInvalidPhone = 'Geçerli bir telefon numarası girin';
  static const String errorInvalidCode = 'Geçersiz kod';
  static const String errorEmptyField = 'Bu alan boş bırakılamaz';
  static const String errorInvalidName = 'Lütfen geçerli bir isim girin';
}
