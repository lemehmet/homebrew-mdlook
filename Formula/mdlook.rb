# Maintained by the release workflow in lemehmet/mdlook, which renders this
# file from packaging/homebrew/mdlook.rb there on every tagged release. Edits
# belong in that template — a change made here is overwritten by the next tag.
#
# v0.3.1 predates the Intel Mac build; that platform arrives with the next
# release. Until then Intel Macs are served by `cargo install mdlook`.
class Mdlook < Formula
  desc "Terminal markdown reader that reflows to your terminal width"
  homepage "https://github.com/lemehmet/mdlook"
  version "0.3.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/lemehmet/mdlook/releases/download/v0.3.1/mdlook-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "8d195d7334161cde9ad7e67e58d0fe9a2d2544434836f899cf31de72f465682f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lemehmet/mdlook/releases/download/v0.3.1/mdlook-v0.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fcf1859afc04dd8c402f6dc622eaab486a5478d3ec1d30edcfd8021f4a08ed3f"
    end
    on_arm do
      url "https://github.com/lemehmet/mdlook/releases/download/v0.3.1/mdlook-v0.3.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d043585efac6c5b3f4198cb9d0537a8a59b83448c6de0d43521ffe62879b72a7"
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
