// Utility functions migrated from utils.ts
String cn(List<String?> classes) {
  // Concatenate non-null, non-empty class names (Flutter doesn't use CSS classes, but for parity)
  return classes.where((c) => c != null && c.isNotEmpty).join(' ');
}
