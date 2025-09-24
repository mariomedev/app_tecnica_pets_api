import 'package:app_tecnica_pets_api/core/core.dart';
import 'package:app_tecnica_pets_api/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:app_tecnica_pets_api/presentation/screens/home/widgets/card_custom_widget.dart';

class ViewFavorites extends StatelessWidget {
  const ViewFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BreedFavoriteProvider>();
    final textStyle = GoogleFonts.firaCode();
    final isChargeComplete = !provider.loading && provider.error == null;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await context.read<BreedFavoriteProvider>().loadFavorites();
        },
        child: provider.favorites.isNotEmpty
            ? GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: AppDimensions.kSpacing10,
                  mainAxisSpacing: AppDimensions.kSpacing10,
                ),
                itemCount: provider.favorites.length,
                itemBuilder: (context, index) {
                  final breed = provider.favorites[index];
                  return CardCustomWidget(breed: breed);
                },
              )
            : ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  const SizedBox(height: 60),
                  if (provider.loading)
                    const Center(child: CircularProgressIndicator())
                  else if (provider.error != null)
                    Center(
                      child: Text(
                        "Error: ${provider.error}",
                        style: textStyle.copyWith(color: Colors.red),
                      ),
                    )
                  else if (isChargeComplete)
                    Center(
                      child: Text("No favorites yet.", style: textStyle),
                    ),
                ],
              ),
      ),
    );
  }
}
