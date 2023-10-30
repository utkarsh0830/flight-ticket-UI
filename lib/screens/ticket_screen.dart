import 'package:booktticket/screens/ticket_view.dart';
import 'package:booktticket/utils/app_info_list.dart';
import 'package:booktticket/utils/app_layout.dart';
import 'package:booktticket/utils/app_style.dart';
import 'package:booktticket/widgets/column_layout.dart';
import 'package:booktticket/widgets/layout_builder_widget.dart';
import 'package:booktticket/widgets/ticket_tabs.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:barcode_widget/barcode_widget.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Stack(
      children: [
        ListView(
          padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(20),vertical: AppLayout.getHeight(20)),
          children: [
            Gap(AppLayout.getHeight(40)),
            Text("Tickets",style: Styles.headLineStyle),
            Gap(AppLayout.getHeight(20)),
            const AppTicketTabs(firstTab: "Upcoming", secondTab: "Previous"),
            Gap(AppLayout.getHeight(20)),
            Container(
              padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
              child: TicketView(ticket: ticketList[0],isColor: true,),
            ),
            const SizedBox(height: 1,),

            Container(

              color: Colors.white,
              margin: EdgeInsets.only(left: 15,right: 15),
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
              child: Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                     AppColumnLayout(firstText:"Flutter DB",secondText: "Passenger",
                     alignment: CrossAxisAlignment.start,isColor : false),
                      AppColumnLayout(firstText: "55221 34567", secondText: "passport",alignment:
                        CrossAxisAlignment.end,isColor: false,),
                    ],
                  ),
                  Gap(AppLayout.getHeight(20)),
                   const AppLayoutBuilder(sections: 15,isColor : false,width: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumnLayout(firstText:"5221 36486935",secondText: "Number of E-ticket",
                          alignment: CrossAxisAlignment.start,isColor : false),
                      AppColumnLayout(firstText:"B2SG2B",secondText: "Booking code",
                          alignment: CrossAxisAlignment.start,isColor : false),
                    ],
                  ),
                  Gap(AppLayout.getHeight(20)),
                  AppLayoutBuilder(sections: 15,isColor : false,width: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/images/VISA.jpg",scale:65,),
                              Text(" *** 2462",style: Styles.headLineStyle3,)
                            ],
                          ),
                          Gap(5),
                          Text("Payment Method",style: Styles.headLineStyle4,)
                        ],
                      ),
                      const AppColumnLayout(firstText:"\249.99",secondText: "Price",
                          alignment: CrossAxisAlignment.end,isColor : false),
                    ],
                  ),

                ],
              ),
            ),

            SizedBox(height: 1,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(AppLayout.getHeight(21)),
                  bottomLeft: Radius.circular(AppLayout.getHeight(21)),
                )
              ),
              //color: Colors.white,
              margin: EdgeInsets.only(left: AppLayout.getHeight(15),right: AppLayout.getHeight(15)),
              padding: EdgeInsets.only(top: 20,bottom: 20),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(15)),
                child: ClipRRect(
                  borderRadius : BorderRadius.circular(AppLayout.getHeight(15)),
                  child: BarcodeWidget(data: 'https//github.com/martinovovo', barcode: Barcode.code128(),
                  drawText: false,
                  color: Styles.textColor,
                  width: double.infinity,
                  height: 70,
                  ),
                ),
              ),
            ),
            Gap(AppLayout.getHeight(20)),
            Container(
              padding: EdgeInsets.only(left: AppLayout.getHeight(15),),
              child: TicketView(ticket: ticketList[0]),
            )
          ],
        ),
        Positioned(
          left: AppLayout.getHeight(22),
          top: AppLayout.getHeight(295),
          child: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Styles.textColor,width: 2),
            ),
            child: CircleAvatar(
              maxRadius: 4,
              backgroundColor: Styles.textColor,

            ),
          ),
        ),
        Positioned(
          right: AppLayout.getHeight(22),
          top: AppLayout.getHeight(295),
          child: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Styles.textColor,width: 2),
            ),
            child: CircleAvatar(
              maxRadius: 4,
              backgroundColor: Styles.textColor,

            ),
          ),
        )
      ],
      ),
    );
  }
}
