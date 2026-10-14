# combine_groups

An R function to combine sample size, mean and SD across two or more groups
(e.g. whole-sample age from per-arm descriptives) for data extraction.


## Files

- `combine_groups.R`: the function
- `tracking_file.qmd`: worked examples

## Formula

$$
M = \frac{\sum n_i m_i}{N}, \qquad
SD = \sqrt{\frac{\sum \left[(n_i - 1) SD_i^2 + n_i (m_i - M)^2\right]}{N - 1}}
$$

For two groups, this matches the Cochrane Handbook formula for combining groups.
