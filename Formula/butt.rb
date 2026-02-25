class Butt < Formula
  desc "Throttled tail/stdin monitor with regex highlighting"
  homepage "https://github.com/farmerchris/butt"
  url "https://github.com/farmerchris/butt/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "92dfcefeaf4deb132a179b58ceda802213556e427de42b9e5ad6c7d17ce4a9cf"
  license "MIT"
  version_scheme 1

  bottle do
    root_url "https://github.com/farmerchris/homebrew-tap/releases/download/butt-0.1.4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1294e37dd72517748fcb25bdcd3f0883d416e207a6b8f30349345885a3fe4290"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f64f0e5a208bfe3aebb51b3f9fc347d165dfdab9d6527260be3c9e9ebc318711"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/butt --version")
  end
end
