 
#	Import the Bollywood data set in Rstudio in a variable named bollywood

  getwd()                                                               #getting working directory information
  bollywood <- read.csv("C:/Users/Saurav/Documents/bollywood.csv",TRUE) #importing "bollywood.csv" to RStudio
  View(bollywood)                                                       #viewing bollywood data frame


#	When you import a data set, R stores character vectors as factors (by default)
# You can check the structure of the data frame by using str()
  str(bollywood)                                              #checking the structure of the data frame

# You can change the attribute 'Movie' from factor to character type using the given command
  bollywood$Movie <- as.character(bollywood$Movie)          #converting Movie from factor to character
	 

#Q1.
#	Access the last 10 movies (from the bottom of the Bollywood data frame) using column bollywood$Movie
# Store the names of those movies in last_10 vector (in the same order)
     
	last_10 <- tail(bollywood$Movie,10)                                  #tail function gives the last rows
	print(last_10)                                                       #final output
	 
	  
#Q2.
#	Find out the total number of  missing values (NA) in the bollywood data frame.
# Store the result in na_bollywood vector
     
	na_bollywood <- sum(is.na(bollywood)) #is.na function traverses the whole data frame and returns 1 for each missing value, summing them together gives the result
	na_bollywood                          #final output
	
#Q3
#	Write the command to find out which movie tops the list in terms of Total Collections
# Store the movie name in variable named top_movie
  
  top_movie <- bollywood[bollywood$Tcollection == max(bollywood$Tcollection),1]   #top_movie vector stores the result
  top_movie                                                                       #final output
  
#Q4
#	Write the command to find out which movie comes second on the list in terms of Total Collections
# Store the movie name in variable named top_2_movie

  index <- order(bollywood$Tcollection, decreasing = T)[2]                   #sorting Tcollection in descending order
  top_2_movie <- bollywood [index,1]                                         #top_2_movie vector stores the result
  top_2_movie                                                                #final output
  
# Now let's find out the movies shot by Shahrukh, Akshay and Amitabh separately.
# subset() function is used for that. The code has already been written for you. 
	
	shahrukh <- subset(bollywood, Lead == "Shahrukh")
	akshay <- subset(bollywood, Lead == "Akshay")
	amitabh <- subset(bollywood, Lead  == "Amitabh")

# You can view what the above data frames look like

	View(bollywood)
	actorWiseHits_shahrukh <- data.frame(subset(bollywood, Lead == "Shahrukh"))
	actorWiseHits_shahrukh                                                     #SRK hits
	actorWiseHits_akshay <- data.frame(subset(bollywood, Lead == "Akshay"))
	actorWiseHits_akshay                                                       #Akki hits
	actorWiseHits_amitabh <- data.frame(subset(bollywood, Lead == "Amitabh"))
	actorWiseHits_amitabh                                                      #BigB hits
		   
#Q5
#	What is the total collection of Shahrukh, Akshay and Amitabh movies individually?
# You can use	a column named 'Tcollection' for this 
 
  shahrukh_collection <- sum(actorWiseHits_shahrukh$Tcollection)
  shahrukh_collection                                           #SRK Tcollection
    
	akshay_collection   <- sum(actorWiseHits_akshay$Tcollection)
	akshay_collection                                             #Akki Tcollection
    
	amitabh_collection  <- sum(actorWiseHits_amitabh$Tcollection)
	amitabh_collection                                            #BigB Tcollection
    
	
#Q6  
# Write command/s to find out how many movies are in Flop, Average, Hit and Superhit categories in the entire Bollywood data set.

  hits <- factor(bollywood$Verdict)             #hits vector stores the result
  summary(hits)                                 #using summary function over the factored vector renders final output
   
#You can use SAPPLY function if you want to apply a function specific columns in a data frame 
#You can write a command to find the maximum value of Ocollection, Wcollection, Fwcollecion and Tcollection using sapply

  sapply(bollywood[,4:7],max,na.rm = TRUE)      #final output

#Q7 
# Write a command to find the names of the movies which have the maximum Ocollection, Wcollection, Fwcollecion & Tcollection
# Store the names of 4 movies in same sequence in movie_result vector

  index <- 1                                   #an index counter

  for(randomVariable in 4:7){                  #randomVariable loops from column 4 to 7
    rowNum <- order(bollywood[,randomVariable],decreasing = TRUE)[1]
    movie_result[index] <- bollywood [rowNum,1]#movie result vector stores the result
    movie_result
    index <- index+1                           #incrementing counter to store next value at next location
  }

  movie_result                                 #final output

	

   
    


    
    
    