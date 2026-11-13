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
  version "0.4.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lemehmet/mdlook/releases/download/v0.4.1/mdlook-v0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "f6999f66b5e5d6aac1143d183ec5c9c839f45e0235fb68ec80fbc2230e68a24e"
    end
    on_intel do
      url "https://github.com/lemehmet/mdlook/releases/download/v0.4.1/mdlook-v0.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "7c60b0eb7e5314b6aa78e11d5b7271b5f7bf9f42716dbe1e696b0a444e896cee"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lemehmet/mdlook/releases/download/v0.4.1/mdlook-v0.4.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7ee0ca38c7cd848f73fa0ce73c75c7707b135300b3af72c3b793c7956a5c01eb"
    end
    on_arm do
      url "https://github.com/lemehmet/mdlook/releases/download/v0.4.1/mdlook-v0.4.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a14d1985cca8fdd4913da3f94a3a25f183017378762fd8f025e9a9a75f1a1f3c"
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
