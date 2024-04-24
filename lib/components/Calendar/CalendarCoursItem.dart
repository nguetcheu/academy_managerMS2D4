import 'package:academy_manager/Model/cours_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarCoursItem extends StatelessWidget {
  Cours? cours;
  DateTime heureDebutCours;
  DateTime heureFinCours;

  CalendarCoursItem(
      {super.key,
      required this.cours,
      required this.heureDebutCours,
      required this.heureFinCours});
  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.tertiary);
    if (cours != null) {
      return Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //Heure
              Text(
                "${DateFormat.Hm("fr_Fr").format(heureDebutCours)} - ${DateFormat.Hm("fr_Fr").format(heureFinCours)}",
                style: textStyle,
              ),

              // Cours
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  child: Text(
                    cours?.matiere?.intitule ?? "--",
                    style: textStyle,
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
                      text: cours?.matiere?.filiere?.nom ?? "--",
                      style: textStyle,
                    ),
                    TextSpan(
                      text: "/",
                      style: textStyle,
                    ),
                    TextSpan(
                      text: cours?.salle?.numero ?? "--",
                      style: textStyle,
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
      );
    } else {
      return const SizedBox();
    }
  }
}
