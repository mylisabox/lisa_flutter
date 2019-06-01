import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_speech/flutter_speech.dart';
import 'package:toast/toast.dart';

class SpeechButton extends HookWidget {
  final void Function(String text) onResults;

  const SpeechButton({Key key, @required this.onResults}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isListening = useState(false);
    final isAvailable = useState(true);
    final speech = useMemoized(() => SpeechRecognition());

    useEffect(() {
      speech.setAvailabilityHandler((available) {
        isAvailable.value = available;
      });
      speech.setRecognitionCompleteHandler((text) {
        isListening.value = false;
        onResults(text);
        Toast.show(text, context, duration: Toast.LENGTH_LONG);
      });
      return null;
    }, const []);

    useEffect(() {
      return () {
        return speech.stop();
      };
    }, [this]);

    return FloatingActionButton(
      heroTag: null,
      backgroundColor: isAvailable.value ? Theme.of(context).primaryColor : Colors.grey,
      onPressed: isAvailable.value
          ? () async {
              if (!isListening.value) {
                final isActivated = await speech.activate(Localizations.localeOf(context).toString());
                if (isActivated) {
                  await speech.listen();
                }
              }
              isListening.value = !isListening.value;
            }
          : null,
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
    );
  }
}
