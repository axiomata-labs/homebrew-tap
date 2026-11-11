# The formula of the tap axiomata-labs/homebrew-tap, written by the release workflow (.github/workflows/release.yml)
# from this template: the version and the checksums of the release's own archives.
# `brew install axiomata-labs/tap/glut`.
class Glut < Formula
  desc "Coding agent for the terminal that runs every command in an OS sandbox"
  homepage "https://glut-ai.com"
  version "0.1.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/axiomata-labs/glut/releases/download/v0.1.2/glut-aarch64-apple-darwin.tar.gz"
      sha256 "16a4d786b2c2e552fea6fcf736a367283620d0a576ab2a5852adb6cd0e0e757f"
    end
    on_intel do
      url "https://github.com/axiomata-labs/glut/releases/download/v0.1.2/glut-x86_64-apple-darwin.tar.gz"
      sha256 "e9306db6429d5cd31c7ac49fa46b19cfb7c9160ef49b282c1a756e97a0eca0d9"
    end
  end

  on_linux do
    # Glut's sandbox on Linux: bubblewrap and unprivileged user namespaces.
    depends_on "bubblewrap"

    on_arm do
      url "https://github.com/axiomata-labs/glut/releases/download/v0.1.2/glut-aarch64-unknown-linux-musl.tar.gz"
      sha256 "75f580bd28428601220975058c4cb70f2223e81f2da584e2484432a8ba7549c6"
    end
    on_intel do
      url "https://github.com/axiomata-labs/glut/releases/download/v0.1.2/glut-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4ea8b16385131c4e9a1877f876aec36686bdbfd761782d078390b5f8195898dd"
    end
  end

  def install
    bin.install "glut"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/glut --version")
  end
end
