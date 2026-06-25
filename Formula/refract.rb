class Refract < Formula
  desc "Fast Ruby language server backed by SQLite"
  homepage "https://github.com/hrtsx/refract"
  version "0.1.0-rc1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hrtsx/refract/releases/download/v#{version}/refract-aarch64-macos"
      sha256 "d05ba0fdb35470b7c523ce3c11b0e3823e889067652b9b64ecf71dbb384105f7"
    else
      url "https://github.com/hrtsx/refract/releases/download/v#{version}/refract-x86_64-macos"
      sha256 "72ef5c5a734701460113df0b68708d112a0fffd6745609d397a141c79273acb3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hrtsx/refract/releases/download/v#{version}/refract-aarch64-linux"
      sha256 "df1041d2623a8226b761aa79d8d548412adb66a38522d4b2713eb66f9f6ba51c"
    else
      url "https://github.com/hrtsx/refract/releases/download/v#{version}/refract-x86_64-linux"
      sha256 "a6d1c179e84a766ebe4e0cb57216812f0bde17392503dff60fc09bef8de0cff2"
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
