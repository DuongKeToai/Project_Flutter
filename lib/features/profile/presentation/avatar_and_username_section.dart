import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/features/profile/presentation/logic_holders/account_info_bloc.dart';

class AvatarAndUsernameSection extends StatelessWidget {
  const AvatarAndUsernameSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            BlocBuilder<AccountInfoBloc, AccountInfoState>(
              builder: (context, state) {
                final avatarUrl = state.accountDataFromFirestore?.avatarUrl;
                final localImageFile = state.updatedLocalImageFile;
                return Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.amber),
                  clipBehavior: Clip.hardEdge,
                  child: () {
                    if (localImageFile != null) {
                      return Image.file(
                        localImageFile,
                        fit: BoxFit.cover,
                      );
                    } else if (avatarUrl != null) {
                      return Image.network(
                        avatarUrl,
                        fit: BoxFit.cover,
                      );
                    } else {
                      return const FlutterLogo();
                    }
                  }(),
                );
              },
            ),
            Positioned(
              bottom: -5,
              right: 0,
              child: InkWell(
                onTap: () {
                  context.read<AccountInfoBloc>().add(PickImage());
                },
                child: const Icon(
                  Icons.camera_alt_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        BlocSelector<AccountInfoBloc, AccountInfoState, String?>(
          selector: (state) {
            final fullnameFromFirestore =
                state.accountDataFromFirestore?.fullName;
            return fullnameFromFirestore;
          },
          builder: (context, value) {
            return Text(
              value ?? "Người dùng mới",
              style: const TextStyle(color: Colors.white, fontSize: 26),
            );
          },
        )
      ],
    );
  }
}
