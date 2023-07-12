import 'package:first_assignment/features/home/domain/entities/sponser_entities.dart';

class SponserModel extends SponserEntity {
  SponserModel({
    required super.id,
    required super.icon,
    required super.image,
    required super.title,
    required super.description,
    required super.promo,
  });

  factory SponserModel.fromMap(Map<String, dynamic> map) {
    return SponserModel(
      id: map['id'] ?? 0,
      icon: map['icon'],
      image: map['image'],
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      promo: map['promo'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'icon': icon,
      'image': image,
      'title': title,
      'description': description,
      'promo': promo,
    };
  }
}
