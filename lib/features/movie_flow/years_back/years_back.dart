import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_recommendation_app/core/constant.dart';
import 'package:movie_recommendation_app/core/widgets/primary_button.dart';
import 'package:movie_recommendation_app/features/movie_flow/movie_flow_controller.dart';
import 'package:movie_recommendation_app/features/movie_flow/result/result_screen.dart';

class YearsBackScreen extends ConsumerWidget {
  const YearsBackScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed:
              ref.read(movieFlowControllerProvider.notifier).previousPage,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'How many years back should we check for?',
              style: theme.textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${ref.watch(movieFlowControllerProvider).yearsBack}',
                  style: theme.textTheme.displayMedium,
                ),
                Text(
                  'Years back',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: theme.textTheme.headlineMedium?.color
                        ?.withOpacity(0.62),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Slider(
              onChanged: (value) {
                ref
                    .read(movieFlowControllerProvider.notifier)
                    .updateYearsBack(value.toInt());
              },
              value:
                  ref.watch(movieFlowControllerProvider).yearsBack.toDouble(),
              min: 0,
              max: 70,
              divisions: 70,
              label: '${ref.watch(movieFlowControllerProvider).yearsBack}',
            ),
            const Spacer(),
            PrimaryButton(
              onPressed: () => Navigator.of(context).push(ResultScreen.route()),
              text: 'Amazing',
            ),
            const SizedBox(height: kMediumSpacing),
          ],
        ),
      ),
    );
  }
}
