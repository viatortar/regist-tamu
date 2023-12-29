class ApiUrl {
  // domain nya sesuaiin hotspot (ip private yang laptop dapetin)
  static const String baseUrl = 'http://10.0.2.2/api-tamu/public';

  static const String registrasi = baseUrl + '/registrasi';
  static const String login = baseUrl + '/login';
  static const String listTamu = baseUrl + '/tamu';
  static const String createTamu = baseUrl + '/tamu';

  static String updateTamu(int id) {
    return baseUrl + '/tamu/' + id.toString() + '/update';
  }

  static String showTamu(int id) {
    return baseUrl + '/tamu/' + id.toString();
  }

  static String deleteTamu(int id) {
    return baseUrl + '/tamu/' + id.toString();
  }
}
