class SetTfAlias < Formula
  desc "Portable bash/zsh library auto-switching tf/tofu/terraform aliases"
  homepage "https://github.com/langburd/set-tf-alias"
  url "https://github.com/langburd/set-tf-alias/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "2dd484bb5664d892cd08cb3c9b5a5ae3d6b34793b1c7bcef1af8c639e67e0de5"
  license "MIT"

  def install
    (share/"set-tf-alias").install "set-tf-alias.sh"
    (share/"set-tf-alias"/"version").write version.to_s
  end

  def caveats
    <<~EOS
      Add the source line to your shell rc file:
        echo 'source "#{opt_share}/set-tf-alias/set-tf-alias.sh"' >> ~/.zshrc
      or:
        echo 'source "#{opt_share}/set-tf-alias/set-tf-alias.sh"' >> ~/.bashrc

      Bash users need bash >= 4. Apple's default bash 3.2 is not supported.
      Install a modern bash with:
        brew install bash
    EOS
  end

  test do
    system "bash", "-c", "source #{opt_share}/set-tf-alias/set-tf-alias.sh && type set_tf_alias"
  end
end
