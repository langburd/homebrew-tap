class SetTfAlias < Formula
  desc "Portable bash/zsh library auto-switching tf/tofu/terraform aliases"
  homepage "https://github.com/langburd/set-tf-alias"
  url "https://github.com/langburd/set-tf-alias/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "9901ff7c96afd7a899158116fd4e1a5ecee4cb391c6e3e72bf1afd296ece635c"
  license "MIT"

  def install
    (share/"set-tf-alias").install "set-tf-alias.sh"
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
