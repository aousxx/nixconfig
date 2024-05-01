{
  pkgs,
  config,
  ...
}:
{
qt.enable = true;

# platform theme "gtk" or "gnome"
qt.platformTheme = "gtk";

# name of the qt theme
qt.style.name = "adwaita";

# detected automatically:
# adwaita, adwaita-dark, adwaita-highcontrast,
# adwaita-highcontrastinverse, breeze,
# bb10bright, bb10dark, cde, cleanlooks,
# gtk2, motif, plastique

# package to use
qt.style.package = pkgs.adwaita-qt;



gtk.enable = true;

gtk.cursorTheme.package = pkgs.bibata-cursors;
gtk.cursorTheme.name = "Bibata-Modern-Ice";

gtk.theme.package = pkgs.adw-gtk3;
gtk.theme.name = "adw-gtk3";

gtk.iconTheme.package = pkgs.gruvbox-dark-icons-gtk;
gtk.iconTheme.name = "GruvboxPlus";
}

#let 
#  breath-gtk = import ./breath-gtk.nix {inherit pkgs;};
#  gruvboxplus = import ./gruvbox-plus.nix { inherit pkgs; };
#in
#{
#
#  home.pointerCursor = {
#    package = pkgs.bibata-cursors;
#    name = "Bibata-Modern-Classic";
#    size = 24;
#    gtk.enable = true;
#    x11.enable = true;
#  };
#  qt = {
#        enable = true;
#        
#        # platform theme "gtk" or "gnome"
#        platformTheme = "gnome";
#        
#        # name of the theme
#        style.name = "adwaita";
#        
#        # detected automatically:
#        # adwaita, adwaita-dark, adwaita-highcontrast,
#        # adwaita-highcontrastinverse, breeze,
#        # bb10bright, bb10dark, cde, cleanlooks,
#        # gtk2, motif, plastique
#        
#        # package to use
#        style.package = pkgs.adwaita-qt;
#};
##  gtk = {
##  enable = true;
##  
##  cursorTheme.package = pkgs.bibata-cursors;
##  cursorTheme.name = "Bibata-Modern-Ice";
##  
##  #theme.package = pkgs.adw-gtk3;
##  theme.name = "FlatColor";
##  
##  iconTheme.package = pkgs.zafiro-icons;
##  iconTheme.name = "gnome";
##    };
#  }
