class ProtocGenConnectSwift < Formula
  desc "Swift support for Connect protocol"
  homepage "https://github.com/connectrpc/connect-swift"
  url "https://github.com/connectrpc/connect-swift/releases/download/0.12.0/protoc-gen-connect-swift.tar.gz"
  sha256 "545f14582eb57c0f8724f710c80c0636354dc01f7ab7fe9275bb1e5d9cbcd816"
  license "Apache-2.0"

  depends_on xcode: ["15.2", :build]

  def install
    bin.install "protoc-gen-connect-swift" => "protoc-gen-connect-swift"
  end

  test do
    system "true"
  end
end
