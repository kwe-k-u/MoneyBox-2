import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneybox_upgrade/utils/resources.dart';


class SimplePrivacyPage extends StatefulWidget {
  @override
  _SimplePrivacyPageState createState() => _SimplePrivacyPageState();
}

class _SimplePrivacyPageState extends State<SimplePrivacyPage> {
  int _step = 0;





  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Stepper(
        currentStep: _step,

        onStepTapped: (step){
          setState(() {
            _step = step;
          });
        },
        onStepCancel: (){
          setState(() {
            if (_step > 0)
              _step--; //todo change the cancel text to back, or hide it
          });
        },
        onStepContinue: (){
          setState(() {
            if (_step <3)
              _step++;
          });
        },
        steps: [

          Step(
              title: Text("Introduction"),
              content: Text("We have realised how confusing and lengthy terms and conditions are. So this is a summary"
                  " of stuff we believe should be highlighted for you. Check out the full terms and conditions <here>. Your use of the app is in agreement with all the terms and conditions outside of the summary")
          ),

            //Storage permission
            Step(title: Text("Permission: Storage"),
                content: Column(
                  children: [
                    Placeholder(fallbackHeight: 200.0, fallbackWidth: 60.0,),
                    Text("This permission allows us to save and retrieve your preferences"
                        " such as theme."
                        ,style: GoogleFonts.aladin()
                    )
                  ],
                )),


            //Internet connectivity
            Step(title: Text("Google Account"),
                content: Column(
                  children: [
                    Placeholder(fallbackHeight: 200.0, fallbackWidth: 60.0,),
                    Text("This allows us to uniquely identify users(authentication during login)"
                        " to prevent wrong access to information.\nIt also allows us to refer to you by your Google account name"
                        ,style: GoogleFonts.aladin()
                    )
                  ],
                )),


            //Internet connectivity
            Step(
                title: Text("Internet connectivity"),
                content: Column(
                  children: [
                    Placeholder(fallbackHeight: 200.0, fallbackWidth: 60.0,),
                    Text("1. access Google servers to authenticate users, and \n 2.access our servers to retrieve"
                        " stored transaction histories of authenticated users\n3. Upload new transaction history of authenticated users"
                        ,style: GoogleFonts.aladin()
                    )
                  ],
                ),

              //todo get stickers(images) to replace placeholder
              //todo add shared preference for if it has been read

            ),


        ],
      ),
    );
  }
}
