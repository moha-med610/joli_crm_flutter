/// Utility class for handling partial customer updates
class UpdateHelper {
  /// Compare old and new data, return only changed fields
  static Map<String, dynamic> getChangedFields({
    required Map<String, dynamic> oldData,
    required Map<String, dynamic> newData,
  }) {
    final changedFields = <String, dynamic>{};

    newData.forEach((key, newValue) {
      final oldValue = oldData[key];
      
      // Include field if it's different from old value
      if (oldValue != newValue) {
        changedFields[key] = newValue;
      }
    });

    return changedFields;
  }

  /// Check if any field has changed
  static bool hasChanges({
    required Map<String, dynamic> oldData,
    required Map<String, dynamic> newData,
  }) {
    return getChangedFields(oldData: oldData, newData: newData).isNotEmpty;
  }

  /// Create a map with only non-null values
  static Map<String, dynamic> removeNullValues(Map<String, dynamic> data) {
    return Map.from(data)..removeWhere((_, value) => value == null);
  }
}
