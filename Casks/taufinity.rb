cask "taufinity" do
  version "0.6.19"
  sha256 "5e9deb02749823066b23eac63abccdfb31c4d0d2cb06b3bb343618757e83f37b"

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
