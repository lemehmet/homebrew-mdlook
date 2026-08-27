# The formula served from lemehmet/homebrew-mdlook. This file is the template:
# the release workflow substitutes the underscore-fenced placeholders and
# pushes the result
# to the tap, so a change to the formula is made here, never in the tap repo.
#
# It installs the prebuilt release binaries rather than compiling — a personal
# tap has no bottle infrastructure, and without this every `brew install`
# would build syntect from source. The checksums pin each tarball to the exact
# bytes the release workflow tested.
class Mdlook < Formula
  desc "Terminal markdown reader that reflows to your terminal width"
  homepage "https://github.com/lemehmet/mdlook"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lemehmet/mdlook/releases/download/v0.4.0/mdlook-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "d9f7eb16623fa0d3bf7cfa6c97f5ab65b790d7f8e261f1c5a9941aa009d70551"
    end
    on_intel do
      url "https://github.com/lemehmet/mdlook/releases/download/v0.4.0/mdlook-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "b6c18c01c904bbecafccd4a51da4c591bf0f8ae33c2ac88d15d2e4e40ec73d19"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lemehmet/mdlook/releases/download/v0.4.0/mdlook-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b1a7f6baf39b3abf8dd2b4c9eb917fd6e00be6d768d384f2f512475d550adc00"
    end
    on_arm do
      url "https://github.com/lemehmet/mdlook/releases/download/v0.4.0/mdlook-v0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5cb4215a3d019b32108a3988658cb61e9bb8eea07a178f00d40d847b0058e89b"
    end
  end

  def install
    bin.install "mdlook"
    doc.install "README.md", "CHANGELOG.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mdlook --version")
  end
end
