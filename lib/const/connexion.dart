class Connection {
  static const String APP_SERVER = "http://localhost:9000";

  // URL ENSEIGNANT
  static const String SAVE_ENSEIGNANT = "$APP_SERVER/enseignant/add";

  static const String LIST_ENSEIGNANT = "$APP_SERVER/enseignant/all";

  static const String CONNEXION_ENSEIGNANT = "$APP_SERVER/enseignant/login";

  // URL DEPARTEMENT

  static const String LIST_DEPARTEMENT = "$APP_SERVER/departement/all";

  static const String GET_DEPARTEMENT = "$APP_SERVER/departement/id";

  static const Map<String, String> headers = {
    "Access-Control-Allow-Origin": "*",
    'Content-Type': 'application/json',
    'Accept': '*/*'
  };

  //URL EMPLOIS DE TEMPS

  static String listEmploisDetempEnseignantUrl(int idEnseignant) {
    return "$APP_SERVER/emploi-de-temps/enseignant/$idEnseignant/all";
  }

  static String getEmploisDetempEnseignantParSemaineUrl(
      int idEnseignant, int numeroSemaine) {
    return "$APP_SERVER/emploi-de-temps/enseignant/$idEnseignant/$numeroSemaine";
  }

  static String listEmploisDetempEnseignantSemaineActuelleUrl(
      int idEnseignant) {
    return "$APP_SERVER/emploi-de-temps/enseignant/$idEnseignant";
  }
}
