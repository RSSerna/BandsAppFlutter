import 'package:flutter/material.dart';

class DismissableMolecule extends StatelessWidget {
  final Key dismissibleKey;
  final Function(DismissDirection)? onDismissed;
  final Widget? backgroundWidget;
  final Widget widget;

  const DismissableMolecule({
    super.key,
    required this.dismissibleKey,
    this.onDismissed,
    this.backgroundWidget,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: dismissibleKey,
        direction: DismissDirection.startToEnd,
        onDismissed: onDismissed,
        background: Container(
            padding: const EdgeInsets.only(left: 8.0),
            color: Colors.red,
            child: Align(
                alignment: Alignment.centerLeft, child: backgroundWidget)),
        child: widget);
  }
}

// (direction) {
//             BlocProvider.of<BandsBloc>(context)
//                 .add(BandDeleteEvent(bandId: band.id));
//           }
//  () {
//           BlocProvider.of<BandsBloc>(context)
//               .add(BandSendVoteEvent(bandId: band.id));
//         },