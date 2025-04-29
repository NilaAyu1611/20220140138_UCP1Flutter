import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailpiketPage extends StatelessWidget {
  final String tugas;
  final DateTime tanggal;
  final String email;

 const DetailpiketPage({
    Key? key,
    required this.tugas,
    required this.tanggal,
    required this.email,
  }) : super(key: key);

}

class _DetailpiketPageState extends State<DetailpiketPage> {
  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('EEEE, d MMMM yyyy', 'id_ID').format(tanggal);     //format tanggal dalam b.indo

    return const Placeholder();
  }
}