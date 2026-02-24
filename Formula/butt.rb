class Butt < Formula
  desc "Throttled tail/stdin monitor with regex highlighting"
  homepage "https://github.com/farmerchris/butt"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/farmerchris/butt/releases/download/v0.1.3/butt-aarch64-apple-darwin.tar.xz"
      sha256 "a1ecf9091106ea9ca460d501004fc669a8e48607d41c4d17a6f51e763c8656fc"
    else
      url "https://github.com/farmerchris/butt/releases/download/v0.1.3/butt-x86_64-apple-darwin.tar.xz"
      sha256 "a29b26a9502ebb8fd364fad7a25a5b51791c452dbb931872c5f52d5f6ad0f175"
    end
  elsif OS.linux?
    depends_on arch: :x86_64
    url "https://github.com/farmerchris/butt/releases/download/v0.1.3/butt-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "91e3826be066bb6cd5617ec791824b6aadde681872fbba3fa6b15a49d89a5485"
  end

  BINARY_ALIASES = {
    "aarch64-apple-darwin":     {},
    "x86_64-apple-darwin":      {},
    "x86_64-unknown-linux-gnu": {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "butt"

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/butt --version")
  end
end
