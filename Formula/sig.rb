class Sig < Formula
  desc "Run parallel AI coding agents on one git repo and safely auto-merge their work"
  homepage "https://github.com/surya-koritala/sigbound"
  url "https://github.com/surya-koritala/sigbound/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "40c73ddc341bff06140e70801db11b029bbb87c3b436d0d2e4cd8a265fb26d06"
  license "Apache-2.0"
  head "https://github.com/surya-koritala/sigbound.git", branch: "main"

  depends_on "go" => :build
  depends_on "git"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.Version=#{version}"), "./cmd/sig"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sig version")
  end
end
