# Insurance Analysis

## Beskrivning

Detta projekt analyserar vilka faktorer som påverkar försäkringskostnader med hjälp av R. Analysen omfattar datastädning, visualiseringar och en linjär regressionsmodell för att undersöka samband mellan olika variabler och kostnader.

------------------------------------------------------------------------

## Projektstruktur

```         
insurance-analysis/
│
├── data/
│   └── insurance.csv
│
├── output/
│   ├── charges_hist.png
│   ├── smoker_vs_charges.png
│   ├── bmi_vs_charges.png
│   ├── exercise_vs_charges.png
│   └── risk_vs_charges.png
│
├── analysis.R
├── report.md
├── README.md
```

------------------------------------------------------------------------

## Hur du kör projektet

1.  Öppna projektet i RStudio
2.  Installera nödvändiga paket:

``` r
install.packages(c("tidyverse", "janitor", "skimr"))
```

3.  Kör hela filen `analysis.R` från början till slut

------------------------------------------------------------------------

## Vad analysen innehåller

-   Inläsning och förståelse av data
-   Datastädning (hantering av saknade värden och inkonsekvenser)
-   Skapande av nya variabler
-   Beskrivande analys med visualiseringar
-   Sparade grafer i `output/`-mappen
-   En linjär regressionsmodell
-   Tolkning av resultat

------------------------------------------------------------------------

## Paket som används

-   tidyverse
-   janitor
-   skimr

------------------------------------------------------------------------

## Författare

Daniel Rangmyr
