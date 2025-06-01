return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Ensure yamlls exists in servers
      opts.servers = opts.servers or {}
      opts.servers.yamlls = opts.servers.yamlls or {}

      -- Merge settings
      local yamlls_settings = opts.servers.yamlls.settings or {}
      yamlls_settings.yaml = yamlls_settings.yaml or {}

      -- Add SAM/CloudFormation schemas
      yamlls_settings.yaml.schemas = vim.tbl_extend("force", yamlls_settings.yaml.schemas or {}, {
        ["https://raw.githubusercontent.com/awslabs/goformation/master/schema/sam.schema.json"] = "template.yml",
        ["https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json"] = "*.template.yml",
      })

      -- Add custom tags
      yamlls_settings.yaml.customTags = vim.list_extend(yamlls_settings.yaml.customTags or {}, {
        "!Ref",
        "!GetAtt",
        "!Sub",
        "!Join",
        "!Select",
        "!Split",
        "!Base64",
        "!Cidr",
        "!FindInMap",
        "!GetAZs",
        "!ImportValue",
        "!And",
        "!Equals",
        "!If",
        "!Not",
        "!Or",
        "!Condition",
      })

      opts.servers.yamlls.settings = yamlls_settings

      return opts
    end,
  },
}
