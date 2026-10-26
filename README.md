# SwapSlot | Causal Experiment & Business Analytics

**Academic team project · Bocconi University · R · Randomized survey experiment · Causal inference**

## Overview
SwapSlot is a proposed two-sided platform connecting businesses with last-minute cancelled reservations to users looking for available slots. This academic study evaluates the concept through secondary market data, competing causal theories, and a randomized discount-vignette survey. **This is a concept and survey study, not evidence of a deployed app or real bookings.**

## Research question
Does offering a 20% discount increase perceived attractiveness and intention to adopt a last-minute booking platform?

## Methods
- Exploratory cancellation-rate analysis using three external service-sector datasets (hotel, salon, medical appointments).
- Two competing business models: business-to-consumer relisting and peer-to-peer exchange.
- Qualtrics randomized vignette: identical booking scenario with vs. without a 20% discount.
- Attention checks, balance tests, first-stage regression and instrumented second-stage analyses in R.

## Findings reported in the team report
- **134 respondents** in the final analytical sample after exclusions (176 completed the survey).
- Discount increased perceived attractiveness (**β ≈ 0.66; p ≈ 0.02**).
- Instrumented attractiveness was positively associated with download intention (**β ≈ 1.22; p ≈ 0.03**) and binary signup intention (**β ≈ 0.22; p ≈ 0.04**).
- The team updated its **assumption-based** estimated platform-success probability from 42% to 44%; this is **not an observed market success rate**.

These figures are taken from the written report, not independently reproduced here. The study measures **stated intentions**, not actual customer behavior; its sample was concentrated among young Italian respondents. The R script requires cleanup and validation before being treated as reproducible.

## Repository layout
```
scripts/
  cancellation_rates.R         # exploratory analysis; external data files required
  survey_experiment_analysis.R # original analysis draft; requires fixes and local input data
PUBLICATION_CHECKLIST.md
README.md
```

## Data and reproducibility
Survey respondent-level data are **not included** in this public-ready draft, pending consent, disclosure-risk review, and confirmation of sharing rights. The scripts refer to local file paths and some inconsistent variable names; they are provided as original research materials rather than a turnkey executable pipeline. Public external datasets must be obtained separately and checked against their licenses.

