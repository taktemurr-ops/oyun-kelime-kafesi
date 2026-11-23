import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_kelime_kafesi/oyun_kelime_kafesi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(kelimeKafesiConfig.title.length, 33);
    expect(kelimeKafesiConfig.tagline.length, 33);
    for (final s in kelimeKafesiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(kelimeKafesiConfig.gameId, kelimeKafesiId);
    expect(kelimeKafesiRules.gameId, kelimeKafesiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(kelimeKafesiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: kelimeKafesiId, optionalMechanics: kelimeKafesiRules.optionalMechanics);
    for (final l in ['tr', 'en']) {
      kelimeKafesiRules.lang = l;
      for (final lv in [1, 77, 1500, 33333, 99999]) {
        expect(kelimeKafesiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: '$l bölüm $lv');
      }
    }
  });
}
