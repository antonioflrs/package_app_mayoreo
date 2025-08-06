import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/widgets/sidebar_navigation.dart';
import '../lib/widgets/app_bar_widget.dart';

void main() {
  group('SidebarNavigation Callbacks Tests', () {
    testWidgets('AppBar onMenuPressed should open drawer', (WidgetTester tester) async {
      final scaffoldKey = GlobalKey<ScaffoldState>();
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            key: scaffoldKey,
            appBar: AppBarWidget(
              title: 'Test',
              onMenuPressed: () => scaffoldKey.currentState?.openDrawer(),
            ),
            drawer: SidebarNavigation(
              selectedItem: null,
              searchQuery: '',
              onSearchChanged: (query) {},
              onItemSelected: (item) {},
              onClose: () {},
            ),
          ),
        ),
      );

      // Buscar el botón de menú en el AppBar
      final menuButton = find.byIcon(Icons.menu);
      expect(menuButton, findsOneWidget);

      // Hacer tap en el botón de menú
      await tester.tap(menuButton);
      await tester.pumpAndSettle();

      // Verificar que el drawer se abrió
      expect(find.byType(Drawer), findsOneWidget);
    });

    testWidgets('SidebarNavigation should render correctly with all callbacks', (WidgetTester tester) async {
      bool onSearchChangedCalled = false;
      bool onItemSelectedCalled = false;
      bool onCloseCalled = false;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            drawer: SidebarNavigation(
              selectedItem: null,
              searchQuery: '',
              onSearchChanged: (query) {
                onSearchChangedCalled = true;
              },
              onItemSelected: (item) {
                onItemSelectedCalled = true;
              },
              onClose: () {
                onCloseCalled = true;
              },
            ),
          ),
        ),
      );

      // Verificar que el widget se renderiza correctamente
      expect(find.byType(SidebarNavigation), findsOneWidget);
      
      // Verificar que los callbacks están configurados (no llamados aún)
      expect(onSearchChangedCalled, isFalse);
      expect(onItemSelectedCalled, isFalse);
      expect(onCloseCalled, isFalse);
    });

    testWidgets('AppBarWidget should render correctly with menu button', (WidgetTester tester) async {
      bool menuPressed = false;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: AppBarWidget(
              title: 'Test AppBar',
              onMenuPressed: () {
                menuPressed = true;
              },
            ),
          ),
        ),
      );

      // Verificar que el AppBar se renderiza
      expect(find.byType(AppBarWidget), findsOneWidget);
      
      // Verificar que el botón de menú está presente
      expect(find.byIcon(Icons.menu), findsOneWidget);
      
      // Verificar que el callback no se ha llamado aún
      expect(menuPressed, isFalse);
    });

    testWidgets('AppBarWidget should render correctly without menu button', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: AppBarWidget(
              title: 'Test AppBar',
              showMenuButton: false,
            ),
          ),
        ),
      );

      // Verificar que el AppBar se renderiza
      expect(find.byType(AppBarWidget), findsOneWidget);
      
      // Verificar que el botón de menú NO está presente
      expect(find.byIcon(Icons.menu), findsNothing);
    });

    testWidgets('AppBarWidget should render correctly with search button', (WidgetTester tester) async {
      bool searchPressed = false;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: AppBarWidget(
              title: 'Test AppBar',
              onSearchPressed: () {
                searchPressed = true;
              },
            ),
          ),
        ),
      );

      // Verificar que el AppBar se renderiza
      expect(find.byType(AppBarWidget), findsOneWidget);
      
      // Verificar que el botón de búsqueda está presente
      expect(find.byIcon(Icons.search), findsOneWidget);
      
      // Verificar que el callback no se ha llamado aún
      expect(searchPressed, isFalse);
    });

    testWidgets('AppBarWidget should render correctly without search button', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: AppBarWidget(
              title: 'Test AppBar',
              showSearchButton: false,
            ),
          ),
        ),
      );

      // Verificar que el AppBar se renderiza
      expect(find.byType(AppBarWidget), findsOneWidget);
      
      // Verificar que el botón de búsqueda NO está presente
      expect(find.byIcon(Icons.search), findsNothing);
    });
  });
} 