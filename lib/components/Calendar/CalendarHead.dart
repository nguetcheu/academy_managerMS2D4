import 'package:academy_manager/Model/EmploiDeTemps_model.dart';
import 'package:academy_manager/components/Calendar/CalendarHeadItem.dart';
import 'package:flutter/material.dart';

class CalendarHead extends StatelessWidget {
  EmploiDeTempsModel emploiDeTemps;
  Function onTapHeadItem;
  int numberDayInweekActif;

  CalendarHead(
      {super.key,
      required this.numberDayInweekActif,
      required this.emploiDeTemps,
      required this.onTapHeadItem});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        emploiDeTemps.lundi,
        emploiDeTemps.mardi,
        emploiDeTemps.mercredi,
        emploiDeTemps.jeudi,
        emploiDeTemps.vendredi,
        emploiDeTemps.samedi,
        emploiDeTemps.dimanche,
      ]
          .asMap()
          .entries
          .map(
            (entry) => CalendarHeadItem(
              actif: numberDayInweekActif == entry.key,
              numberDayInweek: entry.key,
              dateJour: entry.value!.dateJour!,
              onTapAction: onTapHeadItem,
            ),
          )
          .toList() as List<Widget>,
    );
  }
}
