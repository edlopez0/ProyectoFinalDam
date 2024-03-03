
import 'package:flutter/material.dart';

class SCGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DataTable(
        columns: [
          DataColumn(label: Text('Nombre')),
          DataColumn(label: Text('Edad')),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text('Juan')),
            DataCell(Text('25')),
          ]),
          DataRow(cells: [
            DataCell(Text('Ana')),
            DataCell(Text('30')),
          ]),
          DataRow(cells: [
            DataCell(Text('Luis')),
            DataCell(Text('22')),
          ]),
          DataRow(cells: [
            DataCell(Text('María')),
            DataCell(Text('28')),
          ]),
        ],
      ),
    );
  }
}