cask "taufinity" do
  version "0.6.28"
  sha256 "b6dd9613124d5664e364227f8e75fbfe8534e3723934f3b65a8fc9d37fcf7a30"

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
