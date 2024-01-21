import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/test_bloc/home_bloc.dart';
import '../../../bloc/test_bloc/home_state.dart';

class MapImage extends StatelessWidget {
  const MapImage({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, String> serverlessMap = context.read<HomeBloc>().severlessMap;

    return GestureDetector(
      onTap: () async {
        await showDialog(
            context: context,
            builder: (_) => ImageDialog(
                  severlessMap: serverlessMap,
                ));
      },
      child: SizedBox(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (serverlessMap["image"]!.isEmpty) {
              return Container(
                height: 500,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12)),
              );
            }

            return Image.network(
              serverlessMap["image"]!,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  height: 500,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(12)),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class ImageDialog extends StatelessWidget {
  final Map<String, String> severlessMap;

  const ImageDialog({super.key, required this.severlessMap});

  @override
  Widget build(BuildContext context) {
    if (severlessMap == null) {
      return Container();
    }

    return Dialog(
      child: InteractiveViewer(
          constrained: true, child: Image.network(severlessMap["image"]!)),
    );
  }
}
