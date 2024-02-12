class ProtocGenConnectKotlin < Formula
  desc ""
  homepage ""
  url "https://github.com/connectrpc/connect-kotlin.git",
    tag:      "v0.4.0"
  sha256 "d33dc7e288629c61fe18329970fe5439105f35f2d02e644f68357e84e264533f"
  license "Apache-2.0"

  def install
    system "./gradlew", "protoc-gen-connect-kotlin:installDist"
    libexec.install "protoc-gen-connect-kotlin/build/libs/protoc-gen-connect-kotlin-0.4.1-SNAPSHOT.jar" => "protoc-gen-connect-kotlin.jar"
    bin.write_jar_script libexec/"protoc-gen-connect-kotlin.jar", "protoc-gen-connect-kotlin"
  end

  test do
    system "true"
  end
end 
