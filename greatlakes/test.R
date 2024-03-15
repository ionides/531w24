library(doParallel)
cores <-  as.numeric(Sys.getenv('SLURM_NTASKS_PER_NODE', unset=NA))
if(is.na(cores)) cores <- detectCores()  
registerDoParallel(cores)

system.time(
 rnorm(10^8)
) -> time0

system.time(
  foreach(i=1:10) %dopar% rnorm(10^7)
) -> time1

system.time(
  foreach(i=1:10^2) %dopar% rnorm(10^6)
) -> time2

system.time(
  foreach(i=1:10^3) %dopar% rnorm(10^5)
) -> time3

system.time(
  foreach(i=1:10^4) %dopar% rnorm(10^4)
) -> time4

write.table(file="test.csv",
  rbind(time0,time1,time2,time3,time4))


