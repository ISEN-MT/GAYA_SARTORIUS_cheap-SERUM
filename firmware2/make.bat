cd C:/Users/sarto/Documents/Travail/M1/M&T/GAYA_SARTORIUS_cheap-SERUM/firmware2
PATH=%PATH%\\\;C:/Users/sarto/Documents/Pd/externals/Fraise/bin/utils
PATH=%PATH%\\\;C:/Users/sarto/Documents/Pd/externals/Fraise/bin/win32
del C:/Users/sarto/Documents/Travail/M1/M&T/GAYA_SARTORIUS_cheap-SERUM/firmware2/firmware2.map
del C:/Users/sarto/Documents/Travail/M1/M&T/GAYA_SARTORIUS_cheap-SERUM/firmware2/make.err
if not exist "firmware2-objs/fruit" md "firmware2-objs/fruit"
C:/Users/sarto/Documents/Pd/externals/Fraise/bin/win32/sdcc --use-stdout -I"C:/Users/sarto/Documents/Pd/externals/Fraise/fruit" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/eeparams" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/core" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/FSLP" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/analog" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/switch" -DUD_SETUP -DUD_LOOP -DUD_RCVC -I. -mpic16 --vc --denable-peeps --optimize-cmp --optimize-df --obanksel=2 --opt-code-speed --fomit-frame-pointer --use-non-free --std-sdcc99 -p18f26k22 -I"C:/Users/sarto/Documents/Pd/externals/Fraise/boards/Versa2" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/bin/share/non-free/include/pic16" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/bin/share/include/pic16" -c "C:/Users/sarto/Documents/Pd/externals/Fraise/fruit/fruit.c" -o "firmware2-objs/fruit/fruit.o" >> make.err
if not exist "firmware2-objs/eeparams" md "firmware2-objs/eeparams"
C:/Users/sarto/Documents/Pd/externals/Fraise/bin/win32/sdcc --use-stdout -I"C:/Users/sarto/Documents/Pd/externals/Fraise/fruit" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/eeparams" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/core" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/FSLP" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/analog" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/switch" -DUD_SETUP -DUD_LOOP -DUD_RCVC -I. -mpic16 --vc --denable-peeps --optimize-cmp --optimize-df --obanksel=2 --opt-code-speed --fomit-frame-pointer --use-non-free --std-sdcc99 -p18f26k22 -I"C:/Users/sarto/Documents/Pd/externals/Fraise/boards/Versa2" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/bin/share/non-free/include/pic16" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/bin/share/include/pic16" -c "C:/Users/sarto/Documents/Pd/externals/Fraise/eeparams/eeparams.c" -o "firmware2-objs/eeparams/eeparams.o" >> make.err
if not exist "firmware2-objs/core" md "firmware2-objs/core"
C:/Users/sarto/Documents/Pd/externals/Fraise/bin/win32/sdcc --use-stdout -I"C:/Users/sarto/Documents/Pd/externals/Fraise/fruit" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/eeparams" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/core" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/FSLP" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/analog" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/switch" -DUD_SETUP -DUD_LOOP -DUD_RCVC -I. -mpic16 --vc --denable-peeps --optimize-cmp --optimize-df --obanksel=2 --opt-code-speed --fomit-frame-pointer --use-non-free --std-sdcc99 -p18f26k22 -I"C:/Users/sarto/Documents/Pd/externals/Fraise/boards/Versa2" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/bin/share/non-free/include/pic16" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/bin/share/include/pic16" -c "C:/Users/sarto/Documents/Pd/externals/Fraise/core/core.c" -o "firmware2-objs/core/core.o" >> make.err
if not exist "firmware2-objs/fraisedevice" md "firmware2-objs/fraisedevice"
C:/Users/sarto/Documents/Pd/externals/Fraise/bin/win32/sdcc --use-stdout -I"C:/Users/sarto/Documents/Pd/externals/Fraise/fruit" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/eeparams" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/core" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/FSLP" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/analog" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/switch" -DUD_SETUP -DUD_LOOP -DUD_RCVC -I. -mpic16 --vc --denable-peeps --optimize-cmp --optimize-df --obanksel=2 --opt-code-speed --fomit-frame-pointer --use-non-free --std-sdcc99 -p18f26k22 -I"C:/Users/sarto/Documents/Pd/externals/Fraise/boards/Versa2" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/bin/share/non-free/include/pic16" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/bin/share/include/pic16" -c "C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice/fraisedevice.c" -o "firmware2-objs/fraisedevice/fraisedevice.o" >> make.err
if not exist "firmware2-objs/FSLP" md "firmware2-objs/FSLP"
C:/Users/sarto/Documents/Pd/externals/Fraise/bin/win32/sdcc --use-stdout -I"C:/Users/sarto/Documents/Pd/externals/Fraise/fruit" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/eeparams" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/core" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/FSLP" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/analog" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/switch" -DUD_SETUP -DUD_LOOP -DUD_RCVC -I. -mpic16 --vc --denable-peeps --optimize-cmp --optimize-df --obanksel=2 --opt-code-speed --fomit-frame-pointer --use-non-free --std-sdcc99 -p18f26k22 -I"C:/Users/sarto/Documents/Pd/externals/Fraise/boards/Versa2" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/bin/share/non-free/include/pic16" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/bin/share/include/pic16" -c "C:/Users/sarto/Documents/Pd/externals/Fraise/FSLP/FSLP.c" -o "firmware2-objs/FSLP/FSLP.o" >> make.err
if not exist "firmware2-objs/analog" md "firmware2-objs/analog"
C:/Users/sarto/Documents/Pd/externals/Fraise/bin/win32/sdcc --use-stdout -I"C:/Users/sarto/Documents/Pd/externals/Fraise/fruit" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/eeparams" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/core" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/FSLP" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/analog" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/switch" -DUD_SETUP -DUD_LOOP -DUD_RCVC -I. -mpic16 --vc --denable-peeps --optimize-cmp --optimize-df --obanksel=2 --opt-code-speed --fomit-frame-pointer --use-non-free --std-sdcc99 -p18f26k22 -I"C:/Users/sarto/Documents/Pd/externals/Fraise/boards/Versa2" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/bin/share/non-free/include/pic16" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/bin/share/include/pic16" -c "C:/Users/sarto/Documents/Pd/externals/Fraise/analog/analog.c" -o "firmware2-objs/analog/analog.o" >> make.err
if not exist "firmware2-objs/switch" md "firmware2-objs/switch"
C:/Users/sarto/Documents/Pd/externals/Fraise/bin/win32/sdcc --use-stdout -I"C:/Users/sarto/Documents/Pd/externals/Fraise/fruit" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/eeparams" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/core" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/fraisedevice" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/FSLP" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/analog" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/switch" -DUD_SETUP -DUD_LOOP -DUD_RCVC -I. -mpic16 --vc --denable-peeps --optimize-cmp --optimize-df --obanksel=2 --opt-code-speed --fomit-frame-pointer --use-non-free --std-sdcc99 -p18f26k22 -I"C:/Users/sarto/Documents/Pd/externals/Fraise/boards/Versa2" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/bin/share/non-free/include/pic16" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/bin/share/include/pic16" -c "C:/Users/sarto/Documents/Pd/externals/Fraise/switch/switch.c" -o "firmware2-objs/switch/switch.o" >> make.err
C:/Users/sarto/Documents/Pd/externals/Fraise/bin/win32/sdcc --use-stdout -DUD_SETUP -DUD_LOOP -DUD_RCVC -I. -mpic16 --vc --denable-peeps --optimize-cmp --optimize-df --obanksel=2 --opt-code-speed --fomit-frame-pointer --use-non-free --std-sdcc99 -p18f26k22 -I"C:/Users/sarto/Documents/Pd/externals/Fraise/boards/Versa2" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/bin/share/non-free/include/pic16" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/bin/share/include/pic16" -c "C:/Users/sarto/Documents/Pd/externals/Fraise/core/crt0iz-rloc.c" -o "firmware2-objs/crt.o" >> make.err
C:/Users/sarto/Documents/Pd/externals/Fraise/bin/win32/sdcc --use-stdout -DUD_SETUP -DUD_LOOP -DUD_RCVC -I. -mpic16 --vc --denable-peeps --optimize-cmp --optimize-df --obanksel=2 --opt-code-speed --fomit-frame-pointer --use-non-free --std-sdcc99 -p18f26k22 -I"C:/Users/sarto/Documents/Pd/externals/Fraise/boards/Versa2" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/bin/share/non-free/include/pic16" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/bin/share/include/pic16" -c "C:/Users/sarto/Documents/Pd/externals/Fraise/boards/Versa2/boardconfig.c" -o "firmware2-objs/boardconfig.o" >> make.err
C:/Users/sarto/Documents/Pd/externals/Fraise/bin/win32/sdcc --use-stdout -DUD_SETUP -DUD_LOOP -DUD_RCVC -I. -mpic16 --vc --denable-peeps --optimize-cmp --optimize-df --obanksel=2 --opt-code-speed --fomit-frame-pointer --use-non-free --std-sdcc99 -p18f26k22 -I"C:/Users/sarto/Documents/Pd/externals/Fraise/boards/Versa2" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/bin/share/non-free/include/pic16" -I"C:/Users/sarto/Documents/Pd/externals/Fraise/bin/share/include/pic16" --use-crt="firmware2-objs/crt.o" -L"C:/Users/sarto/Documents/Pd/externals/Fraise/bin/share/lib/pic16" -L"C:/Users/sarto/Documents/Pd/externals/Fraise/bin/share/non-free/lib/pic16" -Wl"-O 1 -m -w -s C:/Users/sarto/Documents/Pd/externals/Fraise/boards/Versa2/board.lkr" -o "firmware2.hex" libsdcc.lib libc18f.lib libdev18f26k22.lib libm18f.lib "firmware2-objs/boardconfig.o" "firmware2-objs/firmware2.o" "firmware2-objs/fruit/fruit.o" "firmware2-objs/eeparams/eeparams.o" "firmware2-objs/core/core.o" "firmware2-objs/fraisedevice/fraisedevice.o" "firmware2-objs/FSLP/FSLP.o" "firmware2-objs/analog/analog.o" "firmware2-objs/switch/switch.o" >> make.err
echo make_done | to_pd 41424