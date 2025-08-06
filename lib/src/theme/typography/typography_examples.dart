import 'package:flutter/material.dart';
import '../colors/app_colors.dart';
import 'app_typography.dart';

/// Examples of how to use the typography system
class TypographyExamples {
  /// Example widget showing different text styles
  static Widget buildTypographyShowcase() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display styles
          Text('Display Large', style: AppTypography.displayLarge),
          const SizedBox(height: 8),
          Text('Display Medium', style: AppTypography.displayMedium),
          const SizedBox(height: 8),
          Text('Display Small', style: AppTypography.displaySmall),
          const SizedBox(height: 24),

          // Headline styles
          Text('Headline Large', style: AppTypography.headlineLarge),
          const SizedBox(height: 8),
          Text('Headline Medium', style: AppTypography.headlineMedium),
          const SizedBox(height: 8),
          Text('Headline Small', style: AppTypography.headlineSmall),
          const SizedBox(height: 24),

          // Title styles
          Text('Title Large', style: AppTypography.titleLarge),
          const SizedBox(height: 8),
          Text('Title Medium', style: AppTypography.titleMedium),
          const SizedBox(height: 8),
          Text('Title Small', style: AppTypography.titleSmall),
          const SizedBox(height: 24),

          // Body styles
          Text('Body Large', style: AppTypography.bodyLarge),
          const SizedBox(height: 8),
          Text('Body Medium', style: AppTypography.bodyMedium),
          const SizedBox(height: 8),
          Text('Body Small', style: AppTypography.bodySmall),
          const SizedBox(height: 24),

          // Label styles
          Text('Label Large', style: AppTypography.labelLarge),
          const SizedBox(height: 8),
          Text('Label Medium', style: AppTypography.labelMedium),
          const SizedBox(height: 8),
          Text('Label Small', style: AppTypography.labelSmall),
          const SizedBox(height: 24),

          // Button styles
          Text('Button Text Small', style: AppTypography.buttonTextSmall),
          const SizedBox(height: 8),
          Text('Button Text Medium', style: AppTypography.buttonTextMedium),
          const SizedBox(height: 8),
          Text('Button Text Large', style: AppTypography.buttonTextLarge),
          const SizedBox(height: 24),

          // Specialized styles
          Text('Price: \$99.99', style: AppTypography.price),
          const SizedBox(height: 8),
          Text('Price Large: \$199.99', style: AppTypography.priceLarge),
          const SizedBox(height: 8),
          Text('BADGE', style: AppTypography.badge),
          const SizedBox(height: 8),
          Text('Code: const example = "test";', style: AppTypography.code),
          const SizedBox(height: 8),
          Text('Small Code: 12345', style: AppTypography.codeSmall),
          const SizedBox(height: 24),

          // Custom styles examples
          Text(
            'Custom Style',
            style: AppTypography.custom(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.orangeBrand,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Modified Body Style',
            style: AppTypography.withColor(
              AppTypography.bodyLarge!,
              AppColors.greenFree,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Bold Title',
            style: AppTypography.withWeight(
              AppTypography.titleMedium!,
              FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  /// Example of how to use typography in a card
  static Widget buildCardExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Product Title', style: AppTypography.titleLarge),
            const SizedBox(height: 8),
            Text(
              'This is a description of the product that uses body text style for better readability.',
              style: AppTypography.bodyMedium,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text('Price: ', style: AppTypography.bodyMedium),
                Text('\$29.99', style: AppTypography.price),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.orangeBrand,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text('NEW', style: AppTypography.badge),
            ),
          ],
        ),
      ),
    );
  }

  /// Example of how to use typography in a list item
  static Widget buildListItemExample({
    required String title,
    required String subtitle,
    required String price,
    bool isNew = false,
  }) {
    return ListTile(
      title: Text(title, style: AppTypography.titleMedium),
      subtitle: Text(subtitle, style: AppTypography.bodySmall),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(price, style: AppTypography.price),
          if (isNew) ...[
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.digitalRed,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text('NEW', style: AppTypography.badge),
            ),
          ],
        ],
      ),
    );
  }
} 