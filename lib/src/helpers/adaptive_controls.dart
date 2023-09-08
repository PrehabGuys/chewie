import 'package:chewie/chewie.dart';
import 'package:chewie/custom_buttons.dart';
import 'package:flutter/material.dart';

class AdaptiveControls extends StatelessWidget {
  const AdaptiveControls({
    Key? key,
    this.additionalButtons,
    this.playbackSpeedButton,
    required this.showProgressBar,
  }) : super(key: key);
  final CustomPlaybackSpeedButton? playbackSpeedButton;
  final List<AdditionalButton>? additionalButtons;
  final bool showProgressBar;

  @override
  Widget build(BuildContext context) {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return MaterialControls(
          additionalButtons: additionalButtons,
          showProgressBar: showProgressBar,
        );

      case TargetPlatform.macOS:
      case TargetPlatform.windows:
      case TargetPlatform.linux:
        return const MaterialDesktopControls();

      case TargetPlatform.iOS:
        return CupertinoControls(
          backgroundColor: const Color.fromRGBO(41, 41, 41, 0.7),
          iconColor: const Color.fromARGB(255, 200, 200, 200),
          additionalButtons: additionalButtons,
          playbackSpeedButton: playbackSpeedButton,
          showProgressBar: showProgressBar,
        );
      default:
        return MaterialControls(
          additionalButtons: additionalButtons,
          showProgressBar: showProgressBar,
        );
    }
  }
}
