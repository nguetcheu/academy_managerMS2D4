import 'package:flutter/material.dart';
import "package:intl/date_symbol_data_local.dart";
import "package:intl/intl.dart";

class CalendarHeadItem extends StatelessWidget {
  int numberDayInweek;
  DateTime dateJour;
  late bool actif;
  Function onTapAction;

  CalendarHeadItem(
      {super.key,
      required this.numberDayInweek,
      required this.dateJour,
      required this.onTapAction,
      this.actif = false});
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
    return GestureDetector(
      onTap: () {
        onTapAction(numberDayInweek);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        decoration: BoxDecoration(
            color: actif ? colorScheme.background : Colors.transparent,
            border: Border.all(
              width: 0.5,
              color: actif ? colorScheme.tertiary : Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: <Widget>[
            Text(
              DateFormat.EEEEE("fr_FR").format(dateJour),
              style: boldedBodyMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${dateJour.day}",
              style: boldedGrayBodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
