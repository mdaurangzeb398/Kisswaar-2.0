// 📄 lib/services/platform_share_service.dart

class PlatformShareService {
  static Future<void> postToAllPlatforms(String mediaPath, String caption) async {
    await FacebookPoster.post(mediaPath, caption);
    await InstagramPoster.post(mediaPath, caption);
    await YouTubeShortPoster.post(mediaPath, caption);
    // add Twitter, Telegram, WhatsApp
  }
}
