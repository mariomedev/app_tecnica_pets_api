import 'package:app_tecnica_pets_api/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardCustomWidget extends StatelessWidget {
  final Breed breed;
  const CardCustomWidget({super.key, required this.breed});

  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.firaCode();
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
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
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    breed.name,
                    style: textStyle.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    breed.breedGroup ?? 'No group',
                    style: textStyle.copyWith(
                      fontSize: 14,
                      color: Colors.grey[800],
                    ),
                  ),
                  Text(
                    breed.lifeSpan,
                    style: textStyle.copyWith(
                      fontSize: 14,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
