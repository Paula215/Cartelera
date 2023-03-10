// Generated by https://quicktype.io

import 'dart:convert';

import 'package:equatable/equatable.dart';

class Trailer extends Equatable {
  final int id;
  final List<Result> results;

  Trailer({
    required this.id,
    required this.results,
  });

  @override
  // TODO: implement props
  List<Object> get props => [id, results];

  Trailer copyWith({
    int? id,
    List<Result>? results,
  }) {
    return Trailer(
      id: id ?? this.id,
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'results': results.map((x) => x.toMap()).toList()});

    return result;
  }

  factory Trailer.fromMap(Map<String, dynamic> map) {
    return Trailer(
      id: map['id']?.toInt() ?? 0,
      results: List<Result>.from(map['results']?.map((x) => Result.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Trailer.fromJson(String source) =>
      Trailer.fromMap(json.decode(source));

  @override
  String toString() => 'Trailer(id: $id, results: $results)';
}

class Result extends Equatable {
  final String iso6391;
  final String iso31661;
  final String name;
  final String key;
  final String site;
  final int size;
  final String type;
  final bool official;
  final String publishedAt;
  final String id;

  const Result({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

  Result copyWith({
    final String? iso6391,
    final String? iso31661,
    final String? name,
    final String? key,
    final String? site,
    final int? size,
    final String? type,
    final bool? official,
    final String? publishedAt,
    final String? id,
  }) {
    return Result(
      iso6391: iso6391 ?? this.iso6391,
      iso31661: iso31661 ?? this.iso31661,
      name: name ?? this.name,
      key: key ?? this.key,
      site: site ?? this.site,
      size: size ?? this.size,
      type: type ?? this.type,
      official: official ?? this.official,
      publishedAt: publishedAt ?? this.publishedAt,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'iso6391': iso6391});
    result.addAll({'iso31661': iso31661});
    result.addAll({'name': name});
    result.addAll({'key': key});
    result.addAll({'site': site});
    result.addAll({'size': size});
    result.addAll({'type': type});
    result.addAll({'official': official});
    result.addAll({'publishedAt': publishedAt});
    result.addAll({'id': id});

    return result;
  }

  factory Result.fromMap(Map<String, dynamic> map) {
    return Result(
      iso6391: map['iso6391'] ?? '',
      iso31661: map['iso31661'] ?? '',
      name: map['name'] ?? '',
      key: map['key'] ?? '',
      site: map['site'] ?? '',
      size: map['size']?.toInt() ?? 0,
      type: map['type'] ?? '',
      official: map['official'] ?? false,
      publishedAt: map['publishedAt'] ?? '',
      id: map['id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Result.fromJson(String source) => Result.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Result(iso6391: $iso6391, iso31661: $iso31661, name: $name, key: $key, site: $site, size: $size, type: $type, official: $official, publishedAt: $publishedAt, id: $id)';
  }

  @override
  List<Object> get props {
    return [
      iso6391,
      iso31661,
      name,
      key,
      site,
      size,
      type,
      official,
      publishedAt,
      id,
    ];
  }
}
