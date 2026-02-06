- iot web interface öffnen
- passwort generieren:
pw -> remote debug -> generate
- auf pc:
- tm20.zip entpacken
- tm20 folder & script nach /home/pi/ kopieren:
scp -r tm20 pi@<IP>:/home/pi/
scp install_tm20.sh pi@<IP>:/home/pi/
- mit iot box verbinden:
ssh pi@<IP>
cd /home/pi
chmod +x install_tm20.sh
./install_tm20.sh
 
die iot box restartet automatisch, danach ist der Treiber in cups verfügbar.
drucker sollte mit AppSocket/HP JetDirect (socket:<IP>:9100) funktionieren.