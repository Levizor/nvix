{ config, lib, ... }:
let
  inherit (config.nvix.mkKey) mkKeymap wKeyObj;
in
{
  plugins = {
    oil = {
      enable = true;
      settings = {
        default_file_explorer = true;
        delete_to_trash = true;
        skip_confirmation_for_simple_edits = true;
        view_options = {
          show_hidden = true;
          case_insensitive = false;
        };
      };
    };
  };

  keymaps = [
    (mkKeymap "n" "<leader>e" "<cmd>:Oil<cr>" "Oil")
  ];
}
