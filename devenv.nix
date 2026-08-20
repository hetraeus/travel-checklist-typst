{ pkgs, ... }:

{
  # https://devenv.sh/packages/
  packages = with pkgs; [
    git
    typst
    tinymist
    # For PDF compression/optimization
    qpdf
  ];

  languages.python = {
    enable = true;
    uv = {
      enable = true;
      sync.enable = true;
    };
  };

  # https://devenv.sh/scripts/
  scripts.build.exec = ''
    echo "Building travel checklist PDF..."
    mkdir -p output
    typst compile --font-path ./fonts src/main.typ output/travel-checklist.pdf
    uv run python fill_pdf.py src/main.typ output/travel-checklist.pdf output/travel-checklist-fillable.pdf
    echo "Done: output/travel-checklist.pdf (static) and output/travel-checklist-fillable.pdf (interactive)"
  '';

  scripts.watch.exec = ''
    echo "Watching for changes..."
    typst watch --font-path ./fonts src/main.typ output/travel-checklist.pdf
  '';

  scripts.clean.exec = ''
    rm -rf output/
    mkdir -p output
  '';

  enterShell = ''
    mkdir -p output
    echo "🧳 Travel Checklist Typst Environment"
    echo ""
    echo "Available commands:"
    echo "  build   - Compile PDF once"
    echo "  watch   - Auto-rebuild on file changes"
    echo "  clean   - Remove build artifacts"
    echo ""
  '';

}
