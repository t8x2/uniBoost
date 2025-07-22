#' Load previously saved GPA data and compare it
#'
#' Reads the last saved GPA dataset and prints the GPA comparison.
#'
#' @param new_gpa (optional) A numeric value of the current GPA to compare.
#' @param file Filename to load from (default: "gpa_data.csv").
#'
#' @return A data frame with grade, ects, and a message comparing GPA values.
#' @export

load_gpa_data <- function(new_gpa = NULL,
                          file = "gpa_data.csv",
                          gpa_file = "gpa_info.csv") {
  if (!file.exists(file)) {
    cat("⚠️ No GPA data file found.\n")
    return(invisible(NULL))
  }

  df <- read.csv(file)

  # Load previous GPA if available
  if (file.exists(gpa_file)) {
    gpa_info <- read.csv(gpa_file)
    old_gpa <- gpa_info$gpa[1]
  } else {
    old_gpa <- NA
  }

  if (!is.null(new_gpa) && !is.na(old_gpa)) {
    cat("📂 Previously saved GPA file found.\n")
    cat("📊 Previous GPA: ", round(old_gpa, 2), "\n")
    cat("📈 Current GPA:  ", round(new_gpa, 2), "\n")

    diff <- round(new_gpa - old_gpa, 2)

    if (diff < 0) {
      cat("🎉 Improvement of", abs(diff), "points! Keep going!\n")
    } else if (diff > 0) {
      cat("🔁 Slight increase by", diff, "points. You’ve got this!\n")
    } else {
      cat("👌 GPA stayed the same. Solid performance!\n")
    }
  } else {
    cat("⚠️ GPA value missing or invalid for comparison.\n")
  }

  return(df)
}
