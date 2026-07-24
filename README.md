# 🧳 Travel Checklist

A typographically beautiful travel checklist generated with [Typst](https://typst.app/).

## Quick Start

```bash
# Enter the development environment
nix develop

# Or with direnv:
direnv allow

# Build the PDF
build

# Watch for changes (auto-rebuild)
watch
```

## Requirements

- [Nix](https://nixos.org/download.html) with flakes enabled
- [devenv](https://devenv.sh/)
- (Optional) [direnv](https://direnv.net/) for automatic shell activation

## Project Structure

```
.
├── devenv.nix          # Devenv configuration
├── devenv.yaml         # Devenv inputs
├── flake.nix           # Pure Nix flake (optional)
├── .envrc              # direnv configuration
├── src/
│   └── main.typ        # Main Typst document
├── fonts/              # Custom fonts (optional)
└── output/             # Generated PDFs
```

## Customizing

Edit `src/main.typ` to add/remove items or change the layout. The `cheq` package provides the checkbox styling. See [cheq docs](https://typst.app/universe/package/cheq) for customization options.

## License

LGPL3
