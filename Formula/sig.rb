class Sig < Formula
  desc "Run parallel AI coding agents on one git repo and safely auto-merge their work"
  homepage "https://github.com/surya-koritala/sigbound"
  url "https://github.com/surya-koritala/sigbound/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "d2d6dd74d0ed6c17d7ec72a3fd1ea19ab704886e968f9802674d60215cad7b60"
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
