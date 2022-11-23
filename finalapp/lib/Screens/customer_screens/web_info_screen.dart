import 'package:finalapp/style/style_barrel.dart';
import 'package:finalapp/utility/utility_barrel.dart';
import 'package:finalapp/widgets/widgets_barrel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WebInfoScreen extends StatefulWidget {
  final String? taskID;
  final String? orgID;
  const WebInfoScreen({
    this.taskID,
    this.orgID,
    super.key,
  });

  @override
  State<WebInfoScreen> createState() => _WebInfoScreenState();
}

class _WebInfoScreenState extends State<WebInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: OrganizationService().getTaskData(
            widget.taskID!,
            widget.orgID!,
          ),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: LoadingIndicatorWidget());
            }
            String? status;
            switch (snapshot.data['status']) {
              case 0:
                status = "Processing";
                break;
              case 1:
                status = "Out for delivery";
                break;
              case 2:
                status = "Delivered";
                break;
            }
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 50),
                        DefaultTextBox(
                          text: snapshot.data['address'],
                          title: "Address",
                        ),
                        DefaultTextBox(
                          text: snapshot.data['area'],
                          title: "City",
                        ),
                        DefaultTextBox(
                          text: snapshot.data['productID'],
                          title: "Product",
                        ),
                        DefaultTextBox(
                          text: snapshot.data['name'],
                          title: "Customer Name",
                        ),
                        DefaultTextBox(
                          text: snapshot.data['note'],
                          title: "Note",
                        ),
                        DefaultTextBox(
                          text: status!,
                          title: "Status",
                        ),
                        Visibility(
                          visible: snapshot.data['status'] >= 1 ? true : false,
                          child: DefaultTextBox(
                            text: snapshot.data['employee']['name'],
                            title: "Driver",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DefaultButton(
                          label: "Call",
                          color: oxford_blue_tint_2,
                          onTap: () async {
                            final Uri phoneUri = Uri(
                              scheme: "tel",
                              path: snapshot.data['employee']['phone'],
                            );
                            try {
                              if (await canLaunchUrlString(
                                  phoneUri.toString())) {
                                await launchUrlString(phoneUri.toString());
                              }
                            } catch (error) {
                              errorSnackBar(context, "Cannot dial");
                            }
                          },
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
