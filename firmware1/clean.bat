cd C:/Users/sarto/Documents/Travail/M1/M&T/GAYA_SARTORIUS_cheap-SERUM/firmware1
PATH=%PATH%\\\;C:/Users/sarto/Documents/Pd/externals/Fraise/bin/utils
rmdir /q /s "firmware1-objs"
del *.map *.err *.lst *.cod make* clean*
echo make_cleaned | to_pd 41424
