import 'package:academy_manager/Model/EmploiDeTemps_model.dart';
import 'package:academy_manager/components/Calendar/Calendar.dart';
import 'package:academy_manager/components/CostumAppBar.dart';
import 'package:academy_manager/services/emploie_de_temps.service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Model/enseignant_model.dart';

class PageEnseignant extends StatefulWidget {
  final EnseignantModel enseignantModel;

  const PageEnseignant({super.key, required this.enseignantModel});

  @override
  State<StatefulWidget> createState() => _PageEnseignantState();
}

class _PageEnseignantState extends State<PageEnseignant> {
  late Future<List<EmploiDeTempsModel>> _emploisDeTempsFuture;
  EmploiDeTempsService emploiDeTempsService = EmploiDeTempsService();
  TextEditingController dateEditController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emploisDeTempsFuture =
        emploiDeTempsService.getEmploisDeTemps(widget.enseignantModel.id!);
  }

  @override
  void dispose() {
    dateEditController.dispose();
    super.dispose();
  }

  onTapDateEditFunction({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(2015),
      initialDate: DateTime.now(),
    );
    if (pickedDate == null) return;
    dateEditController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
  }

  int weeksBetween(DateTime from, DateTime to) {
    from = DateTime.utc(from.year, from.month, from.day);
    to = DateTime.utc(to.year, to.month, to.day);
    return (to.difference(from).inDays / 7).ceil();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: "Emploi de temps",
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.refresh,
                color: Theme.of(context).colorScheme.background,
              ),
              onPressed: () {
                setState(() {
                  _emploisDeTempsFuture = emploiDeTempsService
                      .getEmploisDeTemps(widget.enseignantModel.id!);
                });
              },
            ),
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        backgroundColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              const SizedBox(
                                height: 30,
                              ),
                              const Text(
                                "Filtrer sur la date",
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextField(
                                controller: dateEditController,
                                readOnly: true,
                                onTap: () =>
                                    onTapDateEditFunction(context: context),
                                decoration: const InputDecoration(
                                  label: Text("date"),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      DateTime start;
                                      try {
                                        start = DateFormat("yyyy-MM-dd")
                                            .parse(dateEditController.text);
                                      } catch (e) {
                                        start = DateTime.now();
                                      }

                                      final firstJan =
                                          DateTime(start.year, 1, 1);
                                      final numeroSemaine =
                                          weeksBetween(firstJan, start);
                                      setState(() {
                                        _emploisDeTempsFuture =
                                            emploiDeTempsService
                                                .getEmploisDeTempsSemaine(
                                                    widget.enseignantModel.id!,
                                                    numeroSemaine);
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Rechercher"),
                                  ),
                                  const SizedBox(width: 10),
                                  OutlinedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Annuler"),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    });
              },
              icon: Icon(
                Icons.tune,
                color: Theme.of(context).colorScheme.background,
              ),
            )
          ],
        ),
        // appBar: AppBar(
        //   title: const Text('Enseignant Dashboard'),
        // ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: FutureBuilder<List<EmploiDeTempsModel>>(
            future: _emploisDeTempsFuture,
            builder: (context, snapshot) {
              List<EmploiDeTempsModel>? emploisDeTemps = snapshot.data;
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: emploisDeTemps?.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: Calendar(
                          emploiDeTemps: emploisDeTemps![index],
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("${snapshot.error?.toString()}"),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ));
  }
}
