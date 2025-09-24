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
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        context.read<BreedProvider>().loadBreeds(
          page: context.read<BreedProvider>().currentPage,
          limit: 10,
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _debouncer.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onSearch(String query) {
    if (query.isNotEmpty) {
      context.read<BreedProvider>().search(query);
    } else {
      context.read<BreedProvider>().loadBreeds(page: 0, limit: 10);
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

          if (provider.loading && provider.breeds.isEmpty)
            const Expanded(
              child: Center(child: CircularProgressIndicator()),
            ),

          if (provider.error != null)
            Expanded(
              child: Center(
                child: Text(
                  "Error: ${provider.error}",
                  style: textStyle.copyWith(color: Colors.red),
                ),
              ),
            ),

          if (provider.breeds.isEmpty && isChargeComplete)
            Expanded(
              child: Center(
                child: Text("No breeds found.", style: textStyle),
              ),
            ),

          if (provider.breeds.isNotEmpty)
            Expanded(
              child: GridView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: AppDimensions.kSpacing10,
                  mainAxisSpacing: AppDimensions.kSpacing10,
                ),
                itemCount: provider.breeds.length,

                itemBuilder: (context, index) {
                  if (index == provider.breeds.length) {
                    return const Center(child: CircularProgressIndicator());
                  }
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
