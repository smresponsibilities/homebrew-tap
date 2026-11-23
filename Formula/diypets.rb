class Diypets < Formula
  desc "Cross-platform desktop mascot engine in Rust with multi-pet herds, 2D/SVG studio, and MCP server"
  homepage "https://shivammahajan.com/diypets/"
  version "0.4.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/smresponsibilities/diypets/releases/download/v0.4.1/diypets-aarch64-apple-darwin.tar.gz"
      sha256 "8d0401598e9bd76505af4dca745d798d490363732ceabc9fc6039ac9481c0a2a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/smresponsibilities/diypets/releases/download/v0.4.1/diypets-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1c3c405e7ef0670d946837d590317e5c29d67b59162f57ed12b25268af270d67"
    end
  end

  def install
    ["diypets", "diypets-settings", "diypets-creator"].each do |name|
      found = Dir["**/#{name}"].find { |p| File.file?(p) }
      bin.install found if found
    end
  end

  test do
    assert_predicate bin/"diypets", :exist?
  end
end
