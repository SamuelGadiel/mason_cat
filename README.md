# Clean Architecture Template (CAT)

<p align="center">
Imagem aqui
<!-- <img src="https://raw.githubusercontent.com/felangel/mason/master/assets/mason_full.png" height="125" alt="mason logo" />
</p> -->

<p align="center">
<a href="https://github.com/felangel/mason/actions"><img src="https://github.com/felangel/mason/workflows/mason/badge.svg" alt="mason"></a>
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="License: MIT"></a>
</p>

---

A brick for Mason CLI that generates a clean architecture template for a given feature.


## Getting Started 🚀

You can run the brick using the command

```
mason make cat
```

### Variables

- `module_name`:

  The name of the module you want to create.

  The name must be in snake_case.

- `has_parameters`:

  A boolean that defines if the module has parameters that are passed to the backend.