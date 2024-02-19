import 'package:flutter/material.dart';

class BandTileAtom extends StatelessWidget {

  final void Function()? onTap;
  final String bandName;
  final String bandVotes;

  const BandTileAtom({
    Key? key,
    this.onTap,
    required this.bandName,
    required this.bandVotes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue[100],
        child: Text(bandName.substring(0, 2)),
      ),
      title: Text(bandName),
      trailing: Text(bandVotes, style: const TextStyle(fontSize: 20)),
      onTap: onTap,
    );
  }
}
