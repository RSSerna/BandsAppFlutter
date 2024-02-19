import 'package:flutter/widgets.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:bandnameapp/features/bands/data/models/bands_model.dart';

class BandsPieGraphAtom extends StatelessWidget {
  final List<BandsModel> allBands;
  const BandsPieGraphAtom({
    super.key,
    required this.allBands,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {};
    if (allBands.isNotEmpty) {
      for (var band in allBands) {
        dataMap.putIfAbsent(band.name, () => band.votes.toDouble());
      }
    } else {
      dataMap = {'no-connection': 0};
    }
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: PieChart(
        dataMap: dataMap,
        chartType: ChartType.ring,
        chartRadius: 150,
        chartValuesOptions: const ChartValuesOptions(
            showChartValuesInPercentage: true, decimalPlaces: 0),
      ),
    );
  }
}
