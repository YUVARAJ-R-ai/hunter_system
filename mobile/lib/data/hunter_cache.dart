import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// Local, per-user cache of the hunter data snapshot. Stores a plain JSON blob
/// keyed by the user id so the app can render instantly on launch
/// (stale-while-revalidate) instead of blocking on ~10 network round-trips.
///
/// Intentionally dumb: it only knows about JSON + a timestamp, so it has no
/// dependency on the domain model (avoids an import cycle with the provider).
class HunterCache {
  static const _dataPrefix = 'hunter_cache_v1_';
  static const _tsPrefix = 'hunter_cache_ts_v1_';

  Future<Map<String, dynamic>?> readJson(String uid) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString('$_dataPrefix$uid');
    if (raw == null) return null;
    try {
      return jsonDecode(raw) as Map<String, dynamic>;
    } catch (_) {
      // Corrupt or schema-drifted payload — drop it and fall back to network.
      await prefs.remove('$_dataPrefix$uid');
      return null;
    }
  }

  Future<void> writeJson(String uid, Map<String, dynamic> json) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('$_dataPrefix$uid', jsonEncode(json));
    await prefs.setString('$_tsPrefix$uid', DateTime.now().toIso8601String());
  }

  /// When the cached snapshot for [uid] was last written, or null if none.
  Future<DateTime?> lastUpdated(String uid) async {
    final prefs = await SharedPreferences.getInstance();
    final ts = prefs.getString('$_tsPrefix$uid');
    return ts == null ? null : DateTime.tryParse(ts);
  }

  Future<void> clear(String uid) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('$_dataPrefix$uid');
    await prefs.remove('$_tsPrefix$uid');
  }
}
