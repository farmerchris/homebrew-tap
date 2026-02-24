class Butt < Formula
  desc "Throttled tail/stdin monitor with regex highlighting"
  homepage "https://github.com/farmerchris/butt"
  url "https://github.com/farmerchris/butt/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "d84c25843355b88f731872abaaa0c4ee35f164f5cd2c755dfa2723b4615949ff"
  license "MIT"
  version_scheme 1

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/butt --version")
  end
end
