library(stringr)
plant_families <- read.csv(file="Plant_families_for_R.csv")

##Getting information about distribution of plant characteristics##
###################################################################

#What proportion of plant families are woody?
prop <- nrow(subset(plant_families, habit == "woody"))/(nrow(plant_families))
percent <- ((signif(prop, digits=3))*100)
cat(percent, "% of the families are woody")

#What proportion of plant families have stipules?
prop <- nrow(subset(plant_families, stipules == "present"))/nrow(plant_families)
percent <- ((signif(prop, digits=3))*100)
cat(percent, "% of the families have stipules")

#What proportion of the plant families are vines?
prop <- nrow(subset(plant_families, habit == "vine"))/nrow(plant_families)
percent <- ((signif(prop, digits=3))*100)
cat(percent, "% of the families are vines")

#What families are vines without stipules?
Vine_nostipule_families <- subset(plant_families, habit =="vine" & stipules == "absent")
Family <- as.vector(Vine_nostipule_families$Family)
cat("Possible Families:", Family)

##But this would be annoying to re-write for every new plant

#Querying the table with user input
prompt <- "Describe your plant:
habit(woody/herbaceous/vine)\nstipules(present/absent)\nleaf arrangement(opposite/alternate) 
ovary position(superior/inferior)\ninflorescence(umbel/head/cyme/terminal)\nfloral symmetry(radial/zygomorphic/actinomorphic)"
Character_list <- as.vector(strsplit(readline(prompt), " ")[[1]])

#Check to see what families have all the charaters entered by the user:
Matching_rows <- subset(plant_families, habit == Character_list[1] & stipules == Character_list[2] 
                        & leaf.arrangement == Character_list[3] & ovary.position== Character_list[4]  
                        & inflorescence == Character_list[5]
                        & floral.symmetry ==Character_list[6] )
Matching_families <- (Matching_rows[1])
print(Matching_families[1])

##This relies on user following instructions and is very ugly

###Function that takes user input to get information about plant###
##################################################################
fun <- function(test)
{
habit <-readline("habit? ")
leaf <-readline("leaf arrangement? ")
stipules <-readline("stipules? ")
ovary <- readline("ovary position? ")
inflorescence <- readline("inflorescence type? ")
symmetry <- readline("floral symmetry? ")

habit <- as.character(habit)
leaf <- as.character(leaf)
stipules <- as.character(stipules)
ovary <- as.character(ovary)
inflorescence <- as.character(inflorescence)
symmetry <- as.character(symmetry)
input <- c(habit, leaf, stipules, ovary, inflorescence, symmetry)
}
if(interactive()) fun(test)
###Function that takes user input to ge information about plant###
##################################################################

#Running the function will generate prompts and store output to a vetor
character_suite <- fun(test)
## Same as above but without having to change every time
Matching_rows_2 <- subset(plant_families, habit == character_suite[1] & leaf.arrangement == character_suite[2]
                        & stipules== character_suite[3] & ovary.position== character_suite[4]
                        & inflorescence == character_suite[5]
                        & floral.symmetry ==character_suite[6])
Matching_families_2 <- (Matching_rows_2$Family)
print(Matching_rows_2[1])
######################################################################

Still working on only printing the "Family" value from the vector




              







