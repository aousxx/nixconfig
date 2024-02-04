{config, inputs, outputs, lib, pkgs, ...}:
{
 
 programs.zsh = {
 #Your zsh config
  enable = true ;
  dotDir = ".config/zsh";
  syntaxHighlighting.enable = true;
  shellAliases = {
     trainModel=''llama-cpp-finetune --model-base /tmp/nix-textgen/models/acegpt-7b-chat.Q5_K_M.gguf --train-data asd --lora-out asd.gguf   --save-every 0 --threads 14 --ctx 256 --rope-freq-base 10000 --rope-freq-scale 1.0 --batch 1 --grad-acc 1 --adam-iter 256 --adam-alpha 0.001 --lora-r 4 --lora-alpha 4 --use-checkpointing --use-flash --sample-start "\n" --escape --include-sample-start --seed 1'';
     cleanup="pkill -9 wine & pkill -9 wineserver & pkill -9 winedevice.exe & pkill -9 explorer.exe & pkill -9 Xwayland & pkill -9 gamescope";


     tabbyL="docker run -it -p 8080:8080 -v $HOME/.tabby:/data tabbyml/tabby serve --model TabbyML/CodeLlama-13B";
     tabbyD="docker run -it -p 8080:8080 -v $HOME/.tabby:/data tabbyml/tabby serve --model TabbyML/DeepseekCoder-6.7B";
     pkgs="nvim ~/.dotfiles/profiles/aws/default.nix";
     lsp="nvim +56 ~/.dotfiles/profiles/aws/default.nix";
     ali="nvim ~/.dotfiles/profiles/aws/configs/nixconfigs/zsh/default.nix";
     nlsp="nvim +556 ~/.dotfiles/profiles/aws/configs/.config/nvim/init.lua";
     drun=''docker run -it --network=host --device=/dev/kfd --device=/dev/dri --group-add=video --ipc=host --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -v $(pwd):/pwd'';
  };
    initExtra = ''
      export HIP_VISIBLE_DEVICES=1
      export ROCM_PATH=/opt/rocm
      export PYTORCH_ROCM_ARCH="gfx1030"
      export HSA_OVERRIDE_GFX_VERSION=10.3.0
      export EDITOR=nvim
      export ZELLIJ_AUTO_ATTACH="true"
      if [[ -z "$ZELLIJ" ]]; then
          if [[ "$ZELLIJ_AUTO_ATTACH" == "true" ]]; then
              zellij attach -c
          else
              zellij
          fi
      
          if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
              exit
          fi
      fi
  '';
  plugins = [
    {
      # will source zsh-autosuggestions.plugin.zsh
      name = "powerlevel10k";
      src = pkgs.fetchFromGitHub {
        owner = "romkatv";
        repo = "powerlevel10k";
        rev = "v1.19.0";
        sha256 = "sha256-+hzjSbbrXr0w1rGHm6m2oZ6pfmD6UUDBfPd7uMg5l5c=";
      };
    }
    {
            name = "powerlevel10k-config";
            src = lib.cleanSource ./p10k-config ;
            file = "p10k.zsh";
    }
    {
      # will source zsh-autosuggestions.plugin.zsh
      name = "zsh-autosuggestions";
      src = pkgs.fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-autosuggestions";
        rev = "v0.7.0";
        sha256 = "sha256-KLUYpUu4DHRumQZ3w59m9aTW6TBKMCXl2UcKi4uMd7w=";
      };
    }
  ];
  initExtraBeforeCompInit = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
    '';
};
}
