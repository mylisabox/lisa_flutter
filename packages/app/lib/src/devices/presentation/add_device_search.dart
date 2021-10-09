part of 'add_device.dart';

class AddDeviceSearch extends HookWidget {
  const AddDeviceSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AddDeviceStore>(context);
    final translations = CommonLocalizations.of(context);

    useEffect(() {
      store.searchQuery = '';
      return null;
    }, const []);

    return Column(
      children: <Widget>[
        TextField(
          autofocus: true,
          decoration: InputDecoration(labelText: translations.search),
          onChanged: (value) {
            store.searchQuery = value;
          },
          onSubmitted: (value) {
            store.searchQuery = value;
          },
        ),
        Expanded(
          child: Scrollbar(
            child: SingleChildScrollView(
              child: Observer(
                builder: (context) {
                  final plugins = store.plugins;

                  if (store.searchQueryError != null) {
                    return Padding(
                      padding: const EdgeInsets.all(kNormalPadding),
                      child: Center(
                        child: Text(
                          store.searchQueryError!.cause.twoLiner(context),
                          style: TextStyle(color: Theme.of(context).errorColor),
                        ),
                      ),
                    );
                  }

                  if (plugins == null) {
                    return const Loading();
                  }

                  if (plugins.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.all(kNormalPadding),
                      child: Center(child: Text(translations.emptyList)),
                    );
                  }
                  return HookBuilder(
                    builder: (context) {
                      final expandedIndex = useState(0);
                      return ExpansionPanelList(
                        expansionCallback: (index, isExpanded) {
                          if (isExpanded && expandedIndex.value == index) {
                            expandedIndex.value = -1;
                          } else if (!isExpanded) {
                            expandedIndex.value = index;
                          }
                        },
                        children: [
                          for (var i = 0; i < plugins.length; i++)
                            ExpansionPanel(
                              headerBuilder: (context, isExpanded) {
                                return Padding(
                                  padding: const EdgeInsets.all(kNormalPadding),
                                  child: Text(plugins[i].name),
                                );
                              },
                              canTapOnHeader: true,
                              isExpanded: expandedIndex.value == i,
                              body: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  const Divider(height: 1),
                                  Padding(
                                    padding: const EdgeInsets.all(kNormalPadding),
                                    child: Wrap(
                                      spacing: 15,
                                      runSpacing: 15,
                                      children: plugins[i]
                                          .devicesSettings!
                                          .map(
                                            (settings) => _PluginDevice(
                                              settings: settings,
                                              onTap: () {
                                                store.selectPluginDeviceTemplate(plugins[i], settings);
                                              },
                                            ),
                                          )
                                          .toList(growable: false),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PluginDevice extends StatelessWidget with BaseUrlProvider {
  final DeviceSettings settings;
  final VoidCallback? onTap;

  _PluginDevice({Key? key, required this.settings, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      hoverColor: Theme.of(context).primaryColorLight,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Theme.of(context).primaryColor,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(kSmallPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              if (settings.image.endsWith('.svg'))
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(kSmallPadding),
                    child: SvgPicture.network(
                      getPluginImageUrl(settings.pluginName, settings.image),
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              if (!settings.image.endsWith('.svg'))
                Expanded(
                  child: Image.network(
                    getPluginImageUrl(settings.pluginName, settings.image),
                    width: 120,
                    height: 120,
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kSmallPadding),
                child: Text(settings.name, textAlign: TextAlign.center),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
