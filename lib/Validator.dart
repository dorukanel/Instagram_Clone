

class Validator {

  // E-posta doğrulama
  static String? validateEmail(String value) {
    // Regex email
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(value)) {
      return 'Geçerli bir e-posta adresi giriniz.';
    }
    return null;
  }

  // Şifre doğrulama
  static String? validatePassword(String value) {
    if (value.length < 8) {
      return 'Şifre en az 8 karakter olmalıdır.';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Şifre en az bir sayı içermelidir.';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Şifre en az bir büyük harf içermelidir.';
    }
    return null;
  }
  // Telefon numarası doğrulama
  static String? validatePhone(String value) {
    if (value.isEmpty) {
      return 'Telefon numarası boş bırakılamaz.';
    } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
      return '(0+ __________).';
    }
    return null;
  }
  // Isim dogrulama
  static String? validateFirstName(String value){
    if (value.isEmpty) {
      return 'İsim boş bırakılamaz';
    }
    return null;
  }
  // Soyisim dogrulama
  static String? validateLastName(String value){
    if (value.isEmpty) {
      return 'Soyisim boş bırakılamaz.';
    }
    return null;
  }
}
