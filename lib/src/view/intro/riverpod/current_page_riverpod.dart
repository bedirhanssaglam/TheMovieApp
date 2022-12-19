import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateNotifierProvider<CurrentPageStatus, Object?> currentPageRiverpod =
    StateNotifierProvider((ref) {
  return CurrentPageStatus();
});

class CurrentPageStatus extends StateNotifier<int> {
  CurrentPageStatus() : super(0);
}
