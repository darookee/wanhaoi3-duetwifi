; DuetWIFI config
M111 S0                             ; Debug off
M550 DuetHaoi3                      ; Machine name (can be anything you like)
M551 i3                             ; Machine password (currently not used)
M552 S1                             ; Enable WiFi
M555 P2                             ; Set output to look like Marlin
M575 P1 B57600 S1                   ; Set auxiliary serial port baud rate and require checksum (for PanelDue)

; Movement
G21                                 ; Work in millimetres

M569 P0 S0                          ; Drive 0 goes backwards
M569 P1 S0                          ; Drive 1 goes backwards
M569 P2 S1                          ; Drive 2 goes forwards
M569 P3 S1                          ; Drive 3 goes forwards

M906 X855 Y855 Z1080 E855           ; Set motor currents (mA)
M201 X1000 Y800 Z100 E5000          ; Accelerations (mm/s^2)
M203 X12000 Y12000 Z120 E3000       ; Maximum speeds (mm/min)
M566 X600 Y600 Z18 E20              ; Maximum jerk speeds mm/minute

M574 X1 Y1 Z1 S0                    ; set homing switch configuration
M208 X200 Y200 Z180                 ; set axis maxima and high homing switch positions (adjust to suit your machine)
M208 X-8 Y-8 Z-0.5 S1               ; set axis minima and low homing switch positions (adjust to make X=0 and Y=0 the edges of the bed)

M350 X16 Y16 Z16 E16 I1             ; set 16x microstepping with interpolation
M92 X80 Y80 Z400 E98                ; set axis steps/mm

G90                                 ; Send absolute coordinates...
M83                                 ; ...but relative extruder moves

; Z-Probe
; M558 P1 X0 Y0 Z1 H3 F200 T5000      ; smart IR Z probe, used for homing Z axis only, dive height 3mm, probe speed 200mm/min, travel speed 5000mm/min
; G31 P500 X-45 Y45 Z0.66             ; set threshold and offsets

; Heaters + Thermistors
M305 P0 T100000 B3950 R4700 H0 L0   ; Put your own H and/or L values here to set the bed thermistor ADC correction
M305 P1 T100000 B4388 R4700 H0 L0   ; Put your own H and/or L values here to set the first nozzle thermistor ADC correction

M307 H0 A193 C719.9 D8.7 B0         ; bed heater settings
M307 H1 A219 C128 D13.9 B0          ; extruder heater settings

M570 S120                           ; Increase to allow extra heating time if needed

M106 P2 T55 H1                      ; Run Coldend-Fan at 55°C

; T0
M563 P0 D0 H1                       ; tool 0 uses extruder drive 0 and heater 1
G10 P0 S0 R0 X0 Y0                  ; set tool 0 temperatures and offsets

; the end
M556 S100 X0 Y0 Z0                  ; Put your axis compensation here
T0                                  ; Select the first head
