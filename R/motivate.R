#' Motivate a student with a random message
#'
#' @return A motivational message (character)
#' @export
#' @examples
#' motivate_student()
motivate_student <- function() {
  messages <- c(
    "You’ve got this! 💪",
    "One line of code at a time. 🧠",
    "Trust the process – even the bugs. 🐞",
    "R you ready? Yes you are! 📈",
    "Learning is not linear – keep going! 🚶‍♀️➡️🧠",
    "Progress > perfection. 🌱",
    "Debugging is just learning in disguise. 🕵️‍♂️",
    "Every great R user once started confused. 😵➡️😎",
    "This plot will work. Eventually. 🧙‍♀️",
    "Statistics: 20% math, 80% patience. 🧘‍♂️",
    "You’re literally creating your own tools – wow. 🛠️",
    "That feeling when it runs: priceless. ✅",
    "Imagine submitting this and impressing your prof. 🎓",
    "Even Hadley Wickham had to learn this once. 🧑‍🏫",
    "Console errors are just R talking to you. 💬",
    "You survived semester 3 – you’ll survive this too. 😅",
    "You’re learning something employers love. 💼",
    "Imagine this in your GitHub portfolio. 🔥",
    "Breaks are productive. Go get a tea. 🍵",
    "Future you is proud of you. ❤️",
    "Error? Cool. You’re closer now. ⏩",
    "This function slays. Just like you. 💅",
    "Imagine this package helping someone else!",
    "Just one more commit. 🧩",
    "Your brain is literally building new connections rn. 🧠✨",
    "Learning R is elite-level uni behavior. 🧬",
    "GitHub loves your code. 🐙",
    "You + R = unstoppable. 🚀",
    "Let’s R! 🎉",
    "Console says no? We say try again. 😤",
    "Running… error… learning… repeat. 🔁",
    "R might be mean, but you’re meaner. 🔥",
    "Still better than debugging in Excel. 😏",
    "404: Motivation not found – generating now. ⚡",
    "Legend says your code will run on the 7th try. 🧙",
    "rm(list = ‘self doubt’) 💫",
    "Plot twist: you're actually doing fine. 📈",
    "Breathe. You’re just coding, not defusing a bomb. 💣",
    "Compile the courage. Document the dreams. 📚",
    "Be kind to your future self – comment your code. 🧾",
    "The error isn’t you. It’s just R being dramatic. 🎭",
    "‘It works on my machine’ – you, proudly. 🧑‍💻",
    "Turn the warnings into wisdom. ⚠️➡️🧠",
    "Keep calm and `devtools::load_all()` 🔁",
    "Remember: even the tidyverse didn’t tidy itself. 🧹",
    "You didn’t come this far to quit at a warning. 🚧",
    "Sweating over code? That’s just the learning burning. 🔥🧠",
    "Don’t worry. Your package is already cooler than base R. 😎",
    "Git commit – to the grind. 🧱",
    "If it were easy, it’d be called `easyverse`. 😉",
    "You vs. R: a tale of persistence and parentheses. ( )",
    "Even R can’t handle how amazing you are. 💻💥",
    "You’re the main function in this script. 🧬",
    "Statistically, you’re improving. 📊",
    "That feeling when `R CMD check` says 0 errors: chef’s kiss. 👨‍🍳💋"
  )

  sample(messages, 1)
}
