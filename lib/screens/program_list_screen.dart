import 'package:dialed_health/screens/program_detail_screen.dart';
import 'package:dialed_health/services/navigation_service.dart';
import 'package:dialed_health/services/program_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ProgramListScreen extends StatelessWidget {
  static const route = '/programs';
  final _navService = GetIt.I.get<NavigationService>();
  final _programService = GetIt.I.get<ProgramService>();

  ProgramListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _programService.exercises$,
        builder: (context, snapshot1) {
          return StreamBuilder<List<String>>(
            stream: _programService.programs$,
            builder: (context, snapshot2) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final program = snapshot2.requireData[index];
                  return Text('test $program');
                },
              );
            },
          );
        });
  }

  void _showProgramWithId(String id) {
    final args = ProgramDetailScreenArgs(id: id);
    _navService.current.pushNamed(ProgramDetailScreen.route, arguments: args);
  }
}
