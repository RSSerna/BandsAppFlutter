import 'package:flutter/material.dart';

import 'package:bandnameapp/design_system/features/bands/organisms/bands_information_organism.dart';
import 'package:bandnameapp/design_system/features/bands/molecules/floating_action_button_band_molecule.dart';
import 'package:bandnameapp/design_system/features/status/molecules/app_bar_with_socket_status_molecule.dart';

class BandsScreenTemplate extends StatelessWidget {
  const BandsScreenTemplate({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBarWithSocketStatusMolecule(title: const Text('Local: Bands App')),
      body: const BandsInformationOrganism(),
      floatingActionButton: const FloatingActionButtonBandMolecule(),
    );
  }
}
