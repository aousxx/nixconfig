{config, inputs, lib, pkgs, modulesPath, ... }:
{
environment.etc = {
  "pipewire/pipewire.conf.d/virtmic.conf".text = ''
         context.objects = [
           {   factory = adapter
               args = {
                   factory.name     = support.null-audio-sink
                   node.name        = virtmic 
                   media.class      = Audio/Source/Virtual 
                   object.linger    = true
                   audio.position   = [ FL FR FC LFE RL RR ]
                   }
               }
           }
       ]
  '';
};
}

