// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_article_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNewsArticleCollectionCollection on Isar {
  IsarCollection<NewsArticleCollection> get newsArticleCollections =>
      this.collection();
}

const NewsArticleCollectionSchema = CollectionSchema(
  name: r'NewsArticleCollection',
  id: 5234069608283898343,
  properties: {
    r'articleId': PropertySchema(
      id: 0,
      name: r'articleId',
      type: IsarType.long,
    ),
    r'imageUrl': PropertySchema(
      id: 1,
      name: r'imageUrl',
      type: IsarType.string,
    ),
    r'newsSite': PropertySchema(
      id: 2,
      name: r'newsSite',
      type: IsarType.string,
    ),
    r'publishedAt': PropertySchema(
      id: 3,
      name: r'publishedAt',
      type: IsarType.string,
    ),
    r'summary': PropertySchema(
      id: 4,
      name: r'summary',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 5,
      name: r'title',
      type: IsarType.string,
    ),
    r'url': PropertySchema(
      id: 6,
      name: r'url',
      type: IsarType.string,
    )
  },
  estimateSize: _newsArticleCollectionEstimateSize,
  serialize: _newsArticleCollectionSerialize,
  deserialize: _newsArticleCollectionDeserialize,
  deserializeProp: _newsArticleCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'articleId': IndexSchema(
      id: 2849477555030470394,
      name: r'articleId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'articleId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _newsArticleCollectionGetId,
  getLinks: _newsArticleCollectionGetLinks,
  attach: _newsArticleCollectionAttach,
  version: '3.1.0+1',
);

int _newsArticleCollectionEstimateSize(
  NewsArticleCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.imageUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.newsSite;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.publishedAt;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.summary;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.title;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.url;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _newsArticleCollectionSerialize(
  NewsArticleCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.articleId);
  writer.writeString(offsets[1], object.imageUrl);
  writer.writeString(offsets[2], object.newsSite);
  writer.writeString(offsets[3], object.publishedAt);
  writer.writeString(offsets[4], object.summary);
  writer.writeString(offsets[5], object.title);
  writer.writeString(offsets[6], object.url);
}

NewsArticleCollection _newsArticleCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NewsArticleCollection();
  object.articleId = reader.readLongOrNull(offsets[0]);
  object.id = id;
  object.imageUrl = reader.readStringOrNull(offsets[1]);
  object.newsSite = reader.readStringOrNull(offsets[2]);
  object.publishedAt = reader.readStringOrNull(offsets[3]);
  object.summary = reader.readStringOrNull(offsets[4]);
  object.title = reader.readStringOrNull(offsets[5]);
  object.url = reader.readStringOrNull(offsets[6]);
  return object;
}

P _newsArticleCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _newsArticleCollectionGetId(NewsArticleCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _newsArticleCollectionGetLinks(
    NewsArticleCollection object) {
  return [];
}

void _newsArticleCollectionAttach(
    IsarCollection<dynamic> col, Id id, NewsArticleCollection object) {
  object.id = id;
}

extension NewsArticleCollectionByIndex
    on IsarCollection<NewsArticleCollection> {
  Future<NewsArticleCollection?> getByArticleId(int? articleId) {
    return getByIndex(r'articleId', [articleId]);
  }

  NewsArticleCollection? getByArticleIdSync(int? articleId) {
    return getByIndexSync(r'articleId', [articleId]);
  }

  Future<bool> deleteByArticleId(int? articleId) {
    return deleteByIndex(r'articleId', [articleId]);
  }

  bool deleteByArticleIdSync(int? articleId) {
    return deleteByIndexSync(r'articleId', [articleId]);
  }

  Future<List<NewsArticleCollection?>> getAllByArticleId(
      List<int?> articleIdValues) {
    final values = articleIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'articleId', values);
  }

  List<NewsArticleCollection?> getAllByArticleIdSync(
      List<int?> articleIdValues) {
    final values = articleIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'articleId', values);
  }

  Future<int> deleteAllByArticleId(List<int?> articleIdValues) {
    final values = articleIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'articleId', values);
  }

  int deleteAllByArticleIdSync(List<int?> articleIdValues) {
    final values = articleIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'articleId', values);
  }

  Future<Id> putByArticleId(NewsArticleCollection object) {
    return putByIndex(r'articleId', object);
  }

  Id putByArticleIdSync(NewsArticleCollection object, {bool saveLinks = true}) {
    return putByIndexSync(r'articleId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByArticleId(List<NewsArticleCollection> objects) {
    return putAllByIndex(r'articleId', objects);
  }

  List<Id> putAllByArticleIdSync(List<NewsArticleCollection> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'articleId', objects, saveLinks: saveLinks);
  }
}

