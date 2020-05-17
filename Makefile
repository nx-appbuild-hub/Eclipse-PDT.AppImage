SOURCE="http://mirror.ibcp.fr/pub/eclipse//technology/epp/downloads/release/2019-09/R/eclipse-php-2019-09-R-linux-gtk-x86_64.tar.gz"
DESTINATION="build.tar.bz2"
OUTPUT="Eclipse-PDT.AppImage"


all:
	echo "Building: $(OUTPUT)"
	wget -O $(DESTINATION) -c $(SOURCE)
	
	tar -zxvf $(DESTINATION)
	rm -rf AppDir/opt
	
	mkdir --parents AppDir/opt/application
	mv eclipse/* AppDir/opt/application

	chmod +x AppDir/AppRun
	export ARCH=x86_64; appimagetool.AppImage AppDir $(OUTPUT)

	chmod +x $(OUTPUT)

	rm -rf eclipse
	rm -f $(DESTINATION)
	rm -rf AppDir/opt

