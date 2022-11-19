import 'dart:math';

extension IterableExtensions<E> on Iterable<E> {
  /// Splits a list into multiple lists with length of `chunkSize`
  Iterable<List<E>> chunked(int chunkSize) sync* {
    if (length <= 0) {
      yield [];
      return;
    }
    int skip = 0;
    while (skip < length) {
      final chunk = this.skip(skip).take(chunkSize);
      yield chunk.toList(growable: false);
      skip += chunkSize;
      if (chunk.length < chunkSize) return;
    }
  }
}

extension RandomListItem<T> on List<T> {
  /// Retruns a random element of the list
  T randomItem() {
    return this[Random().nextInt(length)];
  }
}
