import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateNotifierProvider<CurrentPageRiverpod, Object?> currentPageRiverpod =
    StateNotifierProvider((ref) {
  return CurrentPageRiverpod();
});

class CurrentPageRiverpod extends StateNotifier<int> {
  CurrentPageRiverpod() : super(0);
}
