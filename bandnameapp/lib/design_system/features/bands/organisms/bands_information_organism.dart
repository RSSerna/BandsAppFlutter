import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bandnameapp/design_system/features/bands/atoms/bands_pie_graph_atom.dart';
import 'package:bandnameapp/design_system/features/bands/molecules/bands_list_molecule.dart';
import 'package:bandnameapp/features/bands/data/models/bands_model.dart';
import 'package:bandnameapp/features/bands/presentation/bloc/bands_bloc.dart';

class BandsInformationOrganism extends StatelessWidget {
  const BandsInformationOrganism({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BandsBloc, BandsState>(
      builder: (context, state) {
        List<BandsModel> bands =
            BlocProvider.of<BandsBloc>(context, listen: false).bands;
        return Column(
          children: [
            BandsPieGraphAtom(
              allBands: bands,
            ),
            Expanded(
              child: BandsListMolecule(bands: bands),
            ),
          ],
        );
      },
    );
  }
}
