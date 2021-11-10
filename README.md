# ECK-88

This project is an attempt to recreate the Intel ECK-88 development kit using KiCAD software to recreate the board and schematics. There have been some additions to the board
to aid in both educational and demonstrational use. These new additions are outlined below:

 * Every address, data, and control signal is broken out to an IO header to allow for logic analyzer probing.
 * Every address, data, and most control signals are broken out to LEDs for use when single stepping.
 * A clock select was added that allows selection between the main 4 Mhz clock, an external clock, and a debounced push button
   for single stepping.
 * All GPIO lines are broken out to headers (rather than no connect from the original ECK-88)
 * All chips are socketed to allow replacement and reprogramming with ease.
 * DC Barrel jack and LM1084 linear regulator added to allow wide range of power inputs.

## Modification

If you wish to make any modifications to the current board, all of the files are designed in KiCAD. The KiCAD software can be obtained here: http://kicad.org/. All of the
custom symbols and footprints are found in the Libraries and Libraries.pretty folders and will need to be manually added to the KiCAD library search path. The board was
designed to meet the requirements of OSH Park's fabrication rules. For more information see: http://docs.oshpark.com/design-tools/kicad/

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
