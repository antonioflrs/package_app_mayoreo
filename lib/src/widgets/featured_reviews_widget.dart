import 'package:flutter/material.dart';
import '../theme/colors/app_colors.dart';

/// Datos de una reseña
class ReviewData {
  final String name;
  final double rating;
  final String review;

  const ReviewData({
    required this.name,
    required this.rating,
    required this.review,
  });
}

/// Colores personalizables para el FeaturedReviewsWidget
class FeaturedReviewsColors {
  final Color headerBackgroundColor;
  final Color headerTextColor;
  final Color starColor;
  final Color cardBackgroundColor;
  final Color cardTextColor;
  final Color cardNameColor;
  final Color indicatorActiveColor;
  final Color indicatorInactiveColor;

  const FeaturedReviewsColors({
    this.headerBackgroundColor = AppColors.backCards,
    this.headerTextColor = AppColors.black,
    this.starColor = AppColors.black,
    this.cardBackgroundColor = AppColors.softGray,
    this.cardTextColor = AppColors.black,
    this.cardNameColor = AppColors.black,
    this.indicatorActiveColor = AppColors.grayMedium,
    this.indicatorInactiveColor = AppColors.grayMedium,
  });

  /// Tema oscuro predefinido
  factory FeaturedReviewsColors.darkTheme() {
    return const FeaturedReviewsColors(
      headerBackgroundColor: Color(0xFF2C2C2C),
      headerTextColor: Colors.white,
      starColor: Colors.amber,
      cardBackgroundColor: Color(0xFF3A3A3A),
      cardTextColor: Colors.white,
      cardNameColor: Colors.white,
      indicatorActiveColor: Colors.amber,
      indicatorInactiveColor: Colors.grey,
    );
  }

  /// Tema de marca predefinido
  factory FeaturedReviewsColors.brandTheme() {
    return const FeaturedReviewsColors(
      headerBackgroundColor: Colors.green,
      headerTextColor: Colors.white,
      starColor: Colors.amber,
      cardBackgroundColor: Colors.white,
      cardTextColor: Colors.green,
      cardNameColor: Colors.green,
      indicatorActiveColor: Colors.green,
      indicatorInactiveColor: Colors.grey,
    );
  }
}

/// Widget personalizable de reseñas destacadas con carrusel automático
class FeaturedReviewsWidget extends StatefulWidget {
  final List<ReviewData> reviews;
  
  // Personalización de colores
  final FeaturedReviewsColors? colors;
  
  // Personalización de estilos
  final String? headerTitle;
  final TextStyle? headerTitleStyle;
  final TextStyle? reviewTextStyle;
  final TextStyle? reviewerNameStyle;
  
  // Personalización de tamaños
  final double? cardHeight;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? headerPadding;
  final double? cardPadding;
  final double? starSize;
  final double? indicatorSize;
  final double? indicatorActiveWidth;
  final double? indicatorInactiveWidth;
  
  // Personalización de bordes
  final double? headerBorderRadius;
  final double? cardBorderRadius;
  final double? indicatorBorderRadius;
  
  // Personalización de funcionalidad
  final bool showStars;
  final bool showIndicators;
  final bool enableAutoScroll;
  final Duration? autoScrollDelay;
  final Duration? pageTransitionDuration;
  final Curve? pageTransitionCurve;
  final int? maxStars;

  const FeaturedReviewsWidget({
    super.key,
    required this.reviews,
    this.colors,
    this.headerTitle,
    this.headerTitleStyle,
    this.reviewTextStyle,
    this.reviewerNameStyle,
    this.cardHeight,
    this.horizontalPadding,
    this.verticalPadding,
    this.headerPadding,
    this.cardPadding,
    this.starSize,
    this.indicatorSize,
    this.indicatorActiveWidth,
    this.indicatorInactiveWidth,
    this.headerBorderRadius,
    this.cardBorderRadius,
    this.indicatorBorderRadius,
    this.showStars = true,
    this.showIndicators = true,
    this.enableAutoScroll = true,
    this.autoScrollDelay,
    this.pageTransitionDuration,
    this.pageTransitionCurve,
    this.maxStars = 5,
  });

  @override
  State<FeaturedReviewsWidget> createState() => _FeaturedReviewsWidgetState();
}

class _FeaturedReviewsWidgetState extends State<FeaturedReviewsWidget> {
  late PageController _pageController;
  late int _currentPage;
  late FeaturedReviewsColors _colors;
  late double _cardHeight;
  late double _horizontalPadding;
  late double _verticalPadding;
  late double _headerPadding;
  late double _cardPadding;
  late double _starSize;
  late double _indicatorSize;
  late double _indicatorActiveWidth;
  late double _indicatorInactiveWidth;
  late double _headerBorderRadius;
  late double _cardBorderRadius;
  late double _indicatorBorderRadius;
  late Duration _autoScrollDelay;
  late Duration _pageTransitionDuration;
  late Curve _pageTransitionCurve;

  @override
  void initState() {
    super.initState();
    _initializeValues();
    _pageController = PageController();
    _currentPage = 0;
    
    if (widget.enableAutoScroll) {
      _startAutoScroll();
    }
  }

