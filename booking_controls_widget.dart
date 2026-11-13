import 'package:flutter/material.dart';
import '../../viewmodels/cruise_booking_viewmodel.dart';

/// PreferenceSection: Visit Date Picker, Cruise Package Dropdown, Dark Mode Switch.
/// Every control reads from / writes to the ViewModel.
class BookingControlsWidget extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const BookingControlsWidget({super.key, required this.viewModel});

  Future<void> _pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: viewModel.selectedDate,
      firstDate: viewModel.firstSelectableDate,
      lastDate: viewModel.lastSelectableDate,
      helpText: 'SELECT CRUISE DATE',
    );
    if (picked != null) viewModel.setDate(picked);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.surfaceContainerHighest.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Trip Preferences',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),

          // 1) Visit Date Picker tile
          InkWell(
            onTap: () => _pickDate(context),
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today, size: 20),
                  const SizedBox(width: 12),
                  const Expanded(child: Text('Cruise Date')),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: colors.primary.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(viewModel.formattedDate,
                        style: TextStyle(
                            color: colors.primary,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ),

          // 2) Cruise package dropdown
          Row(
            children: [
              const Icon(Icons.directions_boat, size: 20),
              const SizedBox(width: 12),
              const Expanded(child: Text('Cruise Package')),
              DropdownButton<String>(
                value: viewModel.selectedPackage,
                underline: const SizedBox.shrink(),
                items: viewModel.packages
                    .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                    .toList(),
                onChanged: viewModel.setPackage,
              ),
            ],
          ),

          // 3) Dark mode switch
          Row(
            children: [
              const Icon(Icons.dark_mode, size: 20),
              const SizedBox(width: 12),
              const Expanded(child: Text('Dark Mode')),
              Switch(
                value: viewModel.isDarkMode,
                onChanged: viewModel.setDarkMode,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
