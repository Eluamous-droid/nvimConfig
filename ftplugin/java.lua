-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local api = vim.api
local jdtls = require('jdtls')
local root_markers = { 'gradlew', '.git', 'pom.xml', '.jazz5', '.project' }
local root_dir = require('jdtls.setup').find_root(root_markers)
local home = os.getenv('HOME')


local workspace_dir = '/Users/dk000258/Documents/nvimprojectfiles/' .. project_name
local config = {

  on_attach = on_attach,
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {

    -- 💀
    '/Users/dk000258/.vscode/extensions/redhat.java-1.31.0-darwin-arm64/jre/17.0.11-macosx-aarch64/bin/java', -- or '/path/to/java17_or_newer/bin/java'
    --'/Library/Java/JavaVirtualMachines/openjdk-21.jdk/Contents/Home/bin/java', -- or '/path/to/java17_or_newer/bin/java'
    -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
		--'-javaagent:/Users/dk000258/.vscode/extensions/redhat.java-1.31.0-darwin-arm64/lombok/lombok-1.18.32.jar',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    -- 💀

		'-jar', '/Users/dk000258/Documents/ForFun/jdtlsStuff/jdt-language-server-1.28.0-202309281329/plugins/org.eclipse.equinox.launcher_1.6.500.v20230717-2134.jar',
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
    -- Must point to the                                                     Change this to
    -- eclipse.jdt.ls installation                                           the actual version


    -- 💀
    '-configuration', '/Users/dk000258/Documents/ForFun/jdtlsStuff/jdt-language-server-1.28.0-202309281329/config_mac_arm/',

    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
    -- Must point to the                      Change to one of `linux`, `win` or `mac`
    -- eclipse.jdt.ls installation            Depending on your system.


    -- 💀
    -- See `data directory configuration` section in the README
    '-data', workspace_dir
  },

  -- 💀
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew', 'pom.xml'}),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
	    autobuild = { enabled = true },
      maxConcurrentBuilds = 8,
      signatureHelp = { enabled = true },
      contentProvider = { preferred = 'fernflower' },
      saveActions = {
        organizeImports = true,
      },
      completion = {
        favoriteStaticMembers = {
          "io.crate.testing.Asserts.assertThat",
          "org.assertj.core.api.Assertions.assertThat",
          "org.assertj.core.api.Assertions.assertThatThrownBy",
          "org.assertj.core.api.Assertions.assertThatExceptionOfType",
          "org.assertj.core.api.Assertions.catchThrowable",
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*",
        },
        filteredTypes = {
          "com.sun.*",
          "io.micrometer.shaded.*",
          "java.awt.*",
          "jdk.*",
          "sun.*",
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
        },
        hashCodeEquals = {
          useJava7Objects = true,
        },
        useBlocks = true,
      },    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-1.8",
            path = "/Library/Java/JavaVirtualMachines/jdk1.8.0_311.jdk/Contents/Home/jre/",
          },
        }
      },
    },

  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {}
  },
}

-- This bundles definition is the same as in the previous section (java-debug installation)
local bundles = {
  vim.fn.glob(
   "/Users/dk000258/Documents/ForFun/jdtlsStuff/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar",
    1),
};

-- This is the new part
vim.list_extend(bundles,
  vim.split(vim.fn.glob("/Users/dk000258/Documents/ForFun/jdtlsStuff/vscode-java-test/server/*.jar", 1), "\n"))
config['init_options'] = {
  bundles = bundles,
}
vim.keymap.set('n', "<leader>xd", "<cmd>lua require'jdtls'.test_class()<cr>")
vim.keymap.set('n', "<leader>xc", "<cmd>lua require'jdtls'.test_nearest_method()<cr>")
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
