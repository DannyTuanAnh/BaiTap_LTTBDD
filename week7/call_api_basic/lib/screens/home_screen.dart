import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/api_service.dart';
import '../widgets/product_card.dart';
import '../widgets/empty_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();
  bool isLoading = false;
  String message = 'Tap the button to fetch product';
  Product? product;

  Future<void> fetchProduct() async {
    setState(() {
      isLoading = true;
      message = 'Loading...';
    });

    try {
      final fetchedProduct = await _apiService.fetchProduct();
      setState(() {
        isLoading = false;
        product = fetchedProduct;
        message = 'Product loaded successfully!';
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        message = 'Error: $e';
        product = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Viewer'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepPurple.shade50, Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildFetchButton(),
              const SizedBox(height: 24),
              Expanded(
                child: product != null
                    ? SingleChildScrollView(
                        child: ProductCard(product: product!),
                      )
                    : EmptyState(message: message),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFetchButton() {
    return ElevatedButton(
      onPressed: isLoading ? null : fetchProduct,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isLoading)
            const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            )
          else
            const Icon(Icons.cloud_download),
          const SizedBox(width: 8),
          Text(
            isLoading ? 'Loading...' : 'Fetch Product',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
