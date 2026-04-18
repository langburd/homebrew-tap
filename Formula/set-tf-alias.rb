class SetTfAlias < Formula
  desc "Portable bash/zsh library auto-switching tf/tofu/terraform aliases"
  homepage "https://github.com/langburd/set-tf-alias"
  url "https://github.com/langburd/set-tf-alias/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"

  def install
    (share/"set-tf-alias").install "set-tf-alias.sh"
  end

  def caveats
    <<~EOS
      Add this line to your ~/.zshrc or ~/.bashrc:
        source "#{opt_share}/set-tf-alias/set-tf-alias.sh"

      Bash users need bash >= 4. Apple's default bash 3.2 is not supported.
      Install a modern bash with:
        brew install bash
    EOS
  end

  test do
    system "bash", "-c", "source #{opt_share}/set-tf-alias/set-tf-alias.sh && type set_tf_alias"
  end
end
