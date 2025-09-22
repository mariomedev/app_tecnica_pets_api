import 'package:app_tecnica_pets_api/domain/domain.dart';

class BreedMapper {
  static Breed fromJson(Map<String, dynamic> json) => Breed(
    weight: Measurement.fromJson(json["weight"]),
    height: Measurement.fromJson(json["height"]),
    id: json["id"],
    name: json["name"],
    bredFor: json["bred_for"],
    breedGroup: json["breed_group"],
    lifeSpan: json["life_span"],
    temperament: json["temperament"],
    origin: json["origin"],
    referenceImageId: json["reference_image_id"],
    countryCode: json["country_code"],
    description: json["description"],
    history: json["history"],
  );

  static Map<String, dynamic> toJson(Breed breed) => {
    "weight": breed.weight.toJson(),
    "height": breed.height.toJson(),
    "id": breed.id,
    "name": breed.name,
    "bred_for": breed.bredFor,
    "breed_group": breed.breedGroup,
    "life_span": breed.lifeSpan,
    "temperament": breed.temperament,
    "origin": breed.origin,
    "reference_image_id": breed.referenceImageId,
    "country_code": breed.countryCode,
    "description": breed.description,
    "history": breed.history,
  };
}
