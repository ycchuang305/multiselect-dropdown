import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();

  static const _headerStyle = TextStyle(
    fontSize: 12,
    color: Colors.blue,
  );
}

class _MyHomePageState extends State<MyHomePage> {
  final MultiSelectController _controller = MultiSelectController();

  final List<ValueItem> _selectedOptions = [];

  final List<ValueItem> _selectedOptions2 = [];

  static const groupOptions = <ValueItem>[
    ValueItem(
        label: 'Group header 1',
        value: '1',
        groupValue: 'a',
        isGroupHeader: true),
    ValueItem(label: 'member 1', value: '2', groupValue: 'a'),
    ValueItem(label: 'member 2', value: '3', groupValue: 'a'),
    ValueItem(label: 'member 3', value: '4', groupValue: 'a'),
    ValueItem(label: 'Option 1', value: '5'),
    ValueItem(label: 'Option 2', value: '6'),
    ValueItem(label: 'Option 3', value: '7'),
    ValueItem(label: 'Option 4', value: '8'),
    ValueItem(label: 'Option 5', value: '9'),
    ValueItem(label: 'Option 6', value: '10'),
    ValueItem(label: 'Option 7', value: '11'),
    ValueItem(label: 'Option 8', value: '12'),
    ValueItem(label: 'Option 9', value: '13'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 200),
              const Text('WRAP', style: MyHomePage._headerStyle),
              const SizedBox(
                height: 4,
              ),
              MultiSelectDropDown(
                showClearIcon: true,
                controller: _controller,
                onOptionSelected: (options) {
                  debugPrint(options.toString());
                },
                options: const <ValueItem>[
                  ValueItem(label: 'Option 1', value: '1'),
                  ValueItem(label: 'Option 2', value: '2'),
                  ValueItem(label: 'Option 3', value: '3'),
                  ValueItem(label: 'Option 4', value: '4'),
                  ValueItem(label: 'Option 5', value: '5'),
                  ValueItem(label: 'Option 6', value: '6'),
                ],
                disabledOptions: const [
                  ValueItem(label: 'Option 1', value: '1')
                ],
                selectionType: SelectionType.multi,
                chipConfig: const ChipConfig(
                    wrapType: WrapType.wrap, backgroundColor: Colors.red),
                dropdownHeight: 300,
                optionTextStyle: const TextStyle(fontSize: 16),
                selectedOptionIcon: const Icon(
                  Icons.checklist,
                  color: Colors.pink,
                ),
                selectedOptionTextColor: Colors.blue,
              ),
              const SizedBox(
                height: 50,
              ),
              Wrap(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _controller.clearAllSelection();
                      setState(() {
                        _selectedOptions.clear();
                      });
                    },
                    child: const Text('CLEAR'),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedOptions.clear();
                        _selectedOptions.addAll(_controller.selectedOptions);
                      });
                    },
                    child: const Text('Get Selected Options'),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_controller.isDropdownOpen) {
                        _controller.hideDropdown();
                      } else {
                        _controller.showDropdown();
                      }
                    },
                    child: const Text('SHOW/HIDE DROPDOWN'),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Selected Options: $_selectedOptions',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text('SCROLL', style: MyHomePage._headerStyle),
              const SizedBox(
                height: 4,
              ),
              MultiSelectDropDown(
                onOptionSelected: (options) {
                  debugPrint(options.toString());
                },
                options: const <ValueItem>[
                  ValueItem(label: 'Option 1', value: '1'),
                  ValueItem(label: 'Option 2', value: '2'),
                  ValueItem(label: 'Option 3', value: '3'),
                  ValueItem(label: 'Option 4', value: '4'),
                  ValueItem(label: 'Option 5', value: '5'),
                  ValueItem(label: 'Option 6', value: '6'),
                ],
                showHintOnItemSelected: true,
                chipLabelBuilder: (item) {
                  return SizedBox(
                    height: 30,
                    child: Center(child: Text('${item.label} !!')),
                  );
                },
                selectionType: SelectionType.multi,
                chipConfig: const ChipConfig(wrapType: WrapType.scroll),
                dropdownHeight: 400,
                optionTextStyle: const TextStyle(fontSize: 16),
                selectedOptionIcon: const Icon(Icons.check_circle),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text('FROM NETWORK', style: MyHomePage._headerStyle),
              const SizedBox(
                height: 4,
              ),
              MultiSelectDropDown.network(
                dropdownHeight: 200,
                onOptionSelected: (options) {
                  debugPrint(options.toString());
                },
                networkConfig: NetworkConfig(
                  url: 'https://jsonplaceholder.typicode.com/users',
                  method: RequestMethod.get,
                  headers: {
                    'Content-Type': 'application/json',
                  },
                ),
                chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                responseParser: (response) {
                  debugPrint('Response: $response');

                  final list = (response as List<dynamic>).map((e) {
                    final item = e as Map<String, dynamic>;
                    return ValueItem(
                      label: item['name'],
                      value: item['id'].toString(),
                    );
                  }).toList();

                  return Future.value(list);
                },
                responseErrorBuilder: ((context, body) {
                  return const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Error fetching the data'),
                  );
                }),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text('Custom option item builder',
                  style: MyHomePage._headerStyle),
              const SizedBox(
                height: 4,
              ),
              MultiSelectDropDown(
                onOptionSelected: (options) {
                  debugPrint(options.toString());
                  setState(() {
                    _selectedOptions2.clear();
                    _selectedOptions2.addAll(options);
                  });
                },
                options: groupOptions,
                optionItemBuilder: (context, index, isSelected,
                    groupHeaderTristate, option, onPressed) {
                  return GestureDetector(
                    onTap: onPressed,
                    behavior: HitTestBehavior.translucent,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          value: option.isGroupHeader
                              ? groupHeaderTristate
                              : isSelected,
                          tristate: true,
                          onChanged: (_) {
                            onPressed.call();
                          },
                        ),
                        const SizedBox(width: 16),
                        Text(
                          option.label,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                showHintOnItemSelected: true,
                selectionType: SelectionType.multi,
                chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                dropdownHeight: 370,
                optionTextStyle: const TextStyle(fontSize: 16),
                selectedOptionIcon: const Icon(Icons.check_circle),
              ),
              const SizedBox(
                height: 1200,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
