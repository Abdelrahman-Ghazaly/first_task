import 'package:first_assignment/features/home/domain/entities/sponser_entities.dart';

class SponserModel extends SponserEntity {
  SponserModel({
    required super.id,
    required super.iconUrl,
    required super.imageUrl,
    required super.title,
    required super.description,
    required super.promo,
  });

  factory SponserModel.fromMap(Map<String, dynamic> map) {
    return SponserModel(
      id: map['id'] ?? 0,
      iconUrl: map['icon'] ?? '',
      imageUrl: map['image'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      promo: map['promo'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'icon': iconUrl,
      'image': imageUrl,
      'title': title,
      'description': description,
      'promo': promo,
    };
  }
}
