import 'package:app_tecnica_pets_api/core/constanst/app_assets.dart';
import 'package:app_tecnica_pets_api/core/router/app_router_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:app_tecnica_pets_api/domain/domain.dart';
import 'package:app_tecnica_pets_api/presentation/providers/providers.dart';

class DetailsScreen extends StatefulWidget {
  final int breedId;
  const DetailsScreen({super.key, required this.breedId});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => context.read<BreedProvider>().loadBreedDetail(widget.breedId),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<BreedProvider>();
    final Breed? breed = state.selectedBreed;
    final textStyle = GoogleFonts.firaCode();

    if (breed == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
              onPressed: () {
                context.read<BreedProvider>().clearSelected();
                context.push(AppRouterConstants.homePath);
              },
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                breed.name,
                style: textStyle.copyWith(
                  color: Colors.white,
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  FadeInImage(
                    placeholder: const AssetImage(AppAssets.loadingImage),
                    image: NetworkImage(breed.imageUrl ?? ''),
                    fit: BoxFit.cover,
                    imageErrorBuilder: (context, error, stackTrace) =>
                        Container(
                          color: Colors.grey[300],
                          child: const Icon(Icons.error, size: 80),
                        ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Contenido
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _InfoCard(
                    title: "General Info",
                    children: [
                      _InfoRow(
                        label: "Group",
                        value: breed.breedGroup ?? "N/A",
                      ),
                      _InfoRow(label: "Life Span", value: breed.lifeSpan),
                      _InfoRow(label: "Origin", value: breed.origin ?? "N/A"),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _InfoCard(
                    title: "Temperament",
                    children: [
                      Text(
                        breed.temperament.isNotEmpty
                            ? breed.temperament
                            : "No data available",
                        style: const TextStyle(fontSize: 16, height: 1.4),
                      ),
                    ],
                  ),
                  _InfoCard(
                    title: "Others breeds",
                    children: [
                      if (state.breeds.isEmpty)
                        const Text("No other breeds available")
                      else
                        ...state.breeds.map(
                          (b) => ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(b.name),
                            subtitle: Text(b.origin ?? "Unknown origin"),
                            leading: CircleAvatar(
                              backgroundImage: b.imageUrl != null
                                  ? NetworkImage(b.imageUrl!)
                                  : const AssetImage(AppAssets.loadingImage)
                                        as ImageProvider,
                              onBackgroundImageError: (_, __) {},
                            ),
                            onTap: () {
                              context.read<BreedProvider>().clearSelected();
                              context.push(
                                '${AppRouterConstants.detailsPath}/${b.id}',
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Card reusable
class _InfoCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _InfoCard({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const Divider(),
            ...children,
          ],
        ),
      ),
    );
  }
}

/// Row con label y valor
class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.firaCode(
      fontSize: 16,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label: ",
            style: textStyle,
          ),
          Expanded(
            child: Text(
              value,
              style: textStyle,
            ),
          ),
        ],
      ),
    );
  }
}
