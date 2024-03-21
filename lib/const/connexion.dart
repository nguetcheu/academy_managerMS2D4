class Connection {
  static const String APP_SERVER = "http://localhost:9000";

  // URL ENSEIGNANT
  static const String SAVE_ENSEIGNANT = "$APP_SERVER/enseignant/add";

  static const String LIST_ENSEIGNANT = "$APP_SERVER/enseignant/all";

  static const String CONNEXION_ENSEIGNANT = "$APP_SERVER/enseignant/login";

  static const Map<String, String> headers = {
    "Access-Control-Allow-Origin": "*",
    'Content-Type': 'application/json',
    'Accept': '*/*'
  };

  static const Map<String, String> springheaders = {
    'Content-type': 'application/x-www-form-urlencoded',
    'Accept': 'application/json',
  };
}
