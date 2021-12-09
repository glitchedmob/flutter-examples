import 'package:flutter/material.dart';

class ProgramDetailScreen extends StatefulWidget {
  static const route = '/programs/detail';

  const ProgramDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProgramDetailScreen> createState() => _ProgramDetailScreenState();
}

class _ProgramDetailScreenState extends State<ProgramDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments as ProgramDetailScreenArgs?;
    super.didChangeDependencies();
  }
}

class ProgramDetailScreenArgs {
  String id;

  ProgramDetailScreenArgs({
    required this.id,
  });
}