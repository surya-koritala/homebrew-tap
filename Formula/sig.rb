class Sig < Formula
  desc "Run many AI coding agents in parallel on one git repo and safely auto-merge their work"
  homepage "https://github.com/surya-koritala/sigbound"
  url "https://github.com/surya-koritala/sigbound/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "8f5d275e4f40d0c3007c9bb9a577a5f068658bde803c440c44d2aee64f50e89a"
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
