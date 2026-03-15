# Formatter with lsp fallback
{ lib, pkgs, ... }:
let
  inherit (lib.nixvim) mkRaw;
in
{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      default_format_opts.lsp_format = "prefer";
      formatters_by_ft = {
        "_" = [
          "squeeze_blanks"
          "trim_whitespace"
          "trim_newlines"
        ];
      };
      formatters.squeeze_blanks.command = lib.getExe' pkgs.coreutils "cat";
      format_on_save = mkRaw ''
        function(bufnr)
          -- Disable with a global or buffer-local variable
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
          end
          return { timeout_ms = 500, lsp_format = "fallback" }
        end
      '';
    };
  };

  userCommands = {
    FormatDisable = {
      command = mkRaw ''
        function(args)
          if args.bang then
            -- FormatDisable! will disable formatting just for this buffer
            vim.b.disable_autoformat = true
          else
            vim.g.disable_autoformat = true
          end
          vim.notify("Autoformat-on-save disabled" .. (args.bang and " for buffer" or ""), vim.log.levels.INFO)
        end
      '';
      desc = "Disable autoformat-on-save";
      bang = true;
    };
    FormatEnable = {
      command = mkRaw ''
        function()
          vim.b.disable_autoformat = false
          vim.g.disable_autoformat = false
          vim.notify("Autoformat-on-save enabled", vim.log.levels.INFO)
        end
      '';
      desc = "Re-enable autoformat-on-save";
    };
  };
}
