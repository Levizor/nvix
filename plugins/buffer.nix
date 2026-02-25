{ config, lib, ... }:
let
  inherit (config.nvix.mkKey) mkKeymap wKeyObj;
  inherit (lib.nixvim) mkRaw;
in
{
  plugins = {
    hop.enable = true;
    harpoon = {
      enable = true;
    };
  };

  wKeyList = [
    (wKeyObj [
      "<leader><tab>"
      ""
      "tabs"
    ])
  ];

  keymaps = [
    (mkKeymap "n" "<leader>h." (
      # lua
      mkRaw ''
        function()
          harpoon = require("harpoon")
          harpoon:list():add()
        end
      ''
    ) "Add File to Harpoon")
    (mkKeymap "n" "<leader>hh" (
      # lua
      mkRaw ''
        function()
          harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end
      ''
    ) "Harpoon ui")

    (mkKeymap "n" "<leader><tab>j" "<cmd>tabn<cr>" "Next Tab")
    (mkKeymap "n" "<leader><tab>k" "<cmd>tabp<cr>" "Previous Tab")
    (mkKeymap "n" "<leader><tab>l" "<cmd>tabn<cr>" "Next Tab")
    (mkKeymap "n" "<leader><tab>h" "<cmd>tabp<cr>" "Previous Tab")

    (mkKeymap "n" "<leader>qt" "<cmd>tabclose<cr>" "Close Tab")
    (mkKeymap "n" "<leader><tab>q" "<cmd>tabclose<cr>" "Close Tab")
    (mkKeymap "n" "<leader><tab>n" "<cmd>tabnew<cr>" "New Tab")

    (mkKeymap "n" "<M-1>" (mkRaw ''
      function()
        harpoon = require("harpoon")
        harpoon:list():select(1)
      end'') "Harpoon 1")
    (mkKeymap "n" "<M-2>" (mkRaw ''
      function()
        harpoon = require("harpoon")
        harpoon:list():select(2)
      end'') "Harpoon 2")
    (mkKeymap "n" "<M-3>" (mkRaw ''
      function()
        harpoon = require("harpoon")
        harpoon:list():select(3)
      end'') "Harpoon 3")
    (mkKeymap "n" "<M-4>" (mkRaw ''
      function()
        harpoon = require("harpoon")
        harpoon:list():select(4)
      end'') "Harpoon 4")
    (mkKeymap "n" "<M-5>" (mkRaw ''
      function()
        harpoon = require("harpoon")
        harpoon:list():select(5)
      end'') "Harpoon 5")
    (mkKeymap "n" "<M-6>" (mkRaw ''
      function()
        harpoon = require("harpoon")
        harpoon:list():select(6)
      end'') "Harpoon 6")
    (mkKeymap "n" "<M-7>" (mkRaw ''
      function()
        harpoon = require("harpoon")
        harpoon:list():select(7)
      end'') "Harpoon 7")
    (mkKeymap "n" "<M-8>" (mkRaw ''
      function()
        harpoon = require("harpoon")
        harpoon:list():select(8)
      end'') "Harpoon 8")
    (mkKeymap "n" "<M-9>" (mkRaw ''
      function()
        harpoon = require("harpoon")
        harpoon:list():select(9)
      end'') "Harpoon 9")
  ];

}
