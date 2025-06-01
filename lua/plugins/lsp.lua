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

      -- Add SAM/CloudFormation schemas with better patterns
      yamlls_settings.yaml.schemas = vim.tbl_extend("force", yamlls_settings.yaml.schemas or {}, {
        -- AWS SAM Schema (primary)
        ["https://raw.githubusercontent.com/aws/serverless-application-model/main/samtranslator/schema/schema.json"] = {
          "template.yaml",
          "template.yml",
          "**/template.yaml",
          "**/template.yml",
          "sam.yaml",
          "sam.yml",
        },
        -- CloudFormation Schema (fallback)
        ["https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json"] = {
          "*.template.yaml",
          "*.template.yml",
          "**/cloudformation/**/*.yaml",
          "**/cloudformation/**/*.yml",
        },
        -- Local schemas if you have them
        -- ["file:///path/to/local/sam-schema.json"] = "template.yaml",
      })

      -- Comprehensive CloudFormation/SAM custom tags
      yamlls_settings.yaml.customTags = vim.list_extend(yamlls_settings.yaml.customTags or {}, {
        -- Intrinsic Functions
        "!Ref scalar",
        "!GetAtt scalar",
        "!GetAtt sequence",
        "!Sub scalar",
        "!Sub sequence",
        "!Join sequence",
        "!Select sequence",
        "!Split sequence",
        "!Base64 scalar",
        "!Cidr sequence",
        "!FindInMap sequence",
        "!GetAZs scalar",
        "!ImportValue scalar",

        -- Condition Functions
        "!And sequence",
        "!Equals sequence",
        "!If sequence",
        "!Not sequence",
        "!Or sequence",
        "!Condition scalar",

        -- Transform Functions
        "!Transform mapping",

        -- Additional AWS-specific tags
        "!AWS::AccountId",
        "!AWS::NoValue",
        "!AWS::NotificationARNs",
        "!AWS::Partition",
        "!AWS::Region",
        "!AWS::StackId",
        "!AWS::StackName",
        "!AWS::URLSuffix",
      })

      -- Additional YAML settings for better CloudFormation support
      yamlls_settings.yaml.format = yamlls_settings.yaml.format or {}
      yamlls_settings.yaml.format.enable = true
      yamlls_settings.yaml.validate = true
      yamlls_settings.yaml.hover = true
      yamlls_settings.yaml.completion = true

      -- Disable schema validation for specific patterns if needed
      -- yamlls_settings.yaml.schemaStore = {
      --   enable = false, -- Disable schema store if using custom schemas
      -- }

      opts.servers.yamlls.settings = yamlls_settings

      return opts
    end,
  },

  -- Optional: Add specific file type detection
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.highlight = opts.highlight or {}
      opts.highlight.additional_vim_regex_highlighting = opts.highlight.additional_vim_regex_highlighting or {}
      table.insert(opts.highlight.additional_vim_regex_highlighting, "yaml")
      return opts
    end,
  },
}
