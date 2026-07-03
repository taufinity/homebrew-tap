cask "taufinity" do
  version "0.6.11"
  sha256 "4a7375b393c989f8fe118846279fcdf8acdb4d076100286e3a12d42e01a90fea"

  url "https://github.com/taufinity/cli/releases/download/v#{version}/taufinity_darwin_installer.pkg"
  name "Taufinity CLI"
  desc "Command-line tool for the Taufinity content platform"
  homepage "https://studio.taufinity.io"

  pkg "taufinity_darwin_installer.pkg"

  uninstall launchctl: "io.taufinity.cli",
            delete:    ["/usr/local/bin/taufinity",
                        "/usr/local/bin/taufinity-update-check",
                        "/Library/LaunchAgents/io.taufinity.cli.plist"]
end
