# The formula of the tap axiomata-labs/homebrew-tap, written by the release workflow (.github/workflows/release.yml)
# from this template: the version and the checksums of the release's own archives.
# `brew install axiomata-labs/tap/glut`.
class Glut < Formula
  desc "Coding agent for the terminal that runs every command in an OS sandbox"
  homepage "https://glut-ai.com"
  version "0.1.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/axiomata-labs/glut/releases/download/v0.1.0/glut-aarch64-apple-darwin.tar.gz"
      sha256 "7530148d7c30f47876a5e202800310114fb4d62913779c4f7bf150fb1097ee5f"
    end
    on_intel do
      url "https://github.com/axiomata-labs/glut/releases/download/v0.1.0/glut-x86_64-apple-darwin.tar.gz"
      sha256 "a8bd68a863bab598d0e394d2942e6b0d03aebbda0c000ae3a35484a990e5b896"
    end
  end

  on_linux do
    # Glut's sandbox on Linux: bubblewrap and unprivileged user namespaces.
    depends_on "bubblewrap"

    on_arm do
      url "https://github.com/axiomata-labs/glut/releases/download/v0.1.0/glut-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ab1de96869e2241ceeb00f47078dfe3be23d0fdac4ac67116fc150b42784ed63"
    end
    on_intel do
      url "https://github.com/axiomata-labs/glut/releases/download/v0.1.0/glut-x86_64-unknown-linux-musl.tar.gz"
      sha256 "190ee5a2a9b41c7d3b312195ef0068130e3b7fa7c19ef2128fff813c020d5b18"
    end
  end

  def install
    bin.install "glut"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/glut --version")
  end
end
