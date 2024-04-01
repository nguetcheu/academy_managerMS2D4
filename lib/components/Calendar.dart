import "package:academy_manager/Model/EmploiDeTemps_model.dart";
import "package:academy_manager/Model/emploiDeTempsJour_model.dart";
import "package:academy_manager/services/emploie_de_temps.service.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:intl/date_symbol_data_local.dart";
import "package:intl/intl.dart";

class Calendar extends StatefulWidget {
  late EmploiDeTempsModel emploiDeTemps;
  Calendar({super.key, required this.emploiDeTemps});

  @override
  State<StatefulWidget> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  int? _indexEmploiDeTempsJour;
  EmploiDeTempsService emploiDeTempsService = EmploiDeTempsService();
  @override
  void initState() {
    super.initState();
    _indexEmploiDeTempsJour =
        widget.emploiDeTemps.emploisDeTempsJour!.isEmpty ? null : 0;
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextStyle? boldedBodyMedium = Theme.of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(fontWeight: FontWeight.w600);
    TextStyle? boldedGrayBodyMedium = Theme.of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(fontWeight: FontWeight.w500, color: colorScheme.tertiary);
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
              "${DateFormat.yMMMMd("fr_FR").format(widget.emploiDeTemps.dateDebutSemaine!)} au ${DateFormat.yMMMMd("fr_FR").format(widget.emploiDeTemps!.dateFinSemaine!)}",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 15,
            ),

            //Jours de la semaine
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: widget.emploiDeTemps.emploisDeTempsJour!
                  .asMap()
                  .entries
                  .map((elt) {
                bool actif = _indexEmploiDeTempsJour == elt.key;
                return GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                        color:
                            actif ? colorScheme.background : Colors.transparent,
                        border: Border.all(
                          width: 0.5,
                          color:
                              actif ? colorScheme.tertiary : Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: <Widget>[
                        Text(
                          DateFormat.EEEEE("fr_FR").format(elt.value.dateJour!),
                          style: boldedBodyMedium,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${elt.value.dateJour?.day}",
                          style: boldedGrayBodyMedium,
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _indexEmploiDeTempsJour = elt.key;
                    });
                  },
                );
              }).toList() as List<Widget>,
            ),
            const SizedBox(
              height: 40,
            ),

            //Programmation des cours
            Column(
                children: widget
                    .emploiDeTemps
                    .emploisDeTempsJour?[_indexEmploiDeTempsJour!]
                    .programmationsCours
                    ?.map(
                      (elt) => Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              //Heure
                              Text(
                                "${DateFormat.Hm("fr_Fr").format(elt.heureDebutCours!)} - ${DateFormat.Hm("fr_Fr").format(elt.heureFinCours!)}",
                                style: boldedGrayBodyMedium,
                              ),

                              // Cours
                              Flexible(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "${elt.cours}",
                                    style: boldedGrayBodyMedium,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),

                              //Filière et salle
                              Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "${elt.filiere}",
                                      style: boldedGrayBodyMedium,
                                    ),
                                    TextSpan(
                                      text: "/",
                                      style: boldedGrayBodyMedium,
                                    ),
                                    TextSpan(
                                      text: "${elt.salle}",
                                      style: boldedGrayBodyMedium,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    )
                    .toList() as List<Widget>)
          ],
        ),
      ),
    );
  }
}
