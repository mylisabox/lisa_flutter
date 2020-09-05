import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lisa_flutter/src/common/stores/user_store.dart';
import 'package:lisa_flutter/src/common/utils/wear.dart';
import 'package:lisa_flutter/src/login/stores/login_store.dart';
import 'package:provider/provider.dart';

class LoginWearScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context);
    final store = useMemoized(() => LoginStore(
          userStore: userStore,
        ));

    useEffect(() {
      store.init();
      return null;
    }, [store]);

    return Provider.value(
      value: store,
      child: AmbientMode(
          builder: (context, mode) => Scaffold(
                backgroundColor: mode == Mode.active ? Colors.grey : Colors.black,
                body: Center(
                    child: Text(
                  'Wear is working',
                  style: TextStyle(color: Colors.red),
                )),
              )),
    );
  }
}
