#' Reset GPA data file
#'
#' Deletes the current GPA data files ("gpa_data.csv" and "gpa_info.csv") after confirmation.
#'
#' @param file The name of the GPA data file (default: "gpa_data.csv")
#' @param gpa_file The name of the GPA value file (default: "gpa_info.csv")
#' @return Message indicating success or cancellation.
#' @export
#'
#' @examples
#' \dontrun{
#' reset_gpa_data()
#' }

reset_gpa_data <- function(file = "gpa_data.csv", gpa_file = "gpa_info.csv") {
  if (!file.exists(file) && !file.exists(gpa_file)) {
    cat("📁 No GPA data files found to delete.\n")
    return(invisible(NULL))
  }

  confirm <- tolower(readline("⚠️ Are you sure you want to delete your saved GPA data? (y/n): "))
  if (confirm == "y") {
    if (file.exists(file)) {
      file.remove(file)
      cat("🗑️ GPA data file '", file, "' deleted.\n")
    }
    if (file.exists(gpa_file)) {
      file.remove(gpa_file)
      cat("🗑️ GPA info file '", gpa_file, "' deleted.\n")
    }
    cat("✅ All GPA data successfully reset.\n")
  } else {
    cat("❌ Deletion canceled. Your GPA data is safe.\n")
  }
}

