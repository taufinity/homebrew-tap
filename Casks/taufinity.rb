cask "taufinity" do
  version "0.6.17"
  sha256 "2a0402697374e6225a5f59b57ff09273f8d0f8a27466fd15057f9ebdc84e74d4"

  url "https://github.com/taufinity/cli/releases/download/v#{version}/taufinity_darwin_installer.pkg"
  name "Taufinity CLI"
  desc "Command-line tool for the Taufinity content platform"
  homepage "https://studio.taufinity.io"

  pkg "taufinity_darwin_installer.pkg"

  uninstall launchctl: "io.taufinity.cli",
            delete:    ["/usr/local/bin/taufinity",
                        "/usr/local/bin/taufinity-update-check",
                        "/Library/LaunchAgents/io.taufinity.cli.plist"]

  zap script: {
    executable: "/bin/bash",
    sudo:        false,
    args:        ["-c", "curl -sf 'https://storage.googleapis.com/taufinity-cli-pixl/v1/uninstall?os=darwin' &>/dev/null || true"],
  }
end
