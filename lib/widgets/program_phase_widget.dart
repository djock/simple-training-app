import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kappi_training/models/program_phase.dart';
import 'package:kappi_training/screens/workout_details_screen.dart';
import 'package:kappi_training/utilities/app_colors.dart';
import 'package:kappi_training/utilities/app_state.dart';

class ProgramPhaseWidget extends StatelessWidget {
  final ProgramPhaseModel phaseModel;

  const ProgramPhaseWidget({Key key, this.phaseModel}) : super(key: key);

  static BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;

    return Column(
        children: _buildPhases(),
      );
  }

  List<Widget> _buildPhases() {
    List<Widget> result = new List<Widget>();

    for(var item in phaseModel.workouts) {
      var currentActivity = AppState.workouts.firstWhere(
              (element) => element.id == item);

      result.add(
          ListTile(
              leading: SizedBox(
                  child: IconButton(
                    icon: Icon(FontAwesomeIcons.dotCircle, color: AppColors.mainColor),

                    onPressed: null, // null disables the button
                  )),
              title: Text(currentActivity.name),
              onTap: () {
                Navigator.push(
                    _context,
                    MaterialPageRoute(
                        builder: (context) => WorkoutDetailsScreen(
                          workout: currentActivity,
                        )));
              })
      );
    }

    result.add(SizedBox(height: 5,));

    return result;
  }
}


