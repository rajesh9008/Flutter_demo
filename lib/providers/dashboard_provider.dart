import 'dart:async';

import 'package:flutterappdemo/models/podcast.dart';
import 'package:flutterappdemo/utils/assets.dart';

import '../providers/base_provider.dart';

class DashBoardRepoProvider extends BaseRepoProvider {
  @override
  Future<List<PodCast>> loadData() async {
    try {
      await apiClient.getDashBoardData();

      /// updating dummy data after success or failure of API
      finishLoading();
    } catch (_) {
      receivedError();
    }
    return getDummyPodCasts();
  }
}

List<PodCast> getDummyPodCasts() => <PodCast>[
      PodCast(
          'Financial Freedom',
          AppImages.ROOM,
          AppImages.PERSON,
          'Natasha Rose',
          "Being the savages's bowsman, the is, the person who pulled the bow-oar in his boast",
          '20K Followers'),
      PodCast(
          'Minimalism Lifestyle',
          AppImages.TREE,
          AppImages.PERSON,
          'Jane Rose',
          'Put life in perspective with some short yet sage pieces of advice.',
          '20K Followers'),
      PodCast(
          'Bisnis Strategy',
          AppImages.TREE,
          AppImages.PERSON,
          'Ronald Godez',
          'These wise and beautiful words from your favorite positive thinkers will get you in the right mindset to tackle whatever obstacles lie ahead',
          '20K Followers'),
      PodCast(
          'Financial Freedom',
          AppImages.STONE,
          AppImages.PERSON,
          'Natasha Rose',
          'Inspirational quotes from successful people like Oprah, Helen Keller, and Maya Angelou can help you reframe negative thoughts during tough times and change your attitude so you feel refreshed and motivated.',
          '20K Followers')
    ];
