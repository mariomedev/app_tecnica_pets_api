import 'package:flutter/material.dart';

import 'widgets/widgets.dart';
import 'package:app_tecnica_pets_api/core/core.dart';
import 'package:app_tecnica_pets_api/presentation/screens/home/breeds/view_breeds.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const TapbarCustomWidget(),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.kPadding20,
            vertical: AppDimensions.kPadding30,
          ),
          child: TabBarView(
            children: [
              const ViewBreeds(),
              Container(
                color: Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
