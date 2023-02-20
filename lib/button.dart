import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class Button extends StatelessWidget {
  const Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            launchUrl(Uri.parse("https://www.facebook.com/campaign/landing.php?campaign_id=1653377901&extra_1=s%7Cc%7C318307045126%7Ce%7Cfacebook%27%7C&placement=&creative=318307045126&keyword=facebook%27&partner_id=googlesem&extra_2=campaignid%3D1653377901%26adgroupid%3D65139789042%26matchtype%3De%26network%3Dg%26source%3Dnotmobile%26search_or_content%3Ds%26device%3Dc%26devicemodel%3D%26adposition%3D%26target%3D%26targetid%3Dkwd-362360550869%26loc_physical_ms%3D9075156%26loc_interest_ms%3D%26feeditemid%3D%26param1%3D%26param2%3D&gclid=CjwKCAjw3qGYBhBSEiwAcnTRLoT42dOSKNWYhtY7iDx_13iGhNbnu5H7QLfRXS6vlx2JJNJCWdLzMhoCLvAQAvD_BwE"));
          }, child: Center(child: Text("facebook"))),
          ElevatedButton(onPressed: (){
            launchUrl(Uri.parse("https://www.facebook.com/campaign/landing.php?campaign_id=1653377901&extra_1=s%7Cc%7C318307045126%7Ce%7Cfacebook%27%7C&placement=&creative=318307045126&keyword=facebook%27&partner_id=googlesem&extra_2=campaignid%3D1653377901%26adgroupid%3D65139789042%26matchtype%3De%26network%3Dg%26source%3Dnotmobile%26search_or_content%3Ds%26device%3Dc%26devicemodel%3D%26adposition%3D%26target%3D%26targetid%3Dkwd-362360550869%26loc_physical_ms%3D9075156%26loc_interest_ms%3D%26feeditemid%3D%26param1%3D%26param2%3D&gclid=CjwKCAjw3qGYBhBSEiwAcnTRLoT42dOSKNWYhtY7iDx_13iGhNbnu5H7QLfRXS6vlx2JJNJCWdLzMhoCLvAQAvD_BwE"));
          }, child: Center(child: Text(""))),
        ],
      )
    );
  }
}
