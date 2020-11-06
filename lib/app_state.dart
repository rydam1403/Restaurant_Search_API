import 'search_filter_page.dart';
import 'restaurant_item.dart';
import 'api.dart';

class AppState{
  final SearchOptions searchOptions = SearchOptions(
      location: xlocations.first,
      order: xorder.first,
      sort: xsort.first,
    count: xcount,

  );
}