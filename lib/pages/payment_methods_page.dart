import 'package:flutter/material.dart';

class PaymentMethodsPage extends StatefulWidget {
  const PaymentMethodsPage({super.key});

  @override
  State<PaymentMethodsPage> createState() => _PaymentMethodsPageState();
}

class _PaymentMethodsPageState extends State<PaymentMethodsPage> {
  String? _selectedPaymentMethod = 'Visa'; // Default selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Method'),
        backgroundColor: const Color(0xFF1E6F86),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Payment Method',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // First card: Visa ...2747
            _buildPaymentCard(
              context: context,
              cardType: 'Visa',
              lastDigits: '2747',
              expiry: '09/27',
              isSelected: _selectedPaymentMethod == 'Visa',
              onTap: () {
                setState(() {
                  _selectedPaymentMethod = 'Visa';
                });
              },
            ),
            const SizedBox(height: 12),

            // Second card: Master Card
            _buildPaymentCard(
              context: context,
              cardType: 'Master Card',
              lastDigits: null,
              expiry: '09/27',
              isSelected: _selectedPaymentMethod == 'Master Card',
              onTap: () {
                setState(() {
                  _selectedPaymentMethod = 'Master Card';
                });
              },
            ),
            const SizedBox(height: 12),

            // Cash by hand option
            _buildCashOption(
              context: context,
              isSelected: _selectedPaymentMethod == 'Cash',
              onTap: () {
                setState(() {
                  _selectedPaymentMethod = 'Cash';
                });
              },
            ),
            const SizedBox(height: 24),

            // + Add Payment Method button
            _buildAddPaymentButton(context),

            const Spacer(),

            // Confirm button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  String message = 'Selected: $_selectedPaymentMethod';
                  if (_selectedPaymentMethod == 'Cash') {
                    message = 'Cash on delivery selected';
                  }
                  _showSnackbar(context, message);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E6F86),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Confirm Payment Method',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Updated payment card with selection
  Widget _buildPaymentCard({
    required BuildContext context,
    required String cardType,
    String? lastDigits,
    required String expiry,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    String cardDisplay;
    if (lastDigits != null) {
      cardDisplay = '$cardType ...$lastDigits';
    } else {
      cardDisplay = cardType;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF1E6F86).withOpacity(0.1)
              : Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? const Color(0xFF1E6F86) : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Radio button
            Radio<String>(
              value: cardType,
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value;
                });
              },
              activeColor: const Color(0xFF1E6F86),
            ),
            const SizedBox(width: 8),
            // Card details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cardDisplay,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: isSelected
                          ? const Color(0xFF1E6F86)
                          : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Expiate $expiry',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            // Edit and Remove buttons
            Row(
              children: [
                _buildActionButton(
                  label: 'Edit',
                  onPressed: () {
                    _showSnackbar(context, 'Edit $cardDisplay');
                  },
                ),
                const SizedBox(width: 8),
                _buildActionButton(
                  label: 'Remove',
                  onPressed: () {
                    _showSnackbar(context, 'Remove $cardDisplay');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Cash by hand option
  Widget _buildCashOption({
    required BuildContext context,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF1E6F86).withOpacity(0.1)
              : Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? const Color(0xFF1E6F86) : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Radio button
            Radio<String>(
              value: 'Cash',
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value;
                });
              },
              activeColor: const Color(0xFF1E6F86),
            ),
            const SizedBox(width: 8),
            // Cash icon and text
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.money, color: Colors.green, size: 24),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cash by hand',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Pay with cash upon delivery/service',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required VoidCallback onPressed,
  }) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.blue, fontSize: 14),
      ),
    );
  }

  Widget _buildAddPaymentButton(BuildContext context) {
    return Center(
      child: TextButton.icon(
        onPressed: () {
          _showSnackbar(context, 'Add Payment Method tapped');
        },
        icon: const Icon(Icons.add, color: Colors.blue),
        label: const Text(
          'Add Payment Method',
          style: TextStyle(color: Colors.blue, fontSize: 16),
        ),
      ),
    );
  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
