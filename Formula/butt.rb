class Butt < Formula
  desc "Throttled tail/stdin monitor with regex highlighting"
  homepage "https://github.com/farmerchris/butt"
  url "https://github.com/farmerchris/butt/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "d84c25843355b88f731872abaaa0c4ee35f164f5cd2c755dfa2723b4615949ff"
  license "MIT"
  version_scheme 1

  bottle do
    root_url "https://github.com/farmerchris/homebrew-tap/releases/download/butt-0.1.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "79e65ccceee4a27e59f055994031733c4bd4049b75d055c2ff058c881f7f13f5"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f4a4e450b707d5dc26636c7006208e817fa288c6b109f9e7a6ae2f93310873bf"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/butt --version")
  end
end
