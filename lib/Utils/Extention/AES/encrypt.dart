
import 'package:encrypt/encrypt.dart';

class EncryptData {
  static final _key = Key.fromUtf8('my32lengthsupersecretnooneknows1');

  static String encryptAES(String plainText) {
    final iv = IV.fromSecureRandom(16); // Acak IV, lebih aman
    final encrypter = Encrypter(AES(_key));
    final encrypted = encrypter.encrypt(plainText, iv: iv);

    // Gabungkan IV dan hasil enkripsi
    final result = '${iv.base64}:${encrypted.base64}';
    return result;
  }

  static String decryptAES(String combined) {
    final parts = combined.split(':');
    if (parts.length != 2) throw ArgumentError('Invalid encrypted data format');

    final iv = IV.fromBase64(parts[0]);
    final encrypted = Encrypted.from64(parts[1]);

    final encrypter = Encrypter(AES(_key));
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    return decrypted;
  }
}