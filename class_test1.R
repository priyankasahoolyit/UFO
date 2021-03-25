############################# Solution 1 #################################

# Created a new project called UFO in GitHub.
# File "ufo.csv" downloaded from blackboard and inserted into data frame called as "ufo_data".
# The UFO data set holds lots of variables that contain an empty space.
# Hence, replaced each empty space/missing content with NA.

ufo_data <- read.csv("ufo.csv", na = "") # Reading ufo.csv file
ufo_data [ufo_data == ""] <- NA #Assigning blank spaces with NA


############################# Solution 2 #################################

# structure of the UFO data frame is displayed
# The first 15 rows of data within the data frame is shown. 
# count of number of rows within the UFO data frame are 89071 rows.

str(ufo_data) # Show structure of the UFO data
head(ufo_data, n = 15) #Displaying first 15 rows
nrow(ufo_data) #count the number of rows within the UFO data frame


################################ Solution 3 #################################

# The datetime field is converted to a date variable in mm/dd/yyyy format from chr variable.

converted_date <- as.Date(ufo_data$datetime, "%m/%d/%y") # datetime variable is converted to date type and formatetted
converted_date
str(converted_date)


################################ Solution 4 #################################

# Update the UFO data frame with the new date structure. 
# Displaying the new structure of the UFO data frame.

ufo_data$datetime <- converted_date # Replace the date field in the data frame
str(ufo_data) # The date structure has now changed to a date variable
head(ufo_data, n = 15)


################################ Solution 5 #################################

# Used the names() function to display the names of the UFO dataframe
# Modified the variable names shown  below with their updated variable names.

# Variable name --> Updated variable name
# duration..seconds. --> DurationSeconds
# duration..hours.min. --> DurationHrsMins
# date.posted --> DatePosted

names(ufo_data) # display the names of the UFO dataframe

# Updating the name of the variables to make it readable
names(ufo_data)[names(ufo_data) == "duration..seconds."] <- "DurationSeconds"
names(ufo_data)[names(ufo_data) == "duration..hours.min."] <- "DurationHrsMins"
names(ufo_data)[names(ufo_data) == "date.posted"] <- "DatePosted"

names(ufo_data) # display the names of the UFO dataframe with updated variable names


################################ Solution 6 #################################

# The latitude variable is converted to numeric variable from chr.
# Show the new structure of the data frame.

str(ufo_data) # Display the current structure of data frame

converted_latitude <- as.numeric(ufo_data$latitude)  # Converted the latitude to numerical variable from chr.
converted_latitude
str(converted_latitude) # Display the structure of latitude variable after conversion


# Replace the latitude field in the data frame
ufo_data$latitude <- converted_latitude
str(ufo_data) # Display the new structure of the data frame


################################ Solution 7 #################################

# Using the mice library, the number of missing variables in the UFO data frame is displayed.
# Saved missing variable plot into the working directory, named as missingvars.png.

# Installed and used mice package to show
# missing var in  the UFO dataframe
install.packages("mice")
library(mice)
md.pattern(ufo_data)

# Installed VIM package and displayed the missing values
install.packages("VIM")
library(VIM)
missing_values <- aggr(ufo_data, prop = FALSE, numbers = TRUE)

# show summary of the content of missing_values 
summary(missing_values)

# Briefing on missing values
#  • How many records have no missing data content?
# Around 73563 records have no missing content.

#  • How many variables have all data variables missing?
# country variable contains maximum number of missing data. followed by state.



################################ Solution 8 #################################

# Sorted the UFO data frame firstly by shape and then by city. 
# Then extracted only the columns datetime, city, country and shape 
# and stored the content into a data frame called sorted_ufo_data. 
# Displayed the first 15 rows of data in this new data frame.

str(ufo_data)

# sort by shape and then city and stored in data frame called sorted_data 
attach(ufo_data)
sorted_data <- ufo_data[order(shape,city), ]
sorted_data

# added sorted_data data in data frame called sorted_ufo_data
sorted_ufo_data <- data.frame(sorted_data$datetime, 
                              sorted_data$city,
                              sorted_data$country, 
                              sorted_data$shape
                              )
# changed variables titles to make them more readable

names(sorted_ufo_data)[1] <- "datetime"
names(sorted_ufo_data)[2] <- "city"
names(sorted_ufo_data)[3] <- "country"
names(sorted_ufo_data)[4] <- "shape"

head(sorted_ufo_data, n = 15) #Displaying first 15 rows


################################ Solution 9 #################################

# Subsetting is the process of extracting one or more element from any data structure.
# Using the subset() function, all entries in the UFO data frame where the country
# equals “gb” and the shape variable equals “disk” is extracted. 
# The selected contents are stored in a data frame called ufo_gb_disk.

attach(ufo_data)
ufo_gb_disk <- subset(ufo_data, country == "gb" & shape == "disk" ) # Subsetting
ufo_gb_disk

head(ufo_gb_disk, n = 15) #Displaying first 15 rows

################################ Solution 10 #################################

# Using the write.csv() command, newly modified UFO data frame is saved as
# modified_ufo.csv, ufo_gb_disk data frame is saved as ufo_gb.csv and
# sorted_ufo_data is saved as sorted_ufo.csv into the working directory of project.


# newly modified UFO data frame written to a csv file as modified_ufo.csv 
write.csv(ufo_data, file= "modified_ufo.csv")

# ufo_gb_disk data frame written to a csv file as ufo_gb.csv 
write.csv(ufo_gb_disk, file= "ufo_gb.csv")

# sorted_ufo_data data frame written to a csv file as sorted_ufo.csv 
write.csv(sorted_ufo_data, file= "sorted_ufo.csv")


##################################### The End #################################

# Finally, synced the script file as well as modified_ufo.csv, ufo_gb.csv,
# sorted_ufo_data.csv and missingvars.png file to the remote GitHub repo.
# Link shared through Black board. 
