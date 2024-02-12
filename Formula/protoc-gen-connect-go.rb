class ProtocGenConnectGo < Formula
  desc ""
  homepage ""
  url "https://github.com/connectrpc/connect-go/archive/refs/tags/v1.14.0.tar.gz"
  sha256 "47db4ef5619cbce4682658a5f9e165009071ada94ab6381ab31d6e39ecc0fc18"
  license ""

  # depends_on "cmake" => :build
  depends_on "go" => :build

  def install
    system "go build -o protoc-gen-connect-go ./cmd/protoc-gen-connect-go"
    bin.install "protoc-gen-connect-go"
  end

  test do
    system "true"
  end
end
