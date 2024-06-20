In this project, we use multiple landfire products to estimate the area of western US forests that are "cold and wet" with pre-Euro American fire regimes that were long-interval and stand replacing and that have departed little from Pre-Euro American composition and forest structure.
The workflow for the analysis is as follows:
  1. We first use the EVT 2022 layer to filter to cells dominated by deciduous/evergreen/mixed vegetation and is dominated by Trees
  2. We then use 2020 BPS layer to filter the forest cells in fire regime group (4A, 4B, 5A, or 5B) and fire return interval is longer than 80 years and % SR is at least 80%.
      We include: Group IV-A Percent replacement fire greater than 80%, fire return interval 36-100 years
                  Group IV-B Percent replacement fire greater than 66.7%, fire return interval 101-200 years
                  Group V-A Any severity, fire return interval 201-500 years
                  Group V-B Any severity, fire return interval 501 or more years
                   We further filter to areas where fire return interval was 80 years or great.
  3. Then we use the 2022 Vegetation condition class layer to find the remaining cells that are group 1 or 2, which are both low to moderate departure (vegetation departure of less than 66%).
      The Vegetation Condition Class (VCC) data layer categorizes departure between current vegetation conditions and reference vegetation conditions similar to the methods outlined in the Interagency Fire Regime Condition Class Guidebook.
 
![image](https://github.com/Forest-Futures-Lab/Cold_wet-forest-estimation/assets/26123302/c19cf966-58ef-4c89-8bf5-7accb995cc20)
