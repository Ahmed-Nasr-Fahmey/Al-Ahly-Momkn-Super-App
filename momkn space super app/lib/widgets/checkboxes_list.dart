import 'package:flutter/material.dart';

class CheckboxesListWidget extends StatefulWidget {
  const CheckboxesListWidget({super.key});

  @override
  _CheckboxesListWidgetState createState() => _CheckboxesListWidgetState();
}

class _CheckboxesListWidgetState extends State<CheckboxesListWidget> {
  Map<String, bool> wholesalers = {
    'Ragab Sons': true,
    'SEOUDI': false,
    'ADAM': false,
  };

  @override
  Widget build(BuildContext context) {
    int count = -1;
    return ListView(
      shrinkWrap: true,
      children: wholesalers.keys.map((String key) {
        count++;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(key),
              value: wholesalers[key],
              onChanged: (bool? value) {
                setState(() {
                  wholesalers[key] = value!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            count < wholesalers.length - 1 ? const Divider() : const SizedBox()
          ],
        );
      }).toList(),
    );
  }
}
