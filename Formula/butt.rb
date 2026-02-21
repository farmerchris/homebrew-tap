class Butt < Formula
    desc "Throttled tail/stdin monitor with regex highlighting"
    homepage "https://github.com/farmerchris/butt"
    url "https://github.com/farmerchris/butt/archive/refs/tags/v0.1.2.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    license "MIT"

    depends_on "rust" => :build

    def install
      system "cargo", "install", *std_cargo_args(path: "butt")
    end

    test do
      assert_match version.to_s, shell_output("#{bin}/butt --version")
    end
  end