import 'package:app_tecnica_pets_api/core/core.dart';
import 'package:app_tecnica_pets_api/presentation/providers/providers.dart';
import 'package:flutter/material.dart';

import 'package:app_tecnica_pets_api/presentation/screens/home/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ViewBreeds extends StatefulWidget {
  const ViewBreeds({super.key});

  @override
  State<ViewBreeds> createState() => _ViewBreedsState();
}

class _ViewBreedsState extends State<ViewBreeds> {
  final _controller = TextEditingController();
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void dispose() {
    _controller.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  void _onSearch(String query) {
    if (query.isNotEmpty) {
      context.read<BreedProvider>().search(query);
    } else {
      context.read<BreedProvider>().loadBreeds();
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BreedProvider>();
    final textStyle = GoogleFonts.firaCode();
    final isChargeComplete = !provider.loading && provider.error == null;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppDimensions.kPadding10),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Search breeds...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    AppDimensions.kBorderRadius6,
                  ),
                ),
                filled: true,
              ),
              onChanged: (value) {
                _debouncer.run(() {
                  _onSearch(value);
                });
              },
            ),
          ),

          if (provider.loading)
            const Expanded(
              child: Center(child: CircularProgressIndicator()),
            ),

          if (provider.error != null)
            Expanded(
              child: Center(
                child: Text(
                  "Error: ${provider.error}",
                  style: textStyle.copyWith(
                    color: Colors.red,
                  ),
                ),
              ),
            ),

          if (provider.breeds.isEmpty && isChargeComplete)
            Expanded(
              child: Center(
                child: Text(
                  "No breeds found.",
                  style: textStyle,
                ),
              ),
            ),

          if (provider.breeds.isNotEmpty && isChargeComplete)
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: AppDimensions.kSpacing10,
                  mainAxisSpacing: AppDimensions.kSpacing10,
                ),
                itemCount: provider.breeds.length,
                itemBuilder: (context, index) {
                  final breed = provider.breeds[index];
                  return GestureDetector(
                    onTap: () => context.push(
                      '${AppRouterConstants.detailsPath}/${breed.id}',
                    ),
                    child: CardCustomWidget(breed: breed),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
