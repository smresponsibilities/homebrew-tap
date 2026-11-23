class Diypets < Formula
  desc "Cross-platform desktop mascot engine in Rust with multi-pet herds, 2D/SVG studio, and MCP server"
  homepage "https://shivammahajan.com/diypets/"
  version "0.3.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/smresponsibilities/diypets/releases/download/v0.3.1/diypets-aarch64-apple-darwin.tar.gz"
      sha256 "cd5c61c44ee09d04a933d683fc10aa545b583d25cb043b631e6307d81dbf7e76"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/smresponsibilities/diypets/releases/download/v0.3.1/diypets-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e60bb40de6fad1c93c4534b21d8146dccc41b67702c7b1a3a312283dc4b20d72"
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
