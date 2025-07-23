import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  List<Product> _favoriteProducts = [];
  bool _isLoading = false;

  List<Product> get products => _products;
  List<Product> get favoriteProducts => _favoriteProducts;
  bool get isLoading => _isLoading;

  ProductProvider() {
    fetchProducts();
    _loadFavorites();
  }

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        _products = data.map((json) => Product.fromJson(json)).toList();
      } else {
        // Handle error
        print('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network error
      print('Error fetching products: $e');
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? favoriteIds = prefs.getStringList('favoriteProducts');
    if (favoriteIds != null) {
      _favoriteProducts = _products.where((product) => favoriteIds.contains(product.id.toString())).toList();
      notifyListeners();
    }
  }

  Future<void> toggleFavorite(Product product) async {
    final prefs = await SharedPreferences.getInstance();
    if (_favoriteProducts.contains(product)) {
      _favoriteProducts.remove(product);
    } else {
      _favoriteProducts.add(product);
    }
    final List<String> favoriteIds = _favoriteProducts.map((p) => p.id.toString()).toList();
    await prefs.setStringList('favoriteProducts', favoriteIds);
    notifyListeners();
  }

  bool isFavorite(Product product) {
    return _favoriteProducts.contains(product);
  }

  void sortProducts(String sortBy) {
    switch (sortBy) {
      case 'price_low_to_high':
        _products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'price_high_to_low':
        _products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'rating':
        _products.sort((a, b) => b.rating.rate.compareTo(a.rating.rate));
        break;
    }
    notifyListeners();
  }
}