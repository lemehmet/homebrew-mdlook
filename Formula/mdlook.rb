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
  version "0.3.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lemehmet/mdlook/releases/download/v0.3.2/mdlook-v0.3.2-aarch64-apple-darwin.tar.gz"
      sha256 "20cef651f93160e279e36f9aca1424876b9f4df696ee2d24849145b2bda1efb4"
    end
    on_intel do
      url "https://github.com/lemehmet/mdlook/releases/download/v0.3.2/mdlook-v0.3.2-x86_64-apple-darwin.tar.gz"
      sha256 "d8cd530d84bfd6aa956e5d79b2418835dc68fc672d46f3fdf7c18a3b3665f9bc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lemehmet/mdlook/releases/download/v0.3.2/mdlook-v0.3.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6a3a7fd53be40f24ebc31d0b9515869a46aef9b1a5da715ee5ea3a1c62c3569d"
    end
    on_arm do
      url "https://github.com/lemehmet/mdlook/releases/download/v0.3.2/mdlook-v0.3.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e448ac1234ec782242662985bff61308fb9c1e3cd6b6ab401578db973c179b1f"
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
