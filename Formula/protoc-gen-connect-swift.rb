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
    setup_fake_sandbox_exec
    system "swift", "build", "--disable-sandbox", "-c", "release", "--product", "protoc-gen-connect-swift"
    bin.install ".build/release/protoc-gen-connect-swift" => "protoc-gen-connect-swift"
  end

  def setup_fake_sandbox_exec
    # Workaround for sandbox errors: place a dummy sandbox-exec on PATH.
    # See: https://github.com/Homebrew/discussions/discussions/59
    build_bin = "#{buildpath}/bin"
    Dir.mkdir(build_bin)

    script = <<~SH
      #!/bin/bash
      # If a trivial sandbox command can run, then use the system sandbox.
      if /usr/bin/sandbox-exec -p '(version 1)' true ; then
        exec /usr/bin/sandbox-exec "$@"
      fi
      # If a trivial sandbox command fails, we may already be in a sandbox,
      # so don't initialize a new sandbox.
      while getopts ":f:n:p:D:" opt ; do : ; done
      shift $((OPTIND -1))
      exec "$@"
    SH
    File.write("#{build_bin}/sandbox-exec", script, perm: 0755)
    ENV["PATH"] = "#{build_bin}:#{ENV["PATH"]}"
  end

  test do
    system "true"
  end
end
