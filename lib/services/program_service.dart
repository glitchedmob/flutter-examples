import 'package:rxdart/rxdart.dart';

class ProgramService {
  final programs$ = BehaviorSubject.seeded(<String>[]);

  final exercises$ = BehaviorSubject.seeded(<String>[]);

  Future getPrograms() async {
    programs$.add(['program 1']);
  }
}
