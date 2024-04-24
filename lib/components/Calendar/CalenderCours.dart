import 'package:academy_manager/Model/emploiDeTempsJour_model.dart';
import 'package:academy_manager/components/Calendar/CalendarCoursItem.dart';
import 'package:flutter/material.dart';

class CalendarCours extends StatelessWidget {
  EmploiDeTempsJourModel emploiDeTempsJour;
  CalendarCours({super.key, required this.emploiDeTempsJour});
  @override
  Widget build(BuildContext context) {
    return (Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            CalendarCoursItem(
              cours: emploiDeTempsJour.cours1!,
              heureDebutCours: DateTime(0000, 00, 00, 8, 0),
              heureFinCours: DateTime(0000, 00, 00, 9, 50),
            ),
            CalendarCoursItem(
              cours: emploiDeTempsJour.cours2!,
              heureDebutCours: DateTime(0000, 00, 00, 9, 10),
              heureFinCours: DateTime(0000, 00, 00, 12, 00),
            ),
            CalendarCoursItem(
              cours: emploiDeTempsJour.cours3!,
              heureDebutCours: DateTime(0000, 00, 00, 13, 00),
              heureFinCours: DateTime(0000, 00, 00, 14, 50),
            ),
            CalendarCoursItem(
              cours: emploiDeTempsJour.cours4!,
              heureDebutCours: DateTime(0000, 00, 00, 15, 10),
              heureFinCours: DateTime(0000, 00, 00, 17, 00),
            ),
            const SizedBox(
              height: 40,
            ),
            CalendarCoursItem(
              cours: emploiDeTempsJour.cours5!,
              heureDebutCours: DateTime(0000, 00, 00, 17, 0),
              heureFinCours: DateTime(0000, 00, 00, 18, 00),
            ),
            CalendarCoursItem(
              cours: emploiDeTempsJour.cours6!,
              heureDebutCours: DateTime(0000, 00, 00, 18, 0),
              heureFinCours: DateTime(0000, 00, 00, 19, 00),
            ),
            CalendarCoursItem(
              cours: emploiDeTempsJour.cours7!,
              heureDebutCours: DateTime(0000, 00, 00, 19, 0),
              heureFinCours: DateTime(0000, 00, 00, 20, 00),
            ),
            CalendarCoursItem(
              cours: emploiDeTempsJour.cours8!,
              heureDebutCours: DateTime(0000, 00, 00, 20, 0),
              heureFinCours: DateTime(0000, 00, 00, 21, 00),
            ),
          ],
        ),
      ],
    ));
  }
}
