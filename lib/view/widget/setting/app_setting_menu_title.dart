import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';

class AppSettingsMenuTile extends StatelessWidget {
  const AppSettingsMenuTile({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 24, color: AppColors.primary),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
