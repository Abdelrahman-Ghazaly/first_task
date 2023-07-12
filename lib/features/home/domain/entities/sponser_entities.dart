// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:typed_data';

class SponserEntity {
  SponserEntity({
    required this.id,
    required this.icon,
    required this.image,
    required this.title,
    required this.description,
    required this.promo,
  });

  final int id;
  final Uint8List icon;
  final Uint8List image;
  final String title;
  final String description;
  final String promo;
}
