import "package:flutter/material.dart";

class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: getSettingsPageDecoration(
          const Color(0xff3a57e8),
        ),
        child: ListView.separated(
          itemCount: 3,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            return buildListTile(
              title: index == 0
                  ? "Change Password"
                  : index == 1
                      ? "Dark mode"
                      : index == 2
                          ? "Notifications"
                          : "",
            );
          },
        ),
      ),
    );
  }

  ListTile buildListTile({required String title}) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      textColor: Colors.white,
      trailing:
          const Icon(Icons.keyboard_arrow_right_sharp, color: Colors.white),
    );
  }

  Decoration getSettingsPageDecoration(Color color) {
    return BoxDecoration(
      color: color,
      borderRadius: const BorderRadius.all(Radius.circular(16)),
    );
  }
}

Decoration getSettingsPageDecoration(Color color) {
  return BoxDecoration(
    color: color,
    borderRadius: const BorderRadius.all(Radius.circular(16)),
  );
}
