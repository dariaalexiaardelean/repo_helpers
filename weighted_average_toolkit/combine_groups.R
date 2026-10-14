#' Combine sample size, mean and SD across k groups
#'
#' Exact combination of group-level descriptives into a single group,
#' e.g. to obtain whole-sample age when a study reports it only per arm.
#' For k = 2 this equals the formula in the Cochrane Handbook
#' (Table 6.5.2.a, "Combining groups"); for k > 2 it is the exact
#' generalisation (equivalent to applying the two-group formula sequentially).
#'
#' @param n  numeric vector of group sample sizes
#' @param m  numeric vector of group means
#' @param sd numeric vector of group standard deviations
#' @return named numeric vector: N, mean, sd
#'
#' @details
#' Do NOT average the SDs (weighted or not): that ignores the spread
#' between group means and underestimates the combined SD.
#'
#' @examples
#' combine_groups(n = c(25, 23), m = c(64.2, 66.8), sd = c(8.1, 7.4))
combine_groups <- function(n, m, sd) {
  stopifnot(
    is.numeric(n), is.numeric(m), is.numeric(sd),
    length(n) == length(m), length(m) == length(sd),
    length(n) >= 2,
    !anyNA(c(n, m, sd)),
    all(n > 1),
    all(sd >= 0)
  )
  N  <- sum(n)
  M  <- sum(n * m) / N
  SD <- sqrt(sum((n - 1) * sd^2 + n * (m - M)^2) / (N - 1))
  c(N = N, mean = M, sd = SD)
}
