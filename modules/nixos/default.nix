# Add your reusable NixOS modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
{modulesPath}:
{
  # List your module files here
  noisetorch = import  .noisetorch;
  autojump   = import  .autojump;
  gamemode   = import  .gamemode;
  gamescope  = import  .gamescope;
}
