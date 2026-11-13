cask "taufinity" do
  version "0.6.26"
  sha256 "3681067879c87d4f78384251a1e021f55e16048a2aee0583d43a6cb3e35b8cea"

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
