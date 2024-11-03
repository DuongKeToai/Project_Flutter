
import 'package:flutter_learning/core/common/domain/entities/genre.dart';

class GenreModel extends Genre {
  @override
  final int id;
  @override
  final String name;
  GenreModel(this.id, this.name) : super(id: id, name: name);

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      json['id'] as int,
      json['name'] as String,
    );
  }
}
