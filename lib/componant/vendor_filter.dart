import 'package:flutter/material.dart';

class VendorFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ActionChip(
              elevation: 3.0,
              backgroundColor: Colors.black54,
              label: Text(
                'All Vendors',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {},
            ),
            ActionChip(
              elevation: 3.0,
              backgroundColor: Colors.black54,
              label: Text(
                'Active',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {},
            ),
            ActionChip(
              elevation: 3.0,
              backgroundColor: Colors.black54,
              label: Text(
                'Inactive',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {},
            ),
            ActionChip(
              elevation: 3.0,
              backgroundColor: Colors.black54,
              label: Text(
                'Top Picked',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {},
            ),
            ActionChip(
              elevation: 3.0,
              backgroundColor: Colors.black54,
              label: Text(
                'Top Rated',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
