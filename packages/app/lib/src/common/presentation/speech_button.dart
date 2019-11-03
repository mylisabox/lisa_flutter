import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_speech/flutter_speech.dart';
import 'package:lisa_flutter/src/common/stores/speech_store.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class SpeechButton extends HookWidget {
  final void Function(String text) onResults;
  final bool isFloating;

  const SpeechButton({
    Key key,
    this.isFloating = true,
    this.onResults,
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
        Toast.show(text, context, duration: Toast.LENGTH_LONG);
        if (onResults == null) {
          final response = await Provider.of<SpeechStore>(context, listen: false).sendSentence(text, Localizations.localeOf(context).languageCode);
          Toast.show(response, context, duration: Toast.LENGTH_LONG);
        } else {
          onResults(text);
        }
      });
      return null;
    }, const []);

    useEffect(() {
      return () {
        return speech.stop();
      };
    }, [this]);

    return isFloating
        ? FloatingActionButton(
            heroTag: null,
            backgroundColor: isAvailable.value ? Theme.of(context).primaryColor : Colors.grey,
            onPressed: isAvailable.value ? () => onSpeechClicked(context, isListening, speech) : null,
            child: isListening.value
                ? Container(
                    width: 25,
                    child: FlareActor(
                      'assets/animations/AudioWave.flr',
                      fit: BoxFit.contain,
                      isPaused: false,
                      shouldClip: false,
                      animation: 'loop',
                    ),
                  )
                : Icon(Icons.mic),
          )
        : IconButton(
            icon: isListening.value
                ? Container(
              width: 25,
              child: FlareActor(
                'assets/animations/AudioWave.flr',
                fit: BoxFit.contain,
                isPaused: false,
                shouldClip: false,
                animation: 'loop',
              ),
            )
                : Icon(Icons.mic),
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
