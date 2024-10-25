rm(list = ls())

set.seed(1)

dir <- "/home/mgriffin/Documents/Research/"

# Matrix that describes the settings that will vary by job submitted to the cluster (each row is a job, columns describe anything that's changing across jobs)
settings <- expand.grid("mean" = c(0, 0, 1, 2), "sd" = c(1, 2))

# Get job indicator i.e. which row of the above matrix we're in
s <- Sys.getenv("SLURM_ARRAY_TASK_ID")

x <- rnorm(10000, mean = settings[s, "mean"], sd = settings[s, "sd"])

save(x, s, settings, 
     file = paste(dir, "/Demo/Out/Data/demo_", s, ".RData",
                  sep = ""))


