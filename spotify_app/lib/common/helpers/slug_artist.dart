import 'package:diacritic/diacritic.dart';

extension SlugString on String {
  String toSlug() {
    return removeDiacritics(this)
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9\s-]'), '') // Remove special characters
        .trim()
        .replaceAll(RegExp(r'\s+'), '_') // Replace spaces with underscores
        .replaceAll(
          RegExp(r'_+'),
          '_',
        ); // Replace multiple underscores with a single one
  }
}
