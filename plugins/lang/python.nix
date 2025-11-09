{
  plugins.lsp.servers = {
    ruff.enable = true;
    pyright = {
      enable = true;
      settings = {
        pyright.disableOrganizeImports = true;
      };
    };
  };

  plugins.conform-nvim.settings = {
    formatters_by_ft.python = [ "ruff" ];
  };

}
