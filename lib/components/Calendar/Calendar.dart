import "package:academy_manager/Model/EmploiDeTemps_model.dart";
import "package:academy_manager/components/Calendar/CalendarBody.dart";
import "package:academy_manager/components/Calendar/CalendarHead.dart";
import "package:academy_manager/services/emploie_de_temps.service.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:intl/intl.dart";

class Calendar extends StatefulWidget {
  late EmploiDeTempsModel emploiDeTemps;
  Calendar({super.key, required this.emploiDeTemps});

  @override
  State<StatefulWidget> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  EmploiDeTempsService emploiDeTempsService = EmploiDeTempsService();
  int numberDayInweekActif = 0;
  @override
  void initState() {
    super.initState();
  }

  void onTabHeadItem(int numberDayInweek) {
    setState(() {
      numberDayInweekActif = numberDayInweek;
    });
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 450,
        minHeight: 240,
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: colorScheme.secondary,
            borderRadius: BorderRadius.circular(5),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: colorScheme.onBackground,
                spreadRadius: -1,
                blurRadius: 1,
              ),
            ]),
        width: double.infinity,
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Date debut et date de fin de semaine
            Text(
              "${DateFormat.yMMMMd("fr_FR").format(widget.emploiDeTemps.lundi!.dateJour!)} au ${DateFormat.yMMMMd("fr_FR").format(widget.emploiDeTemps.dimanche!.dateJour!)}",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 15,
            ),

            //Jours de la semaine
            CalendarHead(
              numberDayInweekActif: numberDayInweekActif,
              emploiDeTemps: widget.emploiDeTemps,
              onTapHeadItem: onTabHeadItem,
            ),
            const SizedBox(
              height: 40,
            ),

            //Programmation des cours
            CalendarBody(
              numberDayInweekActif: numberDayInweekActif,
              emploiDeTemps: widget.emploiDeTemps,
            )
          ],
        ),
      ),
    );
  }
}
