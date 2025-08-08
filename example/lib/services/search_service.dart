import 'package:flutter_package_app_mayoreo/flutter_package_app_mayoreo.dart';

class SearchService {
  Future<List<SearchResult>> search(String query) async {
    // Simulate search delay
    await Future.delayed(const Duration(milliseconds: 300));
    
    // Mock search results
    return [
      SearchResult(
        id: '1',
        title: 'Resultado 1',
        description: 'Descripción del resultado 1',
        type: SearchResultType.component,
      ),
      SearchResult(
        id: '2',
        title: 'Resultado 2',
        description: 'Descripción del resultado 2',
        type: SearchResultType.token,
      ),
    ].where((result) => 
      result.title.toLowerCase().contains(query.toLowerCase()) ||
      result.description.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }
}
