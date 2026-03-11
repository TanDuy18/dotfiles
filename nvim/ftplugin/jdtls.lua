local sep = package.config:sub(1, 1)
local data_path = vim.fn.stdpath("data")

local workspace_path = data_path .. sep .. "jdtls-workspace" .. sep
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = workspace_path .. project_name

local mason_path = data_path .. sep .. "mason" .. sep .. "packages" .. sep .. "jdtls"

local status, jdtls = pcall(require, "jdtls")
if not status then
    return
end

local extendedClientCapabilities = jdtls.extendedClientCapabilities

-- detect OS
local os_config
if vim.fn.has("win32") == 1 then
    os_config = "config_win"
elseif vim.fn.has("macunix") == 1 then
    os_config = "config_mac"
else
    os_config = "config_linux"
end

local launcher_jar = vim.fn.glob(
    mason_path .. sep .. "plugins" .. sep .. "org.eclipse.equinox.launcher_*.jar"
)

local config = {
    cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens", "java.base/java.util=ALL-UNNAMED",
        "--add-opens", "java.base/java.lang=ALL-UNNAMED",
        "-javaagent:" .. mason_path .. sep .. "lombok.jar",
        "-jar", launcher_jar,
        "-configuration", mason_path .. sep .. os_config,
        "-data", workspace_dir,
    },

    root_dir = require("jdtls.setup").find_root({
        ".git",
        "mvnw",
        "gradlew",
        "pom.xml",
        "build.gradle",
        "settings.gradle",
    }),

    settings = {
        java = {
            signatureHelp = { enabled = true },
            extendedClientCapabilities = extendedClientCapabilities,
            maven = { downloadSources = true },
            referencesCodeLens = { enabled = true },
            references = { includeDecompiledSources = true },
            inlayHints = {
                parameterNames = { enabled = "all" },
            },
            format = {
                enabled = true,
                settings = { profile = "GoogleStyle" },
            },
        },
    },

    init_options = {
        bundles = {},
    },
}

require("jdtls").start_or_attach(config)
