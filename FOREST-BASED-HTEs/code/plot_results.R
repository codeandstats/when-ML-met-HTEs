#### Plot results #####
source("setup.R")

# read in data
resnam <- "../results/all_repl40.rds"
res <- readRDS(resnam)

# rename result.res column to mse
# (helpers.R was updated in the meantime and throws an error if column name is not mse)
if ("result.res" %in% names(res)) names(res)[names(res) == "result.res"] <- "mse"

# define which methods to show
methodnams <- c("mob", "equalized", "mobcf",
  "cf", "doubleml")
methodnams <- methodnams[methodnams %in% unique(res$algorithm)]

# run preprocessing script which requires to set HONESTY
HONESTY <- FALSE # set to TRUE to show also the results for honest forests
source("helpers.R")
# this creates the data sets normalA and normalB

# plot results
plot_results(normalB, scB, ylim = c(-.1, 1.1), cexstrip = 1)