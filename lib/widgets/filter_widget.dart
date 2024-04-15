import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget(
      {super.key,
      required this.value,
      required this.onChange,
      required this.title,
      required this.subTitle});
  final bool value;
  final String title;
  final String subTitle;
  final Function(bool value) onChange;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value,
      onChanged: (value) {
        onChange(value);
      },
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      subtitle: Text(subTitle,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground)),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
