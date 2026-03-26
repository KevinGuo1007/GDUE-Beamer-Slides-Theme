# Contributing

Thanks for contributing to GDUE Beamer Slides Theme.

## Development Setup

1. Clone the repository.
1. Install a TeX distribution (TeX Live or MiKTeX).
1. Build examples from repository root:

```bash
make check
```

## Pull Request Checklist

1. Keep behavior backward compatible when possible.
1. Update `README.md` and `docs/USAGE.md` for user-facing changes.
1. Run `make check` and ensure both examples compile.
1. Keep commits focused and descriptive.

## Scope Guidelines

- Theme logic belongs in `beamerthemegdue.sty`.
- Compatibility glue belongs in `gdue.sty`.
- New usage patterns should be documented in `demo/demo.tex`.
- Keep image assets in `source/` unless there is a strong reason not to.

## Reporting Issues

When opening an issue, include:

- TeX engine and distribution version.
- Minimal reproducible `.tex` example.
- Full compiler error message.
