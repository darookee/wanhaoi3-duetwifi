# Converting your Wanhao Duplicator i3 Melzi to a DuetWifi

## What you'll need

* DuetWifi
* Crimping tool (or pliers)
* about 2h of time
* optional: a label printer
* optional: printed case for the DuetWifi (I printed the bottom of this
  [thing](http://www.thingiverse.com/thing:1802496), but
  [this](http://www.thingiverse.com/thing:1830918) does look nice too)

## What you need to prepare

I suggest printing a case and mounting the DuetWifi in it to prevent
short-circuiting it on a table or somewhere else.

Disconnect the mains cable from you control box.

## What you have to do

The good thing about the stock board is, that most of the cables have connectors
that are pin compatible with the DuetWifi. There are only two cables you need to
add connectors to - the extruder stepper and the cooling fan, optionally the
endstops, because the two pins need to be connected on the opposite sides of the
three-pin-connector on the board. I used jumper cables for that.

So the first thing to do is DISCONNECT THE MAINS CABLE, then open up your
controller box and put labels on the cables. You can see on the Melzi-board what
every cable does. If you are unsure mark the + and - of the power and heated bed
cables separately, it matters. The heater polarity does not matter.
After you labelled them disconnect everything from the board.

The extruder stepper is connected to a screw terminal. Unscrew them and crimp on
a 4-pin connector you got with your DuetWifi. The order of the pins needs to be
the same as on the terminal. The cooling fan is also connected to a screw
terminal, put on a 2-pin connector. First check in which direction you connect
the plug to the DuetWifi and make sure to put the red and black wire in the
correct holes of the connector. If you want you can remove the connectors from
the endstop cables and replace them with 3-pin connectors, the wires go in
either end of the connector, the middle will be left empty. If you don't want to
do this you can also connect them with jumper wires.

Put your old, empty control box under the table and get your prepared DuetWifi.
Then start connecting the cables. The order in which you connect them does not
matter, just make sure to connect them to the correct ports. You may have to
remove jumpers on the z-stepper connector, you need to connect both of the
cables. The heated bed and the heater cartridge for the extruder need to be
screwed on to the terminals. Remember to check the polarity for the heated bed,
it is marked on the DuetWifi.

Now you have to chose if you know you have done everything right, or if you want
to be on the safe side and check before applying 12V to the board. Either way
you now need to connect your new board to a computer via USB and connect to it
with repetier host or something similar. Basically just follow [the
Wiki](https://duet3d.com/wiki/Getting_connected) to enable Wifi and connect to
the DuetWifi web interface. After you have this up and running you'll need a few
configuration files. You can use the files in [sys](sys/) of this repository and
modify them to your needs. Open the files in the web interface and replace them
with your configuration. The default configuration shipped with the DuetWifi
will not work and may damage your printer.

After setting everything up restart the DuetWifi, it will ask to restart after
you saved config.g, say yes.

The only thing you now can do to check if you are good to go are your endstops.
Trigger them by hand and the corresponding LED on the DuetWifi should light up.
If not check your wiring!

If everything works so far you now connect the 12V PSU. CHECK THE POLARITY and
then plug in the mains cable. Cross fingers.

Click on the 'home all' button and hover over the emergency stop. If anything
moves in the wrong direction stop the printer and check to polarity of you
stepper cables. You can either reverse them in your configuration or turn the
connector around. Try again until the printer homes all axes correctly.

Then you should check if your heated bed can get up to temperature. Set the
temperature to ~60°C (or the temperature you usually print at). If it reaches
the temperature everything is fine. You could do a PID tune for the bed, but
that does not seem to be necessary. Now do the same with the hotend. When the
hotend is hot enough try extruding 5-25mm of filament to see if the extruder
motor is moving in the right direction. You probably need to move Z up a bit
to see if it works... Do a [PID
tune](https://duet3d.com/wiki/Tuning_the_heater_temperature_control) for the
hotend.

Now you should be good to go. Upload a gcode file and start your first print
with your new DuetWifi.

[A video of the working i3](https://www.youtube.com/watch?v=eIJzJKYFMbE)
