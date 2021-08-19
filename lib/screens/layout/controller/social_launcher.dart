import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class SocialLauncher {
  launchWhatsApp() async {
    final link = WhatsAppUnilink(
      phoneNumber: '+91-801695498',
    );
    await launch('$link');
  }

  launchFacebook() async {
    await launch('https://www.facebook.com/iSamratKhan/');
  }

  launchInstagram() async {
    await launch("https://www.instagram.com/printf_samrat/");
  }

  launchTwitter() async {
    await launch("https://twitter.com/RobertDowneyJr");
  }
}
