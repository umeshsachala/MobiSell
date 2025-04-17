import 'package:flutter/material.dart';
import 'package:mobisell/screens/coustmer/home/home_view_model.dart';
import 'package:provider/provider.dart';

import '../../../core/navigation/navigator.dart';
import '../../get_started/get_started_view.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home'),
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigation.push(context, const GetStartedView());
                },
              ),
            ),
            body: Center(
              child: Text(
                viewModel.message,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          );
        },
      ),
    );
  }
} 