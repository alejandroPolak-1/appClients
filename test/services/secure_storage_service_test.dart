import 'package:flutter_test/flutter_test.dart';
import 'package:tots_stacked_app/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('SecureStorageServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
