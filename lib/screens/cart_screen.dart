import 'package:flutter/material.dart';
import 'package:app/screens/order_tracking_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Récapitulatif'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Votre commande',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const CartItem(
              name: 'Burger Signature',
              quantity: 1,
              price: 12.99,
            ),
            const CartItem(
              name: 'Frites Croustillantes',
              quantity: 1,
              price: 3.99,
            ),
            const CartItem(
              name: 'Boisson Fraîche',
              quantity: 1,
              price: 2.50,
            ),
            const Divider(),
            const CostSummary(
              subtotal: 19.48,
              deliveryFee: 2.00,
              total: 21.48,
            ),
            const SizedBox(height: 16),
            const Text(
              'Méthode de paiement',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const PaymentMethod(
              method: 'Mobile Money',
              isSelected: true,
            ),
            const PaymentMethod(
              method: 'Carte Bancaire',
              isSelected: false,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OrderTrackingScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00D1B2),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Payer et confirmer la commande', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String name;
  final int quantity;
  final double price;

  const CartItem({
    super.key,
    required this.name,
    required this.quantity,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$name (Quantité: $quantity)'),
          Text('${price.toStringAsFixed(2)}€'),
        ],
      ),
    );
  }
}

class CostSummary extends StatelessWidget {
  final double subtotal;
  final double deliveryFee;
  final double total;

  const CostSummary({
    super.key,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Récapitulatif des coûts',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Sous-total'),
            Text('${subtotal.toStringAsFixed(2)}€'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Frais de livraison'),
            Text('${deliveryFee.toStringAsFixed(2)}€'),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('${total.toStringAsFixed(2)}€', style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}

class PaymentMethod extends StatelessWidget {
  final String method;
  final bool isSelected;

  const PaymentMethod({
    super.key,
    required this.method,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(method),
        trailing: isSelected ? const Icon(Icons.check_circle, color: Color(0xFF00D1B2)) : const Icon(Icons.radio_button_unchecked),
      ),
    );
  }
}