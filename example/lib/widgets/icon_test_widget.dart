import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class IconTestWidget extends StatelessWidget {
  const IconTestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Icono SVG'),
        backgroundColor: AppColors.backCards,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Test 1: Icono SVG directo
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.silverGrayMedium),
              ),
              child: SvgPicture.asset(
                'assets/icons/stroke/search_icon.svg',
                width: 40,
                height: 40,
                colorFilter: ColorFilter.mode(
                  AppColors.black,
                  BlendMode.srcIn,
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // Test 2: Icono Material como comparación
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.silverGrayMedium),
              ),
              child: Icon(
                Icons.search,
                size: 40,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 20),
            
            // Test 3: Buscador completo
            Container(
              width: 300,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.backCards,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: AppColors.silverGrayMedium,
                  width: 1,
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar en B Life®️ Mayoreo',
                  hintStyle: TextStyle(
                    color: AppColors.darkGray,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset(
                      'assets/icons/stroke/search_icon.svg',
                      width: 20,
                      height: 20,
                      colorFilter: ColorFilter.mode(
                        AppColors.grayMedium,
                        BlendMode.srcIn,
                      ),
                      placeholderBuilder: (context) => Icon(
                        Icons.search,
                        color: AppColors.grayMedium,
                        size: 20,
                      ),
                    ),
                  ),
                  contentPadding: const EdgeInsets.only(
                    left: 16,
                    right: 8,
                    top: 12,
                    bottom: 12,
                  ),
                ),
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 