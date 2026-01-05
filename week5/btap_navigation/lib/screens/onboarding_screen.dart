import 'package:flutter/material.dart';
import '../models/onboarding_data.dart';
import '../widgets/onboarding_page.dart';
import 'home_screen.dart';

/// Onboarding Screen - Màn hình giới thiệu ứng dụng
/// Hiển thị 3 trang giới thiệu với navigation
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late final List<OnboardingData> _onboardingPages;

  @override
  void initState() {
    super.initState();
    _onboardingPages = OnboardingData.getPages();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// Logic chuyển đến trang trước
  void _goToPreviousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  /// Logic chuyển đến trang kế tiếp hoặc Home
  void _goToNextPageOrHome() {
    if (_currentPage == _onboardingPages.length - 1) {
      _navigateToHome();
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  /// Logic bỏ qua onboarding và đến Home
  void _navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Column(children: [_buildPageView(), _buildBottomSection()]),
    );
  }

  /// AppBar với nút Skip
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        TextButton(
          onPressed: _navigateToHome,
          child: const Text(
            'Skip',
            style: TextStyle(color: Colors.blue, fontSize: 16),
          ),
        ),
      ],
    );
  }

  /// PageView chứa các trang onboarding
  Widget _buildPageView() {
    return Expanded(
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemCount: _onboardingPages.length,
        itemBuilder: (context, index) {
          return OnboardingPage(data: _onboardingPages[index]);
        },
      ),
    );
  }

  /// Phần dưới cùng: indicators và buttons
  Widget _buildBottomSection() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          _buildPageIndicators(),
          const SizedBox(height: 24),
          _buildNavigationButtons(),
        ],
      ),
    );
  }

  /// Page indicators (chấm tròn)
  Widget _buildPageIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _onboardingPages.length,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: _currentPage == index ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: _currentPage == index ? Colors.blue : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  /// Navigation buttons (Back và Next/Get Started)
  Widget _buildNavigationButtons() {
    return Row(
      children: [
        if (_currentPage > 0) _buildBackButton(),
        const Spacer(),
        _buildNextButton(),
      ],
    );
  }

  /// Nút Back
  Widget _buildBackButton() {
    return ElevatedButton(
      onPressed: _goToPreviousPage,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade50,
        foregroundColor: Colors.blue,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(16),
      ),
      child: const Icon(Icons.arrow_back),
    );
  }

  /// Nút Next/Get Started
  Widget _buildNextButton() {
    final isLastPage = _currentPage == _onboardingPages.length - 1;
    return ElevatedButton(
      onPressed: _goToNextPageOrHome,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Text(
        isLastPage ? 'Get Started' : 'Next',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
