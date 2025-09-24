import 'package:app_tecnica_pets_api/core/core.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:app_tecnica_pets_api/presentation/providers/providers.dart';

import 'package:app_tecnica_pets_api/domain/domain.dart';

class CardCustomWidget extends StatefulWidget {
  final Breed breed;
  const CardCustomWidget({super.key, required this.breed});

  @override
  State<CardCustomWidget> createState() => _CardCustomWidgetState();
}

class _CardCustomWidgetState extends State<CardCustomWidget> {
  bool _favoriting = false;
  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.firaCode();
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: widget.breed.imageUrl != null
                  ? FadeInImage(
                      placeholder: const AssetImage(AppAssets.loadingImage),
                      image: NetworkImage(widget.breed.imageUrl!),
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      AppAssets.logo,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            width: 200,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      widget.breed.name,
                      style: textStyle.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Expanded(
                    child: Text(
                      widget.breed.breedGroup ?? 'No group',
                      style: textStyle.copyWith(
                        fontSize: 14,
                        color: Colors.grey[800],
                      ),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.breed.lifeSpan,
                      style: textStyle.copyWith(
                        fontSize: 14,
                        color: Colors.grey[800],
                      ),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Consumer<BreedFavoriteProvider>(
            builder: (context, favProvider, _) {
              final isFav = favProvider.favorites.any(
                (b) => b.referenceImageId == widget.breed.referenceImageId,
              );
              return Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(24),
                  onTap: (favProvider.loading || _favoriting)
                      ? null
                      : () async {
                          if (_favoriting) return;
                          setState(() {
                            _favoriting = true;
                          });
                          try {
                            await favProvider.toggleFavorite(widget.breed);
                          } finally {
                            if (!mounted) return;
                            setState(() {
                              _favoriting = false;
                            });
                          }
                        },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: _favoriting
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Icon(
                            isFav ? Icons.favorite : Icons.favorite_border,
                            color: isFav ? Colors.red : Colors.grey[800],
                          ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
