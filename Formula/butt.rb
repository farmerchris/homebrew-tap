class Butt < Formula
    desc "Throttled tail/stdin monitor with regex highlighting"
    homepage "https://github.com/farmerchris/butt"
    url "https://github.com/farmerchris/butt/archive/refs/tags/v0.1.2.tar.gz"
    sha256 "9f88cc6decb8861bb8befd9d4561c1c22e624f6c37f3700293ce96944bf33ff6"
    license "MIT"

    depends_on "rust" => :build

    def install
      system "cargo", "install", *std_cargo_args(path: "butt")
    end

    test do
      assert_match version.to_s, shell_output("#{bin}/butt --version")
    end
  end