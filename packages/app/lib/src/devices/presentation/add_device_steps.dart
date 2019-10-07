part of 'add_device.dart';

class AddDeviceImageStep extends HookWidget with BaseUrlProvider {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AddDeviceStore>(context);
    return Image.network(
      prefixHostIfNeeded(store.currentCustomStep['image']),
    );
  }
}

class AddDeviceSettingsStep extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final formValidatorKey = useMemoized(() => GlobalKey<RemoteFormValidatorProviderState>());
    final controller = useTextEditingController();
    final store = Provider.of<AddDeviceStore>(context);
    final translations = CommonLocalizations.of(context);

    return Observer(
      builder: (_) => Column(
        children: <Widget>[
          TextField(
            controller: controller,
            onChanged: (value) {
              store.formUpdate('name', value, formValidatorKey.currentState.isFormValid());
            },
            onSubmitted: (_) {
              FocusScope.of(context).nextFocus();
            },
            decoration: InputDecoration(labelText: translations.nameField + '*'),
          ),
          RemoteForm(
            validatorKey: formValidatorKey,
            data: store.formData,
            onChanges: (key, value, {associatedData}) {
              //delay form validation check on next frame to let the last change propagate, or we will have one step late on validation
              WidgetsBinding.instance.addPostFrameCallback((_) {
                store.formUpdate(key, value, formValidatorKey.currentState.isFormValid());
              });
            },
            onSubmit: (formData, {associatedData}) {
              //will never append
            },
            definition: store.deviceSettings,
          ),
        ],
      ),
    );
  }
}

class AddDeviceListStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AddDeviceStore>(context);
    final translations = CommonLocalizations.of(context);

    return Observer(
      builder: (context) {
        final items = store.availableDevices;
        final step = store.currentCustomStep['step'];
        final singleChoice = store.currentCustomStep['singleChoice'] ?? false;
        final selectedItems = store.currentCustomData[step]; // List of items or selected item if singleChoice

        if (items == null || items.length == 0) {
          return Center(child: Text(translations.emptyList));
        }

        return Column(
          children: <Widget>[
            if (!singleChoice)
              CheckboxListTile(
                value: store.allDevicesSelected,
                onChanged: (selected) {
                  store.selectAllDevices(selected);
                },
                title: Text(translations.selectAll),
              ),
            if (!singleChoice) Divider(height: 1),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (_, index) {
                  final item = items[index];
                  if (singleChoice) {
                    return RadioListTile(
                      value: item,
                      groupValue: selectedItems,
                      onChanged: (selected) {
                        store.selectDevice(item);
                      },
                      title: Text(item['name']),
                    );
                  }
                  return CheckboxListTile(
                    value: selectedItems?.firstWhere((selectedItem) => item['id'] == selectedItem['id'], orElse: () => null) != null,
                    onChanged: (selected) {
                      store.selectDevice(item, selected: selected);
                    },
                    title: Text(item['name']),
                  );
                },
                separatorBuilder: (_, index) {
                  return Divider(height: 1);
                },
                itemCount: items.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
