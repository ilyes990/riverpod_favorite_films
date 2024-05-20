import 'package:example6/main.dart';

class Film {
  final String id;
  final String title;
  final String description;
  final bool isFavorite;

  Film(
      {required this.id, required this.title, required this.description, required this.isFavorite});

  Film copy({required bool isFavorite}) {
    return Film(id: id, title: title, description: description, isFavorite: isFavorite);
  }

  @override
  String toString() => 'Film(id: $id,'
      'title: $title,'
      'description: $description,'
      'isFavorite: $isFavorite)';

  @override
  bool operator ==(covariant Film other) => id == other.id && isFavorite == other.isFavorite;

  @override
  // TODO: implement hashCode
  int get hashCode => Object.hashAll([
        id,
        isFavorite,
      ]);
}

List<Film> films = [
  Film(id: '1', title: 'Inception', description: 'Description of the Inception', isFavorite: false),
  Film(
      id: '2',
      title: 'Shutter Island',
      description: 'Description of the Shutter Island',
      isFavorite: false),
  Film(
      id: '3',
      title: 'Manchester by the sea',
      description: 'Description of Manchester by the sea',
      isFavorite: false),
  Film(
      id: '4',
      title: 'Spiderman Now Way Home',
      description: 'Description of Spiderman Now Way Home',
      isFavorite: false),
];
