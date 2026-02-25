class Butt < Formula
  desc "Throttled tail/stdin monitor with regex highlighting"
  homepage "https://github.com/farmerchris/butt"
  url "https://github.com/farmerchris/butt/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "92dfcefeaf4deb132a179b58ceda802213556e427de42b9e5ad6c7d17ce4a9cf"
  license "MIT"
  version_scheme 1

  bottle do
    root_url "https://github.com/farmerchris/homebrew-tap/releases/download/butt-0.1.4"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/butt --version")
  end
end
