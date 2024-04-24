import 'package:academy_manager/Model/EmploiDeTemps_model.dart';
import 'package:academy_manager/Model/emploiDeTempsJour_model.dart';
import 'package:academy_manager/components/Calendar/CalenderCours.dart';
import 'package:academy_manager/data/emploiDeTemps_data.dart';
import 'package:flutter/material.dart';

class CalendarBody extends StatelessWidget {
  EmploiDeTempsModel emploiDeTemps;
  int numberDayInweekActif;
  late int activeItem;
  CalendarBody({
    super.key,
    required this.numberDayInweekActif,
    required this.emploiDeTemps,
  });

  @override
  Widget build(BuildContext context) {
    List<EmploiDeTempsJourModel?> emploisDeTempsJour =
        <EmploiDeTempsJourModel?>[
      emploiDeTemps.lundi,
      emploiDeTemps.mardi,
      emploiDeTemps.mercredi,
      emploiDeTemps.jeudi,
      emploiDeTemps.vendredi,
      emploiDeTemps.samedi,
      emploiDeTemps.dimanche,
    ];

    return CalendarCours(
        emploiDeTempsJour: emploisDeTempsJour[numberDayInweekActif]!);
  }
}
