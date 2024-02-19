import 'package:flutter/material.dart';
import 'package:bandnameapp/design_system/features/bands/molecules/dismissible_band_molecule.dart';
import 'package:bandnameapp/features/bands/data/models/bands_model.dart';

class BandsListMolecule extends StatelessWidget {
  const BandsListMolecule({
    super.key,
    required this.bands,
  });

  final List<BandsModel> bands;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: bands.length,
      itemBuilder: (BuildContext context, int index) {
        return DismissibleBandMolecule(band: bands[index]);
      },
    );
  }
}
