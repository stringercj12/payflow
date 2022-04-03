import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/boleto_tile/boleto_tile_widget.dart';

import 'boleto_list_controller.dart';

class BoletoListWidget extends StatefulWidget {
  final BoletoListController controller;

  const BoletoListWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  State<BoletoListWidget> createState() => _BoletoListWidgetState();
}

class _BoletoListWidgetState extends State<BoletoListWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.controller.boletosNotifier,
      builder: (_, boletos, __) => Row(
        children: [
          // widget.controller.boletos.length > 0
          //     ? Column(
          //         children: widget.controller.boletos
          //             .map((e) => BoletoTileWidget(data: e))
          //             .toList(),
          //       )
          //     : Text(
          //         "Nenhum boleto no momento",
          //         style: TextStyles.captionBody,
          //         textAlign: TextAlign.center,
          //       )
          Column(
            children: widget.controller.boletos
                .map((e) => BoletoTileWidget(data: e))
                .toList(),
          )
        ],
      ),
    );
  }
}
