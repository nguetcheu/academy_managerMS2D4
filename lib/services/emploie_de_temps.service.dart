import 'dart:html';

import 'package:academy_manager/Model/EmploiDeTemps_model.dart';
import 'package:academy_manager/data/emploiDeTemps_data.dart';

class EmploiDeTempsService {
  List<EmploiDeTempsModel> getEmploisDeTemps() {
    List<EmploiDeTempsModel> emploisDeTemps = [];
    for (int i = 0; i < emploisDeTempsData.length; i++) {
      emploisDeTemps.add(EmploiDeTempsModel.fromJson(emploisDeTempsData[i]));
    }

    return emploisDeTemps;
  }
}
