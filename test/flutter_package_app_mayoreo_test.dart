import 'package:flutter_package_app_mayoreo/src/widgets/buttons/primary_button.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('PrimaryButton displays correct text', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PrimaryButton(
            text: 'Test Button',
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(find.text('Test Button'), findsOneWidget);
  });
}