extension NewsArticleCollectionQueryWhereSort
    on QueryBuilder<NewsArticleCollection, NewsArticleCollection, QWhere> {
  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterWhere>
      anyArticleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'articleId'),
      );
    });
  }
}

extension NewsArticleCollectionQueryWhere on QueryBuilder<NewsArticleCollection,
    NewsArticleCollection, QWhereClause> {
  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterWhereClause>
      articleIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'articleId',
        value: [null],
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterWhereClause>
      articleIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'articleId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterWhereClause>
      articleIdEqualTo(int? articleId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'articleId',
        value: [articleId],
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterWhereClause>
      articleIdNotEqualTo(int? articleId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'articleId',
              lower: [],
              upper: [articleId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'articleId',
              lower: [articleId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'articleId',
              lower: [articleId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'articleId',
              lower: [],
              upper: [articleId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterWhereClause>
      articleIdGreaterThan(
    int? articleId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'articleId',
        lower: [articleId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterWhereClause>
      articleIdLessThan(
    int? articleId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'articleId',
        lower: [],
        upper: [articleId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterWhereClause>
      articleIdBetween(
    int? lowerArticleId,
    int? upperArticleId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'articleId',
        lower: [lowerArticleId],
        includeLower: includeLower,
        upper: [upperArticleId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension NewsArticleCollectionQueryFilter on QueryBuilder<
    NewsArticleCollection, NewsArticleCollection, QFilterCondition> {
  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> articleIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'articleId',
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> articleIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'articleId',
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> articleIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'articleId',
        value: value,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> articleIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'articleId',
        value: value,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> articleIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'articleId',
        value: value,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> articleIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'articleId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> imageUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imageUrl',
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> imageUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imageUrl',
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> imageUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> imageUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> imageUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> imageUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> imageUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> imageUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
          QAfterFilterCondition>
      imageUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
          QAfterFilterCondition>
      imageUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> imageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> imageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> newsSiteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'newsSite',
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> newsSiteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'newsSite',
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> newsSiteEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'newsSite',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> newsSiteGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'newsSite',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> newsSiteLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'newsSite',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> newsSiteBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'newsSite',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> newsSiteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'newsSite',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> newsSiteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'newsSite',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
          QAfterFilterCondition>
      newsSiteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'newsSite',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
          QAfterFilterCondition>
      newsSiteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'newsSite',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> newsSiteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'newsSite',
        value: '',
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> newsSiteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'newsSite',
        value: '',
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> publishedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'publishedAt',
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> publishedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'publishedAt',
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> publishedAtEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'publishedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> publishedAtGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'publishedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> publishedAtLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'publishedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> publishedAtBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'publishedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> publishedAtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'publishedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> publishedAtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'publishedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
          QAfterFilterCondition>
      publishedAtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'publishedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
          QAfterFilterCondition>
      publishedAtMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'publishedAt',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> publishedAtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'publishedAt',
        value: '',
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> publishedAtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'publishedAt',
        value: '',
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> summaryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'summary',
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> summaryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'summary',
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> summaryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'summary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> summaryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'summary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> summaryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'summary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> summaryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'summary',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> summaryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'summary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> summaryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'summary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
          QAfterFilterCondition>
      summaryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'summary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
          QAfterFilterCondition>
      summaryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'summary',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> summaryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'summary',
        value: '',
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> summaryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'summary',
        value: '',
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> titleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> titleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> titleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> titleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
          QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
          QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> urlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'url',
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> urlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'url',
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> urlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> urlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> urlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> urlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'url',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
          QAfterFilterCondition>
      urlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
          QAfterFilterCondition>
      urlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'url',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection,
      QAfterFilterCondition> urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'url',
        value: '',
      ));
    });
  }
}

extension NewsArticleCollectionQueryObject on QueryBuilder<
    NewsArticleCollection, NewsArticleCollection, QFilterCondition> {}

extension NewsArticleCollectionQueryLinks on QueryBuilder<NewsArticleCollection,
    NewsArticleCollection, QFilterCondition> {}

extension NewsArticleCollectionQuerySortBy
    on QueryBuilder<NewsArticleCollection, NewsArticleCollection, QSortBy> {
  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterSortBy>
      sortByArticleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'articleId', Sort.asc);
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterSortBy>
      sortByArticleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'articleId', Sort.desc);
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterSortBy>
      sortByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterSortBy>
      sortByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterSortBy>
      sortByNewsSite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'newsSite', Sort.asc);
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterSortBy>
      sortByNewsSiteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'newsSite', Sort.desc);
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterSortBy>
      sortByPublishedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publishedAt', Sort.asc);
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterSortBy>
      sortByPublishedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publishedAt', Sort.desc);
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterSortBy>
      sortBySummary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summary', Sort.asc);
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterSortBy>
      sortBySummaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summary', Sort.desc);
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterSortBy>
      sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterSortBy>
      sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterSortBy>
      sortByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterSortBy>
      sortByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension NewsArticleCollectionQuerySortThenBy
    on QueryBuilder<NewsArticleCollection, NewsArticleCollection, QSortThenBy> {
  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterSortBy>
      thenByArticleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'articleId', Sort.asc);
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterSortBy>
      thenByArticleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'articleId', Sort.desc);
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterSortBy>
      thenByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterSortBy>
      thenByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterSortBy>
      thenByNewsSite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'newsSite', Sort.asc);
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterSortBy>
      thenByNewsSiteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'newsSite', Sort.desc);
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterSortBy>
      thenByPublishedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publishedAt', Sort.asc);
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterSortBy>
      thenByPublishedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publishedAt', Sort.desc);
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterSortBy>
      thenBySummary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summary', Sort.asc);
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterSortBy>
      thenBySummaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summary', Sort.desc);
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterSortBy>
      thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterSortBy>
      thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterSortBy>
      thenByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QAfterSortBy>
      thenByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension NewsArticleCollectionQueryWhereDistinct
    on QueryBuilder<NewsArticleCollection, NewsArticleCollection, QDistinct> {
  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QDistinct>
      distinctByArticleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'articleId');
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QDistinct>
      distinctByImageUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QDistinct>
      distinctByNewsSite({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'newsSite', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QDistinct>
      distinctByPublishedAt({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'publishedAt', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QDistinct>
      distinctBySummary({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'summary', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QDistinct>
      distinctByTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewsArticleCollection, NewsArticleCollection, QDistinct>
      distinctByUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'url', caseSensitive: caseSensitive);
    });
  }
}

extension NewsArticleCollectionQueryProperty on QueryBuilder<
    NewsArticleCollection, NewsArticleCollection, QQueryProperty> {
  QueryBuilder<NewsArticleCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NewsArticleCollection, int?, QQueryOperations>
      articleIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'articleId');
    });
  }

  QueryBuilder<NewsArticleCollection, String?, QQueryOperations>
      imageUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageUrl');
    });
  }

  QueryBuilder<NewsArticleCollection, String?, QQueryOperations>
      newsSiteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'newsSite');
    });
  }

  QueryBuilder<NewsArticleCollection, String?, QQueryOperations>
      publishedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'publishedAt');
    });
  }

  QueryBuilder<NewsArticleCollection, String?, QQueryOperations>
      summaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'summary');
    });
  }

  QueryBuilder<NewsArticleCollection, String?, QQueryOperations>
      titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<NewsArticleCollection, String?, QQueryOperations> urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'url');
    });
  }
}
