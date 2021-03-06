import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:invoiceninja_flutter/data/models/entities.dart';

part 'language_model.g.dart';

abstract class LanguageListResponse implements Built<LanguageListResponse, LanguageListResponseBuilder> {

  factory LanguageListResponse([void updates(LanguageListResponseBuilder b)]) = _$LanguageListResponse;
  LanguageListResponse._();

  BuiltList<LanguageEntity> get data;

  static Serializer<LanguageListResponse> get serializer => _$languageListResponseSerializer;
}

abstract class LanguageItemResponse implements Built<LanguageItemResponse, LanguageItemResponseBuilder> {

  factory LanguageItemResponse([void updates(LanguageItemResponseBuilder b)]) = _$LanguageItemResponse;
  LanguageItemResponse._();

  LanguageEntity get data;

  static Serializer<LanguageItemResponse> get serializer => _$languageItemResponseSerializer;
}

class LanguageFields {
  static const String name = 'name';
  static const String locale = 'locale';
  
}

abstract class LanguageEntity extends Object with SelectableEntity implements Built<LanguageEntity, LanguageEntityBuilder> {

  factory LanguageEntity() {
    return _$LanguageEntity._(
      id: 0,
      name: '',
      locale: '',
    );
  }
  LanguageEntity._();

  String get name;
  String get locale;

  @override
  bool matchesSearch(String search) {
    if (search == null || search.isEmpty) {
      return true;
    }

    search = search.toLowerCase();

    if (name.toLowerCase().contains(search)) {
      return true;
    } else if (locale.toLowerCase().contains(search)) {
      return true;
    }

    return false;
  }

  @override
  String matchesSearchValue(String search) {
    if (search == null || search.isEmpty) {
      return null;
    }

    search = search.toLowerCase();

    if (locale.toLowerCase().contains(search)) {
      return locale;
    }

    return null;
  }

  @override
  String get listDisplayName {
    return name;
  }

  @override
  double get listDisplayAmount => null;

  static Serializer<LanguageEntity> get serializer => _$languageEntitySerializer;
}

