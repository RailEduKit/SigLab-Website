# SigLab Website

This repository builds the SigLab portal website at `siglab.railedukit.org`.

It does not own all raw content. Canonical source files are kept in sibling repositories:

- `SigLab-3Dmodels` for OpenSCAD/STL and component documentation
- `SigLab-handouts` for handbook and printable handouts
- `SigLab-Papercut` for paper prototype PDFs
- `InteractiveSignallingLaboratory` for shared branding

## Toolchain

- `pandoc`
- `make`
- POSIX shell tools

No language runtime is required for site generation.

## Local layout expectation

Expected working tree (no submodules):

```text
InteractiveSignallingLaboratory/
├── branding/
├── SigLab-3Dmodels/
├── SigLab-handouts/
├── SigLab-Papercut/
└── SigLab-Website/
```

Set `SIBLINGS_ROOT` to the parent directory containing the sibling repos. Default is `..`.

## Build

```bash
make check-deps
make all
make serve
```

## External dependency checks

`make check-deps` validates all entries in `site/external-deps.tsv` and fails if required files are missing.

## Roadmap and editorial priorities

See `AGENTS.md` for the phased OER roadmap and quality gates.

## License

Content and code in this repository follow the project license terms in `LICENSE`, with site content targeting CC BY-SA 4.0 compatibility.
