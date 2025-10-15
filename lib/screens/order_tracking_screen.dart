import 'dart:async';
import 'package:flutter/material.dart';

class OrderTrackingScreen extends StatefulWidget {
  const OrderTrackingScreen({super.key});

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  int _currentStep = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentStep < 3) {
        setState(() {
          _currentStep++;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suivi de commande'),
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
            Stepper(
              currentStep: _currentStep,
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                return const SizedBox.shrink();
              },
              steps: const [
                Step(
                  title: Text('Commande Reçue'),
                  content: Text('10:15 AM'),
                  isActive: true,
                ),
                Step(
                  title: Text('En Préparation'),
                  content: Text('Arrivée estimée: 10:30 AM'),
                  isActive: true,
                ),
                Step(
                  title: Text('Prête pour Retrait'),
                  content: Text(''),
                  isActive: true,
                ),
                Step(
                  title: Text('Livrée'),
                  content: Text(''),
                  isActive: true,
                ),
              ],
            ),
            const Divider(),
            const Text(
              'Détails de la commande',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const OrderDetail(label: 'Restaurant', value: 'Le Gourmet'),
            const OrderDetail(label: 'Commande #', value: '12345'),
            const OrderDetail(label: 'Total', value: '25,50 €'),
            const OrderDetail(label: 'Paiement', value: 'Carte de crédit'),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00D1B2),
                    ),
                    child: const Text('Contacter le restaurant', style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFA8E6CF),
                    ),
                    child: const Text('Contacter le livreur', style: TextStyle(color: Colors.black)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OrderDetail extends StatelessWidget {
  final String label;
  final String value;

  const OrderDetail({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}