  void _initializeValues() {
    _colors = widget.colors ?? const FeaturedReviewsColors();
    _cardHeight = widget.cardHeight ?? 150.0;
    _horizontalPadding = widget.horizontalPadding ?? 20.0;
    _verticalPadding = widget.verticalPadding ?? 0.0;
    _headerPadding = widget.headerPadding ?? 8.0;
    _cardPadding = widget.cardPadding ?? 20.0;
    _starSize = widget.starSize ?? 20.0;
    _indicatorSize = widget.indicatorSize ?? 8.0;
    _indicatorActiveWidth = widget.indicatorActiveWidth ?? 24.0;
    _indicatorInactiveWidth = widget.indicatorInactiveWidth ?? 8.0;
    _headerBorderRadius = widget.headerBorderRadius ?? 12.0;
    _cardBorderRadius = widget.cardBorderRadius ?? 12.0;
    _indicatorBorderRadius = widget.indicatorBorderRadius ?? 4.0;
    _autoScrollDelay = widget.autoScrollDelay ?? const Duration(seconds: 10);
    _pageTransitionDuration = widget.pageTransitionDuration ?? const Duration(milliseconds: 1000);
    _pageTransitionCurve = widget.pageTransitionCurve ?? Curves.easeInOut;
  }

  void _startAutoScroll() {
    Future.delayed(_autoScrollDelay, () {
      if (mounted) {
        if (_currentPage < widget.reviews.length - 1) {
          _pageController.nextPage(
            duration: _pageTransitionDuration,
            curve: _pageTransitionCurve,
          );
        } else {
          _pageController.animateToPage(
            0,
            duration: _pageTransitionDuration,
            curve: _pageTransitionCurve,
          );
        }
        _startAutoScroll();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: _horizontalPadding,
        vertical: _verticalPadding,
      ),
      child: Column(
        children: [
          // Header Section
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: _headerPadding * 2.5,
              vertical: _headerPadding,
            ),
            decoration: BoxDecoration(
              color: _colors.headerBackgroundColor,
              borderRadius: BorderRadius.circular(_headerBorderRadius),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.headerTitle ?? 'Reseñas',
                  style: widget.headerTitleStyle ?? TextStyle(
                    fontSize: 18,
                    fontFamily: "InterVariable",
                    fontWeight: FontWeight.w700,
                    color: _colors.headerTextColor,
                    fontFeatures: const [
                      FontFeature('ss01'),
                      FontFeature('cv11'),
                    ],
                  ),
                ),
                if (widget.showStars)
                  Row(
                    children: List.generate(
                      widget.maxStars ?? 5,
                      (index) => Icon(
                        Icons.star,
                        color: _colors.starColor,
                        size: _starSize,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 5),

          // Reviews Carousel
          Container(
            height: _cardHeight,
            decoration: BoxDecoration(
              color: _colors.cardBackgroundColor,
              borderRadius: BorderRadius.circular(_cardBorderRadius),
            ),
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: widget.reviews.length,
              itemBuilder: (context, index) {
                return _buildReviewCard(widget.reviews[index]);
              },
            ),
          ),

          // Page Indicators
          if (widget.showIndicators)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.reviews.length,
                  (index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: _indicatorSize * 0.5),
                    width: _currentPage == index ? _indicatorActiveWidth : _indicatorInactiveWidth,
                    height: _indicatorSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(_indicatorBorderRadius),
                      color: _currentPage == index
                          ? _colors.indicatorActiveColor
                          : _colors.indicatorInactiveColor.withValues(alpha: 0.3),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildReviewCard(ReviewData review) {
    return Container(
      padding: EdgeInsets.all(_cardPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Reviewer Name
          Text(
            review.name,
            style: widget.reviewerNameStyle ?? TextStyle(
              fontSize: 16,
              fontFamily: "InterVariable",
              fontWeight: FontWeight.w700,
              color: _colors.cardNameColor,
              fontFeatures: const [
                FontFeature('ss01'),
                FontFeature('cv11'),
              ],
            ),
          ),
          const SizedBox(height: 12),
          
          // Review Text
          Expanded(
            child: Text(
              review.review,
              style: widget.reviewTextStyle ?? TextStyle(
                fontSize: 14,
                fontFamily: "InterVariable",
                fontWeight: FontWeight.w400,
                color: _colors.cardTextColor,
                height: 1.4,
                fontFeatures: const [
                  FontFeature('ss01'),
                  FontFeature('cv11'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Widget predefinido con tema oscuro
class FeaturedReviewsDark extends StatelessWidget {
  final List<ReviewData> reviews;
  final String? headerTitle;
  final bool showStars;
  final bool showIndicators;
  final bool enableAutoScroll;

  const FeaturedReviewsDark({
    super.key,
    required this.reviews,
    this.headerTitle,
    this.showStars = true,
    this.showIndicators = true,
    this.enableAutoScroll = true,
  });

  @override
  Widget build(BuildContext context) {
    return FeaturedReviewsWidget(
      reviews: reviews,
      colors: FeaturedReviewsColors.darkTheme(),
      headerTitle: headerTitle,
      showStars: showStars,
      showIndicators: showIndicators,
      enableAutoScroll: enableAutoScroll,
    );
  }
}

/// Widget predefinido con tema de marca
class FeaturedReviewsBrand extends StatelessWidget {
  final List<ReviewData> reviews;
  final String? headerTitle;
  final bool showStars;
  final bool showIndicators;
  final bool enableAutoScroll;

  const FeaturedReviewsBrand({
    super.key,
    required this.reviews,
    this.headerTitle,
    this.showStars = true,
    this.showIndicators = true,
    this.enableAutoScroll = true,
  });

  @override
  Widget build(BuildContext context) {
    return FeaturedReviewsWidget(
      reviews: reviews,
      colors: FeaturedReviewsColors.brandTheme(),
      headerTitle: headerTitle,
      showStars: showStars,
      showIndicators: showIndicators,
      enableAutoScroll: enableAutoScroll,
    );
  }
}
