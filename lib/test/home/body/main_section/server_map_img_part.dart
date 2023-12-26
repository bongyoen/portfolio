import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/body_bloc/body_bloc.dart';
import '../../../bloc/body_bloc/body_state.dart';

class ServerMapImgPart extends StatelessWidget {
  const ServerMapImgPart({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final serverMapImg = context.read<BodyBloc>().serverMapImg;

        await showDialog(
            context: context,
            builder: (_) {
              return Dialog(
                child: InteractiveViewer(
                    constrained: true,
                    child: Image.network(serverMapImg["image"]!)),
              );
            });
      },
      child: SizedBox(
        height: 700,
        child: BlocBuilder<BodyBloc, BodyState>(
          builder: (context, state) {
            if (state is BodyInitialState) {
              return Container();
            }
            if (state is ServerMapState) {
              return Image.network(state.severlessMap["image"]!,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      height: 500,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12)),
                    );
                  });
            }
            return Container();
          },
        ),
      ),
    );
  }
}
