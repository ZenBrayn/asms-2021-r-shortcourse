# Define vectors that compose a pseudo mass spectrum

# A mass spectrum is composed of mass-to-charge values with corresponding intensity values
# First we create the m/z vector 

ms_mz <- c(100,101,102,103,105,106,107,108,109,110)

# Intensity vector

ms_it <- c(10,1000,780,330,5,20,2000,1500,800,20)

# simple plotting
plot(ms_mz, ms_it, type="o")

# integer indexing
ms_mz[1]

# subset indexing
# grabs first five m/z values
# ':' operator 
ms_mz[1:5]

# indexing based on a condition
mz_above_103 <- ms_mz > 103

# print indexed mzs as sanity check
ms_mz[mz_above_103]

# indexing odd-indexed m/z
ms_mz[c(1,3,5,7,9)]

# multiply intensity values by 2
ms_it * 2

# addition of vectors, element-wise
ms_mz + ms_it

# common math functions
min(ms_it)
max(ms_mz)
mean(ms_it)
sd(ms_it)
length(ms_it)

# index vector and replace values
ms_it[1] <- 101.5

# m/z values of highest peak in psuedo spectrum
base_peak_idx <- ms_it == max(ms_it)

# we have determined the index, but that doesn't tell us the m/z value or intensity value
# we now index the mz
ms_mz[base_peak_idx]

# additional metadata vector (psuedoIDs)
peak_IDs <- c(NA,"protein1",NA,NA,NA,NA,"protein2",NA,NA,NA)

# plot
plot(ms_mz, ms_it, type="o",ylim=c(0,2200))
text(ms_mz,ms_it, peak_IDs, pos=3)


# exercise using indexing
# indexing exercise, get and print m/z and intensity for proteins 1 and 2

# exercises of vectors
# calculate the mean intensity of the mass spectrum
# normalize intensity of spectrum to the mean intensity



### data.frames in R
# psuedo parsed MS data for a different proteins
# data.frames store vectors (usually) so multiple pieces of information (variables)
# regarding a single observation can be efficiently analyzed

# in this first example we will define a pseudo LC-MS/MS analysis where we have 5 proteins with different variables that relate to their analysis. 
# as vectors
proteins <- c("protein1","protein2","protein3","protein4","protein5")
retention_times <- c(10.2,15.2,12.2,9.1,17.3)
sum_ms1_intensities <- c(20000,50000,1000,2000,30000)
n_ms2_transitions <- c(2L,4L,3L,1L,1L)
fdr <- c(0.11,0.03,0.02,0.15,0.06)
seq_coverage <- c(0.63,0.65,0.55,0.90,0.82)
in_ds2 <- c(TRUE,TRUE,FALSE,FALSE,TRUE)

# write a data.frame from vectors
protein_id_df <- data.frame(proteins = c("protein1","protein2","protein3","protein4","protein5"),
                            retention_times = c(10.2,15.2,12.2,9.1,17.3),
                            sum_ms1_intensities = c(20000,50000,1000,2000,30000),
                            n_ms2_transitions = c(2L,4L,3L,1L,1L),
                            fdr = c(0.11,0.03,0.02,0.15,0.06),
                            seq_coverage = c(0.63,0.65,0.55,0.90,0.82),
                            in_ds2 <- c(TRUE,TRUE,FALSE,FALSE,TRUE))

# alternatively
protein_id_df <- data.frame(proteins = proteins,
                            retention_times = retention_times,
                            sum_ms1_intensities = sum_ms1_intensities,
                            n_ms2_transitions = n_ms2_transitions,
                            fdr = fdr,
                            seq_coverage = seq_coverage,
                            in_ds2 = in_ds2)


# accessing variables
# R makes it simple to data.frame variables by their name using the
# "$" operator
# get the sum of ms1 intensities variable for each observation
# this will return a vector
protein_id_df$sum_ms1_intensities

# operating on these vectors is now possible..
# print max peak intensity
max(protein_id_df$sum_ms1_intensities)
# or get intensity range...
range(protein_id_df$sum_ms1_intensities)

# indexing
# [row,col]
# get 2nd row, all cols
protein_id_df[2,]

# get column 3 and first two rows
protein_id_df[1:2,3]

# conditional indexing
protein_id_df[protein_id_df$fdr < 0.05,]



# let's look at similar operations using ONLY vectors...
# this makes clear the advantage of the data.frame..
# indexing many variables with vectors

# define and store the index
low_fdr_idx <- fdr < 0.05
# this will create a boolean array where TRUE indicates the condition is met
# and FALSE indicates the condition is not met
low_fdr_idx

# subset all variables by the index
# notice the printing just shows the values without context of what is being
proteins[low_fdr_idx]
retention_times[low_fdr_idx]
sum_ms1_intensities[low_fdr_idx]
n_ms2_transitions[low_fdr_idx]
fdr[low_fdr_idx]
seq_coverage[low_fdr_idx]
in_ds2[low_fdr_idx]


# adding a variable...
protein_id_df$phosphorylated <- c(TRUE,FALSE,FALSE,FALSE,TRUE)
protein_id_df$phosphorylated <- c(TRUE,FALSE,FALSE,FALSE,TRUE)

# new variables (cols) to add
pathway_result <- data.frame(pathway = c("apoptosis","immune response","regulation","immune response","apoptosis"),
                             database = c("in-house","in-house","in-house","reactome","reactome"))

protein_id_df_pw <- cbind(protein_id_df, pathway_result)

# new variables (cols) to add
protein6_df <- data.frame(proteins = "protein6",
                          retention_times = 15.1,
                          sum_ms1_intensities = 20000,
                          n_ms2_transitions = 4,
                          fdr = 0.01,
                          seq_coverage = 0.22,
                          in_ds2 = FALSE,
                          phosphorylated = TRUE,
                          pathway = "regulation",
                          database = "reactome")

rbind(protein_id_df_pw, protein6_df)

