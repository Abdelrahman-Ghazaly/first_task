import 'package:first_assignment/features/home/domain/entities/sponser_entities.dart';

class SponserModel extends SponserEntity {
  SponserModel({
    required super.iconUrl,
    required super.imageUrl,
    required super.title,
    required super.description,
    required super.promo,
  });

  factory SponserModel.fromMap(Map<String, dynamic> map) {
    return SponserModel(
      iconUrl: map['icon'] ?? '',
      imageUrl: map['image'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      promo: map['promo'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'iconUrl': iconUrl,
      'imageUrl': imageUrl,
      'title': title,
      'description': description,
      'promo': promo,
    };
  }
}
