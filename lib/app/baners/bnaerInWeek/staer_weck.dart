import 'package:canary_app/app/baners/bnaerInWeek/components/titlePaeg.dart';
import 'package:canary_app/app/baners/bnaerInWeek/rankingCPlove.dart';
import 'package:canary_app/app/baners/bnaerInWeek/rankingRoom.dart';
import 'package:canary_app/app/baners/bnaerInWeek/rankingRoulette.dart';
import 'package:canary_app/app/baners/bnaerInWeek/rankingWealthy.dart';

import 'package:flutter/material.dart';

class StaerWeck extends StatefulWidget {
  const StaerWeck({super.key});

  @override
  State<StaerWeck> createState() => _StaerWeckState();
}

class _StaerWeckState extends State<StaerWeck> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                SizedBox(height: 50),
                TitlePage(),
                RankingWealthy(),
                RankingRoom(),
                RankingCPlove(),
                RankingRoulette(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
