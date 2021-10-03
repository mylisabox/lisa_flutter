import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_speech/flutter_speech.dart';
import 'package:lisa_flutter/src/common/constants.dart';
import 'package:lisa_flutter/src/common/stores/speech_store.dart';
import 'package:lisa_flutter/src/common/utils/extensions.dart';
import 'package:provider/provider.dart';

class SpeechButton extends HookWidget {
  final void Function(String text)? onResults;
  final bool isFloating;
  final String? roomId;

  const SpeechButton({
    Key? key,
    this.isFloating = true,
    this.onResults,
    this.roomId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isListening = useState(false);
    final isAvailable = useState(true);
    final speech = useMemoized(() => SpeechRecognition());

    useEffect(() {
      speech.setAvailabilityHandler((available) {
        isAvailable.value = available;
      });
      speech.setRecognitionCompleteHandler((text) async {
        isListening.value = false;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(text),
            action: SnackBarAction(
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              label: 'Ok',
            )));
        if (onResults == null) {
          final response = await Provider.of<SpeechStore>(context, listen: false).sendSentence(text, Localizations.localeOf(context).languageCode, roomId);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(response),
              action: SnackBarAction(
                  onPressed: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                  label: 'Ok')));
        } else {
          onResults!(text);
        }
      });
      return null;
    }, const []);

    useEffect(() {
      return () async {
        return speech.stop();
      };
    }, [this]);

    return isFloating
        ? FloatingActionButton(
            heroTag: 'voiceCommand',
            backgroundColor: isAvailable.value ? context.theme.bottomAppBarColor : kDisabledColor,
            onPressed: isAvailable.value ? () => onSpeechClicked(context, isListening, speech) : null,
            child: isListening.value
                ? SizedBox(
                    width: 25,
                    child: FlareActor(
                      'assets/animations/AudioWave.flr',
                      fit: BoxFit.contain,
                      isPaused: false,
                      shouldClip: false,
                      animation: 'loop',
                      color: context.primaryColor,
                    ),
                  )
                : Icon(Icons.mic, color: context.primaryColor),
          )
        : IconButton(
            icon: isListening.value
                ? SizedBox(
                    width: 25,
                    child: FlareActor(
                      'assets/animations/AudioWave.flr',
                      fit: BoxFit.contain,
                      isPaused: false,
                      shouldClip: false,
                      animation: 'loop',
                      color: context.primaryColor,
                    ),
                  )
                : Icon(Icons.mic, color: context.primaryColor),
            onPressed: isAvailable.value ? () => onSpeechClicked(context, isListening, speech) : null,
          );
  }

  void onSpeechClicked(BuildContext context, ValueNotifier<bool> isListening, SpeechRecognition speech) async {
    if (!isListening.value) {
      final isActivated = await speech.activate(Localizations.localeOf(context).toString());
      if (isActivated) {
        await speech.listen();
      }
    }
    isListening.value = !isListening.value;
  }
}
