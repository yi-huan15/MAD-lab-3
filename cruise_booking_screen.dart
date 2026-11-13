import 'package:flutter/material.dart';
import '../viewmodels/cruise_booking_viewmodel.dart';
import 'widgets/action_bar_widget.dart';
import 'widgets/booking_controls_widget.dart';
import 'widgets/description_widget.dart';
import 'widgets/header_image_widget.dart';
import 'widgets/title_section_widget.dart';

/// VIEW layer: assembles the sub-widgets and adapts to orientation.
class CruiseBookingScreen extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const CruiseBookingScreen({super.key, required this.viewModel});

  void _snack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sibu River Cruise & Heritage'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            // Rebuild whenever the ViewModel changes.
            return ListenableBuilder(
              listenable: viewModel,
              builder: (context, _) {
                final d = viewModel.destination;

                final details = <Widget>[
                  TitleSectionWidget(
                    name: d.name,
                    location: d.location,
                    starCount: viewModel.starCount,
                    isStarred: viewModel.isStarred,
                    onStarTap: viewModel.toggleStar,
                  ),
                  ActionBarWidget(
                    onCall: () => _snack(context, 'Calling operator...'),
                    onRoute: () => _snack(context, 'Opening route...'),
                    onShare: () => _snack(context, 'Sharing cruise...'),
                  ),
                  DescriptionWidget(text: d.description),
                  BookingControlsWidget(viewModel: viewModel),
                ];

                if (orientation == Orientation.portrait) {
                  // Single scrolling column
                  return ListView(
                    children: [
                      HeaderImageWidget(
                          imageUrl: d.imageUrl, caption: d.imageCaption),
                      ...details,
                    ],
                  );
                }

                // Landscape: image (left) + scrollable details (right)
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: HeaderImageWidget(
                        imageUrl: d.imageUrl,
                        caption: d.imageCaption,
                        height: double.infinity,
                      ),
                    ),
                    const VerticalDivider(width: 1),
                    Expanded(child: ListView(children: details)),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
