# Nutrition x Glucose Suggestions

# Create a function to combine the food diary data

# This is an example: 

process_CGM <- function(file_path){
  #file_path <- "/Users/sarahbartlett/Documents/ISEH/Police/Pilot_Data"
  
  CGM_files <- list.files(file_path, full.names = TRUE) # list all the files found in the folder
  
  CGM_results <- list() # create an empty list that we'll then add to
  
  for (file in CGM_files) { # for each file found in the folder:
    message(paste0("Processing file: ", file)) # just a message to know which file is being worked on
    CGM_raw <- read_csv(file, show_col_types = FALSE)
    # CGM_raw <- read_csv(example_CGM_file)
    # ^^ I would suggest read in an example file and test out whatever code comes next on the one file before trying to run it on all of them
    
   # If there's any cleaning you need to do to the CGM files before combining, do this here e.g. 
    CGM <- CGM_raw %>% 
      rename() or mutate() or select() # anything that'll make it easier to work with once you've got them all in one place
    
    #polar_results[[polar_id]] <- polar_comb
    CGM_results[[length(CGM_results) + 1]] <- CGM # add 'CGM' to the CGM_results we made earlier (will repeat this for each file found)
  }
  #final_polar <- bind_rows(polar_results, .id = "ID")
  final_CGM <- bind_rows(CGM_results)
  
  return(final_CGM)
  message("Done")
}

# example use:
process_CGM("/Users/sarahbartlett/Documents/ISEH/Police/Pilot_Data") # --> this is the folder with all the required spreadsheets

# ^ this would generate a combined CGM spreadsheet. 
# Depending on what you're comfortable with, you could edit the above function to do everything you need
# or build a subsequent one to change the IDs in the food diary; match CGM data to 'Meal Time' etc. 
# But since it's large amounts of data, I would suggest you pick an ID and test out code on their files/data before applying it to all the data 
# (otherwise it can take a while before you know if its working!)


