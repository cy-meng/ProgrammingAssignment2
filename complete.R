complete <- function(directory, id = 1:332) {

	files <- list.files(directory, full.names = T)
	n <- data.frame()
	for (i in id){
	a <- read.csv(files[i])
	a2 <- a[complete.cases(a),]
	na <- data.frame(id = i, nobs = length(a2[,2]))
	n <- rbind(n, na)
	}
	n
}