class Connection {
  static const String APP_SERVER = "http://localhost:9000";

  // URL ENSEIGNANT
  static const String SAVE_ETUDIANT = "$APP_SERVER/enseignant/save";

  static const String LIST_ETUDIANT = "$APP_SERVER/enseignant/all";

  static const String COUNT_ETUDIANT = "$APP_SERVER/enseignant/count";

  // URL MATIERE
  static const String SAVE_MATIERE = "$APP_SERVER/matiere/save";

  static const String LIST_MATIERE = "$APP_SERVER/matiere/all";

  static const String COUNT_MATIERE = "$APP_SERVER/matiere/count";

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
