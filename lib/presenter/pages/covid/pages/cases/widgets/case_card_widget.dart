import 'package:flutter/material.dart';

import '../../../../../../domain/entities/covid/case_entity.dart';
import '../../../../../../core/utils/extensions/number_extension.dart';

class CaseCardWidget extends StatelessWidget {
  final CaseEntity caseEntity;

  final confirmedTextStyle = TextStyle(
    color: Colors.yellow[800],
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  final recoveredTextStyle = TextStyle(
    color: Colors.green[800],
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  final deathsTextStyle = TextStyle(
    color: Colors.red[800],
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  CaseCardWidget(this.caseEntity);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[700],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              caseEntity.country ?? '',
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              'Population: ${caseEntity.population?.decimal ?? 'Not Informed'}',
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.caption,
            ),
            Divider(
              color: Colors.transparent,
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blueGrey[800],
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Flex(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                direction: Axis.horizontal,
                children: [
                  Flexible(
                    child: Column(
                      children: [
                        Text(
                          'Confirmed',
                          style: confirmedTextStyle,
                        ),
                        Text(
                          '${caseEntity.confirmed.decimal}',
                          style: confirmedTextStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      children: [
                        Text(
                          'Recovered',
                          style: recoveredTextStyle,
                        ),
                        Text(
                          '${caseEntity.recovered.decimal}',
                          style: recoveredTextStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      children: [
                        Text(
                          'Deaths',
                          style: deathsTextStyle,
                        ),
                        Text(
                          '${caseEntity.deaths.decimal}',
                          style: deathsTextStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
