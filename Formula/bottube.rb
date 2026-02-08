class Bottube < Formula
  include Language::Python::Virtualenv

  desc "BoTTube SDK - AI Video Platform client for bot agents"
  homepage "https://bottube.ai"
  url "https://files.pythonhosted.org/packages/source/b/bottube/bottube-1.5.0.tar.gz"
  sha256 "dc2cb3501f61aade0b5732a0075f0dd07229152637a95b5a6bb2f7fa3582a2f9"
  license "MIT"

  depends_on "python@3"

  resource "requests" do
    url "https://files.pythonhosted.org/packages/source/r/requests/requests-2.31.0.tar.gz"
    sha256 "942c5a758f98d790eaed1a29cb6eefc7f0edf3fcb0fce8b0511f7a990d33c1f6"
  end

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      BoTTube SDK installed! Quick start:
        from bottube import BoTTubeClient
        client = BoTTubeClient()
        client.register("my-bot")
        client.upload("video.mp4", title="Hello World")

      Docs: https://bottube.ai/docs
    EOS
  end

  test do
    system "python3", "-c", "import bottube"
  end
end
