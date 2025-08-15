# Spectroscopy-Analysis

## Repository Description

R scripts for analyzing and plotting data from **UV–Vis absorption**, **circular dichroism (CD)**, and **fluorescence** experiments.  
Course assignment: *“Analyse and plot data acquired from UV-VIS-/CD- and Fluorescence Microscopy. Compare and draw conclusions from the various used techniques.”*

## What each script does
- **Absorption.R / Absorption Plot.R** – Import, process, and visualize UV–Vis spectra (λ vs. A).  
- **CD Spektrum.R** – Plot CD spectra (ellipticity vs. wavelength) for secondary-structure comparisons.  
- **Stokes Shift.R** – Compute/visualize excitation–emission peak separation.  
- **Inhibition.R** – Analyze ligand/enzyme inhibition readouts from spectroscopic data.  
- **Michaelis_Menten.R** – Fit kinetic parameters (Vmax, Km) from absorbance-time or rate data.  
- **Kombi1_smooth.R / Kombi2_smooth.R** – Combined views across techniques and optional spectral smoothing.

> See `Molecular Biophysics Protocol.pdf` for experimental details and data acquisition steps.

## Requirements

- R (≥4.3) and RStudio
- `ggplot2`
- `readr`
- `dplyr`

## Interpretation checklist

* **UV–Vis:** Peak positions/intensities; Beer–Lambert linearity.
* **CD:** Sign/shape vs. secondary structure; thermal/ligand-induced changes.
* **Fluorescence:** Emission maxima, **Stokes shift**, quenching/enhancement.
* **Cross-technique comparison:** Do spectral changes correlate across UV–Vis, CD, and fluorescence?
* **Kinetics:** Report `Vmax`, `Km` (± CI) and goodness-of-fit.
