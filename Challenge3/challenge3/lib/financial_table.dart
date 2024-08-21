import 'package:flutter/material.dart';

class FinancialTable extends StatelessWidget {
  final double ingresos;
  final double totalGastos;
  final double sobrante;

  const FinancialTable({
    Key? key,
    required this.ingresos,
    required this.totalGastos,
    required this.sobrante,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Table(
          columnWidths: const <int, TableColumnWidth>{
            0: FixedColumnWidth(120.0), 
            1: FlexColumnWidth(), 
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
              children: [
                Text('Ingresos:', style: Theme.of(context).textTheme.headlineMedium),
                Text('$ingresos usd', style: Theme.of(context).textTheme.headlineMedium),
              ],
            ),
            TableRow(
              children: [
                Text('Gastos:', style: Theme.of(context).textTheme.headlineMedium),
                Text('$totalGastos', style: Theme.of(context).textTheme.headlineMedium),
              ],
            ),
            TableRow(
              children: [
                Text('Sobrante:', style: Theme.of(context).textTheme.headlineMedium),
                Text('$sobrante usd', style: Theme.of(context).textTheme.headlineMedium),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
