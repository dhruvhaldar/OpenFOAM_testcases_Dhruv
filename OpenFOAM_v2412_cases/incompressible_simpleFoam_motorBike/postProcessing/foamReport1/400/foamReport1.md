---
marp: true
paginate: true
---

<style>
:root {
    font-size: 20px;
}
td {
    width: 1000px;
}
table {
    width: 100%;
}
img {
    display: block;
    margin-left: auto;
    margin-right: auto;
    width: 60%;
}
</style>

# simpleFoam : motorBike tutorial

- Case: /usr/lib/openfoam/openfoam2412/tutorials/incompressible/simpleFoam/motorBike
- Submission: 16:23:32 on Mar 05 2025
- Report time: 16:27:01 on Mar 05 2025

---

## Run information

| Property       | Value              |
|----------------|--------------------|
| Host           | 7e4d9534f50a        |
| Processors     | 6      |
| Time steps     | 400  |
| Initial deltaT | 1 |
| Current deltaT | 1 |
| Execution time | 208.41  |

---

## OpenFOAM information

| Property       | Value              |
|----------------|--------------------|
| Version        | 2412     |
| API            | 2412         |
| Patch          | 0       |
| Build          | _45e7c4a0-20241224       |
| Architecture   | LSB;label=32;scalar=64  |

---

## Mesh statistics

| Property          | Value                |
|-------------------|----------------------|
| Bounds            | (-5 -4 0)(15 4 8) |
| Number of cells   | 58932   |
| Number of faces   | 189342   |
| Number of points  | 72863  |
| Number of patches | 72 |

---

## Linear solvers

| Property | Value          | tolerance(rel)   | Tolerance(abs)      |
|----------|----------------|------------------|---------------------|
| p        | `GAMG` | 1e-07 | 0.01 |
| U        | `smoothSolver` | 1e-08 | 0.1 |

---

## Numerical scehemes

The chosen divergence schemes comprised:

~~~
divSchemes
{
    default         none;
    div(phi,U)      bounded Gauss linearUpwindV grad(U);
    turbulence      bounded Gauss upwind;
    div(phi,k)      bounded Gauss upwind;
    div(phi,omega)  bounded Gauss upwind;
    div((nuEff*dev2(T(grad(U))))) Gauss linear;
}

~~~

---

## Graphs

Residuals

![](/usr/lib/openfoam/openfoam2412/tutorials/incompressible/simpleFoam/motorBike/postProcessing/residualGraph1/400/residualGraph1.svg)

---

## Results

Forces

![](/usr/lib/openfoam/openfoam2412/tutorials/incompressible/simpleFoam/motorBike/postProcessing/forceCoeffsGraph1/400/forceCoeffsGraph1.svg)

---

Made using Open&nabla;FOAM v2412 from https://openfoam.com

