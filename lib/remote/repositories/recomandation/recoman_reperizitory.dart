import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../in_memory_token.dart';

// 1. Model Classes
class HouseEntity {
  HouseEntity({
    required this.id,
    this.name,
    this.entertime,
    this.price,
    this.location,
    this.images,
    this.createdAt,
    this.logo,
    this.phone,
    this.description,
  });

  factory HouseEntity.fromJson(Map<String, dynamic> json) {
    return HouseEntity(
      id: json['id'] is int
          ? json['id'] as int
          : int.tryParse(json['id'].toString()) ?? 0,
      name: json['name']?.toString(),
      price: json['price']?.toString(),
      entertime: json['day_enter_time']?.toString(),
      logo: json['logo']?.toString(), //
      phone: json['phone']?.toString(), //
      description: json['description']?.toString(), //
      location: json['location'] != null
          ? Location.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      images: json['images'] != null
          ? (json['images'] as List)
              .map((i) => HouseImage.fromJson(i as Map<String, dynamic>))
              .toList()
          : null,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'].toString())
          : null,
    );
  }
  final int id;
  final String? name;
  final String? entertime;
  final String? price;
  final Location? location;
  final List<HouseImage>? images;
  final DateTime? createdAt;
  final String? logo; //
  final String? phone; //
  final String? description; //
}

class Location {
  Location({this.parentName});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      parentName: json['parent_name'] as String?,
    );
  }
  final String? parentName;
}

class HouseImage {
  HouseImage({required this.url});

  factory HouseImage.fromJson(Map<String, dynamic> json) {
    return HouseImage(
      url: (json['url'] ?? '').toString(),
    );
  }
  final String url;
}

// 2. Repository
class HouseRepository {
  HouseRepository(this._dio);
  final Dio _dio;

  Future<List<HouseEntity>> getRecommendedHouses({int limit = 5}) async {
    try {
      final response = await _dio.get(
        'https://mekanly.com.tm/api/v2/houses/recommendations',
        queryParameters: {'limit': limit},
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            if (InMemoryToken.instance.token != null)
              'Authorization': 'Bearer ${InMemoryToken.instance.token}',
          },
        ),
      );

      if (response.statusCode == 200) {
        // ignore: avoid_dynamic_calls
        final data = response.data['data'] as List;
        return data
            .map((json) => HouseEntity.fromJson(json as Map<String, dynamic>))
            .toList();
      }
      throw Exception('Failed to load recommendations');
    } on DioException catch (e) {
      throw Exception('Dio error: ${e.message}');
    }
  }
}

// 3. Provider
class RecommendationProvider with ChangeNotifier {
  final HouseRepository _repository;
  List<HouseEntity> _recommendations = [];
  bool _isLoading = false;
  String? _error;

  RecommendationProvider(this._repository);

  List<HouseEntity> get recommendations => _recommendations;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchRecommendations() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _recommendations = await _repository.getRecommendedHouses();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
