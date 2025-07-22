#' Starts a customizable Pomodoro-style timer.
#'
#' Runs a focus session followed by a break, with optional motivational message and repeat option.
#'
#' @param focus_minutes Focus duration in minutes (default: 25)
#' @param break_minutes Break duration in minutes (default: 5)
#'
#' @return Console messages and optional motivational quote.
#' @export
#'
#' @examples
#' \dontrun{
#' pomodoro_timer()                  # Standard session
#' pomodoro_timer(0.05, 0.03)        # Tutors: You can test the loop easily with short durations like this!
#' }
pomodoro_timer <- function(focus_minutes = 25, break_minutes = 5) {

  if (!requireNamespace("beepr", quietly = TRUE)) {
    stop("Please install the 'beepr' package to enable sounds: install.packages('beepr')")
  }

  while (TRUE) {
  beepr::beep(1)
  message("⏳ Focus time! You've got ", focus_minutes, " minutes. Go!")
  Sys.sleep(focus_minutes * 60)
  beepr::beep(2)
  cat("\n✅ Focus phase complete!\n")

  message("☕ Take a ", break_minutes, "-minute break now!")
  Sys.sleep(break_minutes * 60)
  beepr::beep(4)
  cat("\n🧠 Break's over!\n")

  # 🗨️ Ask user if they want a motivational quote
  quote <- tolower(readline(prompt = "💬 Would you like a motivational quote? (y/n): "))
  if (quote == "y") {
    beepr::beep(5)
    message(motivate_student())
  }

  # 👉 Ask the user whether they want to continue
  continue <- tolower(readline(prompt = "➕ Start another round? (y/n): "))
  if (continue != "y") {
    beepr::beep(10)
    message("👏 Great job! See you next time.")
    break
    }
  }
}
