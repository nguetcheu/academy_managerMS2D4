class Connection {
  static const String APP_SERVER = "http://localhost:9000";

  // URL ENSEIGNANT
  static const String SAVE_ENSEIGNANT = "$APP_SERVER/enseignant/add";

  static const String LIST_ENSEIGNANT = "$APP_SERVER/enseignant/all";

  static const String UPDATE_ENSEIGNANT = "$APP_SERVER/enseignant/";

  static const String CONNEXION_ENSEIGNANT = "$APP_SERVER/enseignant/login";

  // URL DEPARTEMENT

  static const String LIST_DEPARTEMENT = "$APP_SERVER/departement/all";

  static const String GET_DEPARTEMENT = "$APP_SERVER/departement/id";

  static const Map<String, String> headers = {
    "Access-Control-Allow-Origin": "*",
    'Content-Type': 'application/json',
    'Accept': '*/*'
  };
}
