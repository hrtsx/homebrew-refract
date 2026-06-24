class Refract < Formula
  desc "Fast Ruby language server backed by SQLite"
  homepage "https://github.com/hrtsx/refract"
  version "0.0.0-taptest"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hrtsx/refract/releases/download/v#{version}/refract-aarch64-macos"
      sha256 "0a3ee37e81b1dfea44bd8cd0667ff9e9493380e82ef41919bdd9cbac4dd54b5e"
    else
      url "https://github.com/hrtsx/refract/releases/download/v#{version}/refract-x86_64-macos"
      sha256 "83efe9f5899c07f0ab116f8b3e35b23620e5d80cc73e7daf01a3e0ed033a44ce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hrtsx/refract/releases/download/v#{version}/refract-aarch64-linux"
      sha256 "adff7e046eb42f58c73ed360a542370d1cc84a0292b0c6d9478ec1201e2af7e8"
    else
      url "https://github.com/hrtsx/refract/releases/download/v#{version}/refract-x86_64-linux"
      sha256 "cb4e7c765a1fc0feefbef45d06bc9cbacf94916a52a70cd64e06c19a50a5005e"
    end
  end

  def install
    binary = Dir["refract-*"].first || "refract"
    bin.install binary => "refract"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/refract --version")
  end
end
