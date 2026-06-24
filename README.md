# {PKGNAME}.jl


## Initial remarks

This is the initial version of the  {PKGNAME} project.

### Running code

All scripts and notebook need to run in the environment of this project. For this purpose, they start with activating this environment and are not
relocateable.

#### After installation
After installing or updating the code, the project environment needs to be instantiated. For this purpose, run
```
$julia --project
julia> using Pkg
julia> Pkg.instantiate()
```

#### Running command line scripts
Run command line scripts with 
```
$ julia --project scripts/demo-cli.jl
```

#### Running scripts from the REPL
```
$ julia --project
julia> using Revise
julia> includet("scripts/DemoREPL.jl")
julia> DemoREPL.main(dim=3)
```

Alternatively, add the scripts directory to the Julia load path
and use Julias loading mechanism:

```
$ julia --project
julia> using Revise
julias push!(LOAD_PATH, abspath("scripts"))
julia> using DemoREPL
julia> DemoREPL.main(dim=3)
```

The `DemoREPLCLI.jl` script exhibits an approach where the same file can be
run from the REPL, e.g. for rapid development, and from the command line,
e.g. for longer running simulations.

#### Running notebooks
On can run the notebook like
```
julia --project etc/runpluto.jl notebooks/demo-notebook.jl
```
Unlike the scripts, the notebook activates the project environment. This disables Pluto's built-in package manager and
allows to work in the same shared environment.

### Adaptation
- Please check the LICENSE file and replace it by another license if you don't agree with it.
- Please check the `authors` entry in `Project.toml`
- Remove or replace demo scripts and notebooks
- Set up a git repo for sharing the code. All subdirectories and top level files in this initial version should be under version control
- The project has  [DrWatson.jl](https://juliadynamics.github.io/DrWatson.jl/stable/) as dependency.
  This project structure is compatible to it with two exceptions:
  - It doesn't rely on `@quickactivate`.  It assumes  that the skills obtained by learning how to work with Julia environments are useful
  - Notebooks are assumed to be Pluto notebooks which can be version controlled in straigtforward way, unlike Jupyter notebooks

### Hints
- Consider introducing  subdirectories for large simulation results which are not under version control due to their size
- Consider introducing further subdirectories to structure your project
- Avoid duplicating code. If two notebooks or scripts contain the same code, consider moving this to the shared project under `src`.
- Longer simulations should be called in command line scripts, this makes it easy to run them on a remote server.
- Avoid complicated or long running notebooks. Rather try to use them as user frontends which call some of the shared code,
  or load results from longer simulations which.
  
### Initial directory tree
```
{PKGNAME}/
.
├── Project.toml
├── README.md
├── LICENSE
├── src
│   └── {PKGNAME}.jl
├── scripts
│   ├── demo-cli.jl
│   ├── DemoREPL.jl
│   └── DemoREPLCLI.jl
├── notebooks
│   └── demo-notebook.jl
├── docs
│   ├── make.jl
│   ├── Project.toml
│   └── src
│       └── index.md
├── test
│   └── runtests.jl
└── etc
    └── runpluto.jl
```
The essential role of these files is as follows:

- `Project.toml`: The project file describes the project on a high level. It lists packages used by the prokject together with version compatibility constraints  [documentation](https://pkgdocs.julialang.org/v1/toml-files/#Project-and-Manifest)
- `LICENSE`: License of the project. By default it is the MIT license
- `README.md`: This file
- `src`: Subdirectory for shared project specific code as part of the {PKGNAME} package representing the project.
- `scripts`, `notebooks`: "Frontend" code for creating project results
- `docs`: Sources for the documentation created with `Documenter.jl`
- `test`: Unit tests for project code in `src`. Could include something from `scripts`, `notebooks`.
- `etc`: Service code
