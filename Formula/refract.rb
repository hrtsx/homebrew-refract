class Refract < Formula
  desc "Fast Ruby language server backed by SQLite"
  homepage "https://github.com/hrtsx/refract"
  version "0.1.0-rc1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hrtsx/refract/releases/download/v#{version}/refract-aarch64-macos"
      sha256 "59fb86c654f66cf0602b0e8901277599749622220e53ac44029e1663796c18a3"
    else
      url "https://github.com/hrtsx/refract/releases/download/v#{version}/refract-x86_64-macos"
      sha256 "195a2cecd89a5af4a9e5d3ed819d799b7a3a0559724e61405bdcc431bde2bb78"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hrtsx/refract/releases/download/v#{version}/refract-aarch64-linux"
      sha256 "b6132fa3fb760a2e91f5bacf72e9b08acd3eeb0e6459097ff3d171c38bc929d4"
    else
      url "https://github.com/hrtsx/refract/releases/download/v#{version}/refract-x86_64-linux"
      sha256 "2b61f4312b6dfc3b6e4e2f52bf47f11ee516136d6e1a3a9bf1f2f2ad32e63d97"
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
