import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bandnameapp/design_system/features/bands/atoms/band_list_tile_atom.dart';
import 'package:bandnameapp/features/bands/data/models/bands_model.dart';
import 'package:bandnameapp/features/bands/presentation/bloc/bands_bloc.dart';

class DismissibleBandMolecule extends StatelessWidget {
  final BandsModel band;

  const DismissibleBandMolecule({
    super.key,
    required this.band,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        BlocProvider.of<BandsBloc>(context)
            .add(BandDeleteEvent(bandId: band.id));
      },
      background: Container(
          padding: const EdgeInsets.only(left: 8.0),
          color: Colors.red,
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Text('Delete Band', style: TextStyle(color: Colors.white)),
          )),
      child: BandTileAtom(
        onTap: () {
          BlocProvider.of<BandsBloc>(context)
              .add(BandSendVoteEvent(bandId: band.id));
        },
        bandName: band.name,
        bandVotes: band.votes.toString(),
      ),
    );
  }
}
