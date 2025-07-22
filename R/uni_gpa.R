#' Interactive GPA calculator with memory and updates
#'
#' Loads saved GPA data if available. You can enter new grades + ECTS to update your GPA.
#' If no new input is provided, it simply shows your current GPA.
#'
#' @return Displays updated GPA and stores the data for future use.
#' @export
#' @examples
#' \dontrun{
#' gpa_calculator()
#' }

gpa_calculator <- function() {
  grades <- c()
  ects <- c()

  # 🔐 Ask whether to load previous data
  load_prev <- tolower(readline("📂 Load previous GPA data? (y/n): "))
  if (load_prev == "y" && file.exists("gpa_data.csv")) {
    saved_data <- read.csv("gpa_data.csv")
    cat("📋 Previously saved GPA data:\n")
    print(saved_data)
    grades <- saved_data$grade
    ects <- saved_data$ects
  }

  # ✍️ Add new grades and ECTS
  repeat {
    grade_input <- readline("Enter a new grade (or press enter to skip): ")
    if (grade_input == "") break
    ects_input <- readline("Enter corresponding ECTS: ")

    grades <- c(grades, as.numeric(grade_input))
    ects <- c(ects, as.numeric(ects_input))
  }

  if (length(grades) == 0) {
    cat("❌ No grades available. GPA calculation canceled.\n")
    return(invisible(NULL))
  }

  total_ects <- sum(ects)
  max_excludable <- floor(total_ects / 6)

  cat("📊 You have a total of", total_ects, "ECTS.\n")
  cat("🎯 Up to", max_excludable, "ECTS can be excluded from GPA.\n")

  exclude <- tolower(readline("Exclude worst grades? (y/n): "))
  df <- data.frame(grade = grades, ects = ects)
  df_calc <- df  # copy for calculation

  if (exclude == "y") {
    df_calc <- df_calc[order(-df_calc$grade), ]
    excluded_ects <- 0
    i <- 1
    while (i <= nrow(df_calc) && excluded_ects + df_calc$ects[i] <= max_excludable) {
      excluded_ects <- excluded_ects + df_calc$ects[i]
      df_calc$ects[i] <- 0
      i <- i + 1
    }
    df_calc <- df_calc[df_calc$ects > 0, ]
  }

  if (nrow(df_calc) == 0 || sum(df_calc$ects) == 0) {
    cat("⚠️ All grades excluded. No GPA to calculate.\n")
    return(invisible(NULL))
  }

  weighted_avg <- sum(df_calc$grade * df_calc$ects) / sum(df_calc$ects)
  cat("📊 Your updated GPA is:", round(weighted_avg, 2), "\n")

  # 🔍 Compare with previous GPA
  compare <- tolower(readline("📈 Compare with previous GPA? (y/n): "))
  if (compare == "y") {
    load_gpa_data(new_gpa = weighted_avg)
  }

  # 💾 Save data
  save <- tolower(readline("Save current GPA data for next time? (y/n): "))
  if (save == "y") {
    save_gpa_data(grades, ects, weighted_avg)
  }
}
