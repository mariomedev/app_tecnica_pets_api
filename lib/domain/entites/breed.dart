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
  });
}
