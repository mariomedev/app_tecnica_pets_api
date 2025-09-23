import 'package:app_tecnica_pets_api/domain/domain.dart';

class Breed {
  Measurement weight;
  Measurement height;
  int id;
  String name;
  String? bredFor;
  String? breedGroup;
  String lifeSpan;
  String temperament;
  String? origin;
  String referenceImageId;
  String? countryCode;
  String? description;
  String? history;
  String? imageUrl;

  Breed({
    required this.weight,
    required this.height,
    required this.id,
    required this.name,
    this.bredFor,
    this.breedGroup,
    required this.lifeSpan,
    required this.temperament,
    this.origin,
    required this.referenceImageId,
    this.countryCode,
    this.description,
    this.history,
    this.imageUrl,
  });

  Breed copyWith({
    Measurement? weight,
    Measurement? height,
    int? id,
    String? name,
    String? bredFor,
    String? breedGroup,
    String? lifeSpan,
    String? temperament,
    String? origin,
    String? referenceImageId,
    String? countryCode,
    String? description,
    String? history,
    String? imageUrl,
  }) {
    return Breed(
      weight: weight ?? this.weight,
      height: height ?? this.height,
      id: id ?? this.id,
      name: name ?? this.name,
      bredFor: bredFor ?? this.bredFor,
      breedGroup: breedGroup ?? this.breedGroup,
      lifeSpan: lifeSpan ?? this.lifeSpan,
      temperament: temperament ?? this.temperament,
      origin: origin ?? this.origin,
      referenceImageId: referenceImageId ?? this.referenceImageId,
      countryCode: countryCode ?? this.countryCode,
      description: description ?? this.description,
      history: history ?? this.history,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
