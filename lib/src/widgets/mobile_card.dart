import 'package:flutter/material.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class MobileCard extends StatelessWidget {
  final String title;
  final String description;
  final String? packageIconPath;
  final IconData? icon;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? iconColor;

  const MobileCard({
    super.key,
    required this.title,
    required this.description,
    this.packageIconPath,
    this.icon,
    this.onTap,
    this.backgroundColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: AppColors.white,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              // Icon without background
              packageIconPath != null
                  ? PackageIcon(
                      iconPath: packageIconPath!,
                      size: 28,
                      color: iconColor ?? AppColors.grayMedium,
                    )
                  : Icon(
                      icon ?? Icons.widgets,
                      color: iconColor ?? AppColors.grayMedium,
                      size: 28,
                    ),
              
              const SizedBox(width: 16),
              
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.grayMedium,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Arrow
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppColors.grayMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
} 