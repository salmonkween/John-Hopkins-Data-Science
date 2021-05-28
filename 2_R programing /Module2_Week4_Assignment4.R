#when we read the data read.csv(", colclasses ="character)
# we coerced the data as in character
best<-function(state,outcome){
data<-read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(data)
ncol(data)
names(data)
#making a histogram of mortality from heart attack
#make the data in col 11 into numeric
data[,11]<-as.numeric(data[,11])
hist(data[,11])

# best hospital in 2 character name, outcome name
#best hospital in states
#vector of hospital states

statevector<-unique(data$State)
outcomevector <- c("heart attack" , "heart failure" , "pneumonia")         

#checking if the input state or disease is valid
if(!(state %in% unique(data$State))) stop("Invalid State")
if(!(outcome %in% outcomevector)) stop("Invalid Outcome")

#getting subset data of interested variable hospital name, state heart attack
#heart failure
subset_outcome<-data[,c(11, 17, 23)]

#get the relelvent data that match our search
#data of states of interested
x<- data[data$state == state,]

#state of interest and the condition 
outcome_final<-x$x[,c(11,17,23)]
min_outcome<-min(x[,outcome],)

best2 <- function(state, outcome) {
  x <- read.csv("outcome-of-care-measures.csv" , header =TRUE, stringsAsFactors=F)          
  outcomevector <- c("heart attack" , "heart failure" , "pneumonia")         
  if(!(state %in% unique(x$State))) stop("Invalid State")
  if(!(outcome %in% outcomevector)) stop("Invalid Outcome")
  
  X <- x[x$State== state,]
  names(X)[c(11, 17, 23)] <- outcomevector
  answer <- X[X[,outcome] == min(X[,outcome]), ][2]    
  FA <- answer[with(answer, order(Hospital.Name)), ]
  FA[1]   
}


#part 3
rankhospital <- function(state, outcome, num = "best") {
  
  # Read outcome data
  out_dt <- data.table::fread('outcome-of-care-measures.csv')
  
  outcome <- tolower(outcome)
  
  # Column name is same as variable so changing it 
  chosen_state <- state 
  
  # Check that state and outcome are valid
  if (!chosen_state %in% unique(out_dt[["State"]])) {
    stop('invalid state')
  }
  
  if (!outcome %in% c("heart attack", "heart failure", "pneumonia")) {
    stop('invalid outcome')
  }
  
  # Renaming Columns to be less verbose and lowercase
  setnames(out_dt
           , tolower(sapply(colnames(out_dt), gsub, pattern = "^Hospital 30-Day Death \\(Mortality\\) Rates from ", replacement = "" ))
  )
  
  #Filter by state
  out_dt <- out_dt[state == chosen_state]
  
  # Columns indices to keep
  col_indices <- grep(paste0("hospital name|state|^",outcome), colnames(out_dt))
  
  # Filtering out unnessecary data 
  out_dt <- out_dt[, .SD ,.SDcols = col_indices]
  
  # Find out what class each column is 
  # sapply(out_dt,class)
  out_dt[, outcome] <- out_dt[,  as.numeric(get(outcome))]
  
  
  # Removing Missing Values for numerical datatype (outcome column)
  out_dt <- out_dt[complete.cases(out_dt),]
  
  # Order Column to Top 
  out_dt <- out_dt[order(get(outcome), `hospital name`)]
  
  out_dt <- out_dt[,  .(`hospital name` = `hospital name`, state = state, rate = get(outcome), Rank = .I)]
  
  if (num == "best"){
    return(out_dt[1,`hospital name`])
  }
  
  if (num == "worst"){
    return(out_dt[.N,`hospital name`])
  }
  
  return(out_dt[num,`hospital name`])
  
}

