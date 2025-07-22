#' Save GPA data to a CSV file
#'
#' Saves a data frame with grades, ECTS credits, and calculated GPA.
#'
#' @param grades A numeric vector of grades.
#' @param ects A numeric vector of ECTS credits.
#' @param gpa A numeric value (the GPA result).
#' @param file Filename to save to (default: "gpa_data.csv").
#'
#' @return No return value. Writes a file to disk.
#' @export

save_gpa_data <- function(grades, ects, gpa, file = "gpa_data.csv") {
  df <- data.frame(grade = grades, ects = ects)
  write.csv(df, file, row.names = FALSE)

  # Save GPA separately for reliable comparison
  gpa_info <- data.frame(gpa = gpa)
  write.csv(gpa_info, "gpa_info.csv", row.names = FALSE)

  message("📁 GPA data saved to '", file, "' ✅")
}

