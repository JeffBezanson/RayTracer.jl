# RayTracer.jl

[![Build Status](https://travis-ci.com/avik-pal/RayTracer.jl.svg?branch=master)](https://travis-ci.com/avik-pal/RayTracer.jl)
[![codecov](https://codecov.io/gh/avik-pal/RayTracer.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/avik-pal/RayTracer.jl)
[![Build status](https://ci.appveyor.com/api/projects/status/887v1miv7ig4mod2?svg=true)](https://ci.appveyor.com/project/avik-pal/raytracer-jl) 
[![Latest Docs](https://img.shields.io/badge/docs-latest-blue.svg)](https://avik-pal.github.io/RayTracer.jl/dev/)
[![status](https://submissions.juliacon.org/papers/ebd92f2a47780826004bd88a6fd1f717/status.svg)](https://submissions.juliacon.org/papers/ebd92f2a47780826004bd88a6fd1f717)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.1442781.svg)](https://doi.org/10.5281/zenodo.1442781)

<p align="center">
    <video width="512" height="320" autoplay loop>
        <source src="docs/src/assets/udem1.gif" type="video/gif">
    </video>
</p>

A Ray Tracer written completely in Julia. This allows us to leverage the AD capablities provided
by Zygote to differentiate through the Ray Tracer.

## INSTALLATION

The package is currently not registered. So open up a Julia 1.1+ repl and enter the pkg mode.

```julia
] add RayTracer
```

For GPU Support

```julia
] add RayTracer#ap/gpu
```

## TUTORIALS

<div align="center">
  <table>
    <tr>
      <th style="text-align:center">
        <a href="examples/teapot_rendering.jl">Introductory Rendering Tutorial</a>
      </th>
      <th style="text-align:center">
        <a href="examples/inverse_lighting.jl">Inverse Lighting Tutorial</a>
      </th>
      <th style="text-align:center">
        <a href="examples/optim_compatibility.jl">Inverse Rendering with Optim.jl Tutorial</a>
      </th>
    </tr>
    <tr>
      <td align="center">
        <a href="examples/teapot_rendering.jl">
          <img border="0" src="paper/images/render/teapot_top.jpg" width="200" height="200">
        </a>
      </td>
      <td align="center">
        <a href="examples/inverse_lighting.jl">
          <img border="0" src="docs/src/assets/inv_lighting.gif" width="200" height="200">
        </a>
      </td>
      <td align="center">
        <a href="examples/optim_compatibility.jl">
          <img border="0" src="docs/src/assets/inv_lighting_optim.gif" width="200" height="200">
        </a>
      </td>
    </tr>
  </table>
</div>

## USAGE EXAMPLES

Follow the instructions below to run individual examples or use
`examples/script.sh` to run all of them together.

First we need to get the versions of the packages used when these
examples were written.

```bash
$ cd examples
$ julia --color=yes -e "using Pkg; Pkg.instantiate()"
```

Now we can run any of the file we need by
`julia --project=. --color=yes "/path/to/file"`

### Running Individual Examples

* [`teapot_rendering.jl`](examples/teapot_rendering.jl) -- We need to download the `teapot.obj` file.

```
wget https://raw.githubusercontent.com/McNopper/OpenGL/master/Binaries/teapot.obj
```

* [`performance_benchmarks.jl`](examples/performance_benchmarks.jl) -- We need the mesh and texture for
  the yield sign board.

```bash
$ mkdir meshes
$ cd meshes
$ wget https://raw.githubusercontent.com/avik-pal/RayTracer.jl/master/test/meshes/sign_yield.obj
$ wget https://raw.githubusercontent.com/avik-pal/RayTracer.jl/master/test/meshes/sign_yield.mtl
$ cd ..

$ mkdir textures
$ cd textures
$ wget https://raw.githubusercontent.com/avik-pal/RayTracer.jl/master/test/textures/wood_osb.jpg
$ wget https://raw.githubusercontent.com/avik-pal/RayTracer.jl/master/test/textures/sign_yield.png
$ cd ..
```

This example requires a few arguments to be passes from command line. Chack them using

`julia  --project=. --color=yes "performance_benchmarks.jl" --help`

* [`inverse_lighting.jl`](examples/inverse_lighting.jl) &
  [`optim_compatibility.jl`](examples/optim_compatibility.jl) -- We need to the `tree.mtl`
  and `tree.obj` files.

```
$ wget https://raw.githubusercontent.com/tejank10/Duckietown.jl/master/src/meshes/tree.obj 
$ wget https://raw.githubusercontent.com/tejank10/Duckietown.jl/master/src/meshes/tree.mtl
```

### Additional Examples

[Duckietown.jl](https://github.com/tejank10/Duckietown.jl) uses RayTracer.jl for generating renders
of a self-driving car environment. For more complex examples of RayTracer, checkout that project.

## SUPPORTING AND CITING:

This software was developed as part of academic research. If you would like to help support it, please star the repository. If you use this software as part of your research, teaching, or other activities, we would be grateful if you could cite the following:

```
@misc{pal2019raytracerjl,
    title={{RayTracer.jl: A Differentiable Renderer that supports Parameter Optimization for Scene Reconstruction}},
    author={Avik Pal},
    year={2019},
    eprint={1907.07198},
    archivePrefix={arXiv},
    primaryClass={cs.GR}
}
```

## CURRENT ROADMAP

These are not listed in any particular order

- [X] Add more types of common objects (use mesh rendering for this)
- [X] Add support for rendering arbitrary mesh
- [ ] GPU Support using CuArrays (partially supported in `ap/gpu` branch)
- [X] Inverse Rendering Examples
- [ ] Application in Machine Learning Models through Flux (work in progress)
- [X] Texture Rendering
- [ ] Make everything differentiable:
  - [ ] Triangle Mesh
