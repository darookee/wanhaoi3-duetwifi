; Auto calibration routine for delta printers
; Before running this, you should have set up your zprobe Z offset to suit your build, in the G31 command in config.g.

M561                        ; clear any bed transform, otherwise homing may be at the wrong height
G31 X0 Y0                   ; don't want any probe offset for this
G28                         ; home the printer

G30 P0 X0 Y30 Z-99999 H0
G30 P1 X0 Y200 Z-99999 H0
G30 P2 X150 Y200 Z-99999 H0
G30 P3 X150 Y30 Z-99999 H0
G30 P4 X100 Y100 Z-99999 S4

M98 homeall.g
