import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/app_header.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppHeader(),
            const SizedBox(height: 20),
            const Text(
              "Monthly Spending Report",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColors.cardBg,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Total Expenses (Last 30 days)",
                      style:
                          TextStyle(color: AppColors.textGrey, fontSize: 13)),
                  const SizedBox(height: 6),
                  const Text(
                    "-\$1270.00",
                    style: TextStyle(
                        color: AppColors.red,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: const [
                      Icon(Icons.arrow_upward_rounded,
                          color: AppColors.red, size: 14),
                      SizedBox(width: 4),
                      Text("Up 12% from last month",
                          style: TextStyle(color: AppColors.red, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Spending Breakdown",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 16),
            const _SpendingRow(
              label: "Food & Drink",
              amount: "\$450.00",
              percent: "35%",
              fraction: 0.35,
              color: AppColors.red,
            ),
            const _SpendingRow(
              label: "Shopping",
              amount: "\$320.00",
              percent: "25%",
              fraction: 0.25,
              color: AppColors.accentPurple,
            ),
            const _SpendingRow(
              label: "Housing",
              amount: "\$280.00",
              percent: "22%",
              fraction: 0.22,
              color: AppColors.orange,
            ),
            const _SpendingRow(
              label: "Transport",
              amount: "\$150.00",
              percent: "12%",
              fraction: 0.12,
              color: AppColors.green,
            ),
            const _SpendingRow(
              label: "Other",
              amount: "\$70.00",
              percent: "6%",
              fraction: 0.06,
              color: AppColors.textGrey,
            ),
          ],
        ),
      ),
    );
  }
}

class _SpendingRow extends StatelessWidget {
  final String label;
  final String amount;
  final String percent;
  final double fraction;
  final Color color;

  const _SpendingRow({
    required this.label,
    required this.amount,
    required this.percent,
    required this.fraction,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label,
                  style: const TextStyle(
                      color: AppColors.textDark,
                      fontWeight: FontWeight.w600)),
              Text("$amount  ($percent)",
                  style: const TextStyle(
                      color: AppColors.textGrey, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: fraction,
              minHeight: 8,
              backgroundColor: color.withOpacity(0.15),
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ],
      ),
    );
  }
}
