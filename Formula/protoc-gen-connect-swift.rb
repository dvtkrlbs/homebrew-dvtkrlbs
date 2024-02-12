class ProtocGenConnectSwift < Formula
  desc "Swift support for Connect protocol"
  homepage "https://github.com/connectrpc/connect-swift"
  url "https://github.com/connectrpc/connect-swift/archive/refs/tags/0.12.0.tar.gz"
  sha256 "3ddc6062b5eea9ea83bb82a957387874c7d4624cabff68b92ec0b6791b7adfda"
  license "Apache-2.0"

  depends_on xcode: ["15.2", :build]
  depends_on "protobuf"

  uses_from_macos "swift"

  def install
    system "make", "buildplugins"
    bin.install ".tmp/bin/protoc-gen-connect-swift" => "protoc-gen-connect-swift"
  end

  test do
    system "true"
  end
end
