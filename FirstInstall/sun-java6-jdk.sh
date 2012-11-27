#!/bin/sh

chmod +x jdk-6u34-linux-x64.bin 
./jdk-6u33-linux-x64.bin 
sudo chown root -R jdk1.6.0_34 
sudo mv jdk1.6.0_34/ /usr/lib/jvm/ 

sudo update-alternatives --install "/usr/bin/java" "java" \ 
"/usr/lib/jvm/bin/java" 1 

sudo update-alternatives --install "/usr/bin/javac" "javac" \ 
"/usr/lib/jvm/bin/javac" 1 

sudo update-alternatives --install "/usr/bin/javaws" "javaws" \ 
"/usr/lib/jvm/bin/javaws" 1 

sudo update-alternatives --config java 
sudo update-alternatives --config javac 
sudo update-alternatives --config javaws 
