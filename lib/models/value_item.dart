import 'dart:convert';

/// [label] is the item that is displayed in the list. [value] is the value that is returned when the item is selected.
/// If the [value] is not provided, the [label] is used as the value.
///
/// if [groupValue] is given, the [ValueItem] with the same [groupValue] can be all selected/unselected
/// by the [ValueItem] where its [isGroupHeader] is being set to true
///
/// An example of a [ValueItem] is:
/// ```dart
/// const ValueItem(label: 'Option 1', value: '1')
/// ```

class ValueItem {
  /// The label of the value item
  final String label;

  /// The value of the value item
  final String? value;

  final String? groupValue;

  final bool isGroupHeader;

  /// Default constructor for [ValueItem]
  const ValueItem({
    required this.label,
    this.value,
    this.groupValue,
    this.isGroupHeader = false,
  });

  /// toString method for [ValueItem]
  @override
  String toString() {
    return 'ValueItem(label: $label, value: $value, groupValue: $groupValue, isGroupHeader: $isGroupHeader)';
  }

  /// toMap method for [ValueItem]
  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'value': value,
      'groupValue': groupValue,
      'isGroupHeader': isGroupHeader,
    };
  }

  /// fromMap method for [ValueItem]
  factory ValueItem.fromMap(Map<String, dynamic> map) {
    return ValueItem(
      label: map['label'] ?? '',
      value: map['value'],
      groupValue: map['groupValue'],
      isGroupHeader: map['isGroupHeader'],
    );
  }

  /// toJson method for [ValueItem]
  String toJson() => json.encode(toMap());

  /// fromJson method for [ValueItem]
  factory ValueItem.fromJson(String source) =>
      ValueItem.fromMap(json.decode(source));

  /// Equality operator for [ValueItem]
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ValueItem &&
        other.label == label &&
        other.value == value &&
        other.groupValue == groupValue &&
        other.isGroupHeader == isGroupHeader;
  }

  /// Hashcode for [ValueItem]
  @override
  int get hashCode => label.hashCode ^ value.hashCode;

  /// CopyWith method for [ValueItem]
  ValueItem copyWith({
    String? label,
    String? value,
    String? groupValue,
    bool? isGroupHeader,
  }) {
    return ValueItem(
      label: label ?? this.label,
      value: value ?? this.value,
      groupValue: groupValue ?? this.groupValue,
      isGroupHeader: isGroupHeader ?? this.isGroupHeader,
    );
  }
}
