# The formula of the tap axiomata-labs/homebrew-tap, written by the release workflow (.github/workflows/release.yml)
# from this template: the version and the checksums of the release's own archives.
# `brew install axiomata-labs/tap/glut`.
class Glut < Formula
  desc "Coding agent for the terminal that runs every command in an OS sandbox"
  homepage "https://glut-ai.com"
  version "0.1.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/axiomata-labs/glut/releases/download/v0.1.1/glut-aarch64-apple-darwin.tar.gz"
      sha256 "1737a8851eaabb28e42d0076829a259c7eb9b62c5d9ec3075705aadc456aed95"
    end
    on_intel do
      url "https://github.com/axiomata-labs/glut/releases/download/v0.1.1/glut-x86_64-apple-darwin.tar.gz"
      sha256 "9b2b00a507ee84a0dfd872788a8f03c8b910b2a44d1ecc2e1a894e327df21e8c"
    end
  end

  on_linux do
    # Glut's sandbox on Linux: bubblewrap and unprivileged user namespaces.
    depends_on "bubblewrap"

    on_arm do
      url "https://github.com/axiomata-labs/glut/releases/download/v0.1.1/glut-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d4ceacdd41663dd5a9146f187426bcdb219aaed234f898dd824f7c4dc697a397"
    end
    on_intel do
      url "https://github.com/axiomata-labs/glut/releases/download/v0.1.1/glut-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7e72f6777b255568cf2552854115e7965cc6d2a7eae2efb71358f91e4c90cd58"
    end
  end

  def install
    bin.install "glut"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/glut --version")
  end
end
