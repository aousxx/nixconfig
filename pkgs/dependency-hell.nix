{ inputs, outputs, lib, config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
    #for virtual camera
    linuxPackages.v4l2loopback
    
    #for sddm themes
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtquickcontrols2
    
    #GEs wine dependency hell list
     gst_all_1.gst-plugins-base  vulkan-loader samba dosbox libva libxslt ocl-icd ncurses xorg.libXinerama xorg.libXcomposite libjpeg8 alsa-lib alsa-plugins libpulseaudio v4l-utils openal mpg123 gnutls openldap libpng giflib

  ];
}
