#---- Load microbial count files
setwd("~/Work/RNA-Seq-Fecal_Part2/Non-Host_Mapped_Reads/CAZy_results")

A10 <- read.csv(file = "A10_cazy.txt", sep = "\t", header = F)
row <- A10$V2
A10 <- A10[,1]
A10 <- data.frame(A10)
row.names (A10) <- row

A11 <- read.csv(file = "A11_cazy.txt", sep = "\t", header = F)
row <- A11$V2
A11 <- A11[,1]
A11 <- data.frame(A11)
row.names (A11) <- row

A12 <- read.csv(file = "A12_cazy.txt", sep = "\t", header = F)
row <- A12$V2
A12 <- A12[,1]
A12 <- data.frame(A12)
row.names (A12) <- row

A13 <- read.csv(file = "A13_cazy.txt", sep = "\t", header = F)
row <- A13$V2
A13 <- A13[,1]
A13 <- data.frame(A13)
row.names (A13) <- row

A14 <- read.csv(file = "A14_cazy.txt", sep = "\t", header = F)
row <- A14$V2
A14 <- A14[,1]
A14 <- data.frame(A14)
row.names (A14) <- row

A15 <- read.csv(file = "A15_cazy.txt", sep = "\t", header = F)
row <- A15$V2
A15 <- A15[,1]
A15 <- data.frame(A15)
row.names (A15) <- row

A16 <- read.csv(file = "A16_cazy.txt", sep = "\t", header = F)
row <- A16$V2
A16 <- A16[,1]
A16 <- data.frame(A16)
row.names (A16) <- row

A17 <- read.csv(file = "A17_cazy.txt", sep = "\t", header = F)
row <- A17$V2
A17 <- A17[,1]
A17 <- data.frame(A17)
row.names (A17) <- row

A18 <- read.csv(file = "A18_cazy.txt", sep = "\t", header = F)
row <- A18$V2
A18 <- A18[,1]
A18 <- data.frame(A18)
row.names (A18) <- row

A19 <- read.csv(file = "A19_cazy.txt", sep = "\t", header = F)
row <- A19$V2
A19 <- A19[,1]
A19 <- data.frame(A19)
row.names (A19) <- row

A1 <- read.csv(file = "A1_cazy.txt", sep = "\t", header = F)
row <- A1$V2
A1 <- A1[,1]
A1 <- data.frame(A1)
row.names (A1) <- row

A20 <- read.csv(file = "A20_cazy.txt", sep = "\t", header = F)
row <- A20$V2
A20 <- A20[,1]
A20 <- data.frame(A20)
row.names (A20) <- row

A21 <- read.csv(file = "A21_cazy.txt", sep = "\t", header = F)
row <- A21$V2
A21 <- A21[,1]
A21 <- data.frame(A21)
row.names (A21) <- row

A22 <- read.csv(file = "A22_cazy.txt", sep = "\t", header = F)
row <- A22$V2
A22 <- A22[,1]
A22 <- data.frame(A22)
row.names (A22) <- row

A23 <- read.csv(file = "A23_cazy.txt", sep = "\t", header = F)
row <- A23$V2
A23 <- A23[,1]
A23 <- data.frame(A23)
row.names (A23) <- row

A24 <- read.csv(file = "A24_cazy.txt", sep = "\t", header = F)
row <- A24$V2
A24 <- A24[,1]
A24 <- data.frame(A24)
row.names (A24) <- row

A25 <- read.csv(file = "A25_cazy.txt", sep = "\t", header = F)
row <- A25$V2
A25 <- A25[,1]
A25 <- data.frame(A25)
row.names (A25) <- row

A26 <- read.csv(file = "A26_cazy.txt", sep = "\t", header = F)
row <- A26$V2
A26 <- A26[,1]
A26 <- data.frame(A26)
row.names (A26) <- row

A27 <- read.csv(file = "A27_cazy.txt", sep = "\t", header = F)
row <- A27$V2
A27 <- A27[,1]
A27 <- data.frame(A27)
row.names (A27) <- row

A28 <- read.csv(file = "A28_cazy.txt", sep = "\t", header = F)
row <- A28$V2
A28 <- A28[,1]
A28 <- data.frame(A28)
row.names (A28) <- row

A29 <- read.csv(file = "A29_cazy.txt", sep = "\t", header = F)
row <- A29$V2
A29 <- A29[,1]
A29 <- data.frame(A29)
row.names (A29) <- row

A2 <- read.csv(file = "A2_cazy.txt", sep = "\t", header = F)
row <- A2$V2
A2 <- A2[,1]
A2 <- data.frame(A2)
row.names (A2) <- row

A30 <- read.csv(file = "A30_cazy.txt", sep = "\t", header = F)
row <- A30$V2
A30 <- A30[,1]
A30 <- data.frame(A30)
row.names (A30) <- row

A31 <- read.csv(file = "A31_cazy.txt", sep = "\t", header = F)
row <- A31$V2
A31 <- A31[,1]
A31 <- data.frame(A31)
row.names (A31) <- row

A32 <- read.csv(file = "A32_cazy.txt", sep = "\t", header = F)
row <- A32$V2
A32 <- A32[,1]
A32 <- data.frame(A32)
row.names (A32) <- row

A33 <- read.csv(file = "A33_cazy.txt", sep = "\t", header = F)
row <- A33$V2
A33 <- A33[,1]
A33 <- data.frame(A33)
row.names (A33) <- row

A34 <- read.csv(file = "A34_cazy.txt", sep = "\t", header = F)
row <- A34$V2
A34 <- A34[,1]
A34 <- data.frame(A34)
row.names (A34) <- row

A35 <- read.csv(file = "A35_cazy.txt", sep = "\t", header = F)
row <- A35$V2
A35 <- A35[,1]
A35 <- data.frame(A35)
row.names (A35) <- row

A36 <- read.csv(file = "A36_cazy.txt", sep = "\t", header = F)
row <- A36$V2
A36 <- A36[,1]
A36 <- data.frame(A36)
row.names (A36) <- row

A37 <- read.csv(file = "A37_cazy.txt", sep = "\t", header = F)
row <- A37$V2
A37 <- A37[,1]
A37 <- data.frame(A37)
row.names (A37) <- row

A38 <- read.csv(file = "A38_cazy.txt", sep = "\t", header = F)
row <- A38$V2
A38 <- A38[,1]
A38 <- data.frame(A38)
row.names (A38) <- row

A39 <- read.csv(file = "A39_cazy.txt", sep = "\t", header = F)
row <- A39$V2
A39 <- A39[,1]
A39 <- data.frame(A39)
row.names (A39) <- row

A3 <- read.csv(file = "A3_cazy.txt", sep = "\t", header = F)
row <- A3$V2
A3 <- A3[,1]
A3 <- data.frame(A3)
row.names (A3) <- row

A40 <- read.csv(file = "A40_cazy.txt", sep = "\t", header = F)
row <- A40$V2
A40 <- A40[,1]
A40 <- data.frame(A40)
row.names (A40) <- row

A41 <- read.csv(file = "A41_cazy.txt", sep = "\t", header = F)
row <- A41$V2
A41 <- A41[,1]
A41 <- data.frame(A41)
row.names (A41) <- row

A42 <- read.csv(file = "A42_cazy.txt", sep = "\t", header = F)
row <- A42$V2
A42 <- A42[,1]
A42 <- data.frame(A42)
row.names (A42) <- row

A43 <- read.csv(file = "A43_cazy.txt", sep = "\t", header = F)
row <- A43$V2
A43 <- A43[,1]
A43 <- data.frame(A43)
row.names (A43) <- row

A44 <- read.csv(file = "A44_cazy.txt", sep = "\t", header = F)
row <- A44$V2
A44 <- A44[,1]
A44 <- data.frame(A44)
row.names (A44) <- row

A45 <- read.csv(file = "A45_cazy.txt", sep = "\t", header = F)
row <- A45$V2
A45 <- A45[,1]
A45 <- data.frame(A45)
row.names (A45) <- row

A46 <- read.csv(file = "A46_cazy.txt", sep = "\t", header = F)
row <- A46$V2
A46 <- A46[,1]
A46 <- data.frame(A46)
row.names (A46) <- row

A47 <- read.csv(file = "A47_cazy.txt", sep = "\t", header = F)
row <- A47$V2
A47 <- A47[,1]
A47 <- data.frame(A47)
row.names (A47) <- row

A48 <- read.csv(file = "A48_cazy.txt", sep = "\t", header = F)
row <- A48$V2
A48 <- A48[,1]
A48 <- data.frame(A48)
row.names (A48) <- row

A49 <- read.csv(file = "A49_cazy.txt", sep = "\t", header = F)
row <- A49$V2
A49 <- A49[,1]
A49 <- data.frame(A49)
row.names (A49) <- row

A4 <- read.csv(file = "A4_cazy.txt", sep = "\t", header = F)
row <- A4$V2
A4 <- A4[,1]
A4 <- data.frame(A4)
row.names (A4) <- row

A50 <- read.csv(file = "A50_cazy.txt", sep = "\t", header = F)
row <- A50$V2
A50 <- A50[,1]
A50 <- data.frame(A50)
row.names (A50) <- row

A51 <- read.csv(file = "A51_cazy.txt", sep = "\t", header = F)
row <- A51$V2
A51 <- A51[,1]
A51 <- data.frame(A51)
row.names (A51) <- row

A52 <- read.csv(file = "A52_cazy.txt", sep = "\t", header = F)
row <- A52$V2
A52 <- A52[,1]
A52 <- data.frame(A52)
row.names (A52) <- row

A53 <- read.csv(file = "A53_cazy.txt", sep = "\t", header = F)
row <- A53$V2
A53 <- A53[,1]
A53 <- data.frame(A53)
row.names (A53) <- row

A54 <- read.csv(file = "A54_cazy.txt", sep = "\t", header = F)
row <- A54$V2
A54 <- A54[,1]
A54 <- data.frame(A54)
row.names (A54) <- row

A55 <- read.csv(file = "A55_cazy.txt", sep = "\t", header = F)
row <- A55$V2
A55 <- A55[,1]
A55 <- data.frame(A55)
row.names (A55) <- row

A56 <- read.csv(file = "A56_cazy.txt", sep = "\t", header = F)
row <- A56$V2
A56 <- A56[,1]
A56 <- data.frame(A56)
row.names (A56) <- row

A57 <- read.csv(file = "A57_cazy.txt", sep = "\t", header = F)
row <- A57$V2
A57 <- A57[,1]
A57 <- data.frame(A57)
row.names (A57) <- row

A58 <- read.csv(file = "A58_cazy.txt", sep = "\t", header = F)
row <- A58$V2
A58 <- A58[,1]
A58 <- data.frame(A58)
row.names (A58) <- row

A59 <- read.csv(file = "A59_cazy.txt", sep = "\t", header = F)
row <- A59$V2
A59 <- A59[,1]
A59 <- data.frame(A59)
row.names (A59) <- row

A5 <- read.csv(file = "A5_cazy.txt", sep = "\t", header = F)
row <- A5$V2
A5 <- A5[,1]
A5 <- data.frame(A5)
row.names (A5) <- row

A60 <- read.csv(file = "A60_cazy.txt", sep = "\t", header = F)
row <- A60$V2
A60 <- A60[,1]
A60 <- data.frame(A60)
row.names (A60) <- row

A6 <- read.csv(file = "A6_cazy.txt", sep = "\t", header = F)
row <- A6$V2
A6 <- A6[,1]
A6 <- data.frame(A6)
row.names (A6) <- row

A7 <- read.csv(file = "A7_cazy.txt", sep = "\t", header = F)
row <- A7$V2
A7 <- A7[,1]
A7 <- data.frame(A7)
row.names (A7) <- row

A8 <- read.csv(file = "A8_cazy.txt", sep = "\t", header = F)
row <- A8$V2
A8 <- A8[,1]
A8 <- data.frame(A8)
row.names (A8) <- row

A9 <- read.csv(file = "A9_cazy.txt", sep = "\t", header = F)
row <- A9$V2
A9 <- A9[,1]
A9 <- data.frame(A9)
row.names (A9) <- row


mylist <- list(A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,A1,A20,A21,A22,A23,A24,A25,A26,A27,A28,A29,A2,A30,A31,A32,A33,A34,A35,A36,A37,A38,A39,A3,A40,A41,A42,A43,A44,A45,A46,A47,A48,A49,A4,A50,A51,A52,A53,A54,A55,A56,A57,A58,A59,A5,A60,A6,A7,A8,A9)
#-- Without Tissue Samples A39, A52,A57,A60
#mylist <- list(A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,A1,A20,A21,A22,A23,A24,A25,A26,A27,A28,A29,A2,A30,A31,A32,A33,A34,A35,A36,A37,A38,A3,A40,A41,A42,A43,A44,A45,A46,A47,A48,A49,A4,A50,A51,A53,A54,A55,A56,A58,A59,A5,A6,A7,A8,A9)

for(i in 1:length(mylist)){
  colnames(mylist[[i]]) <- paste0( names(mylist)[i], colnames(mylist[[i]]) )
  mylist[[i]]$ROWNAMES  <- rownames(mylist[[i]])
}

library (plyr)
OTU_counts <- join_all( mylist, by="ROWNAMES", type="full" )
rownames(OTU_counts) <- OTU_counts$ROWNAMES; OTU_counts$ROWNAMES <- NULL

OTU_counts[is.na(OTU_counts)] <- 0

#------ Filtering
OTU_counts <- data.frame (t(OTU_counts))
# Filter the genes which are not present in atleast five samples
OTU_counts_filtered <- dropspc (OTU_counts, 5) 
OTU_counts_filtered <- OTU_counts_filtered[ order(row.names(OTU_counts_filtered)), ]

#--- Save filtered OTU Table - this was inlcuding Tissue Samples
OTU_counts_filtered <- data.frame(t(OTU_counts_filtered))
write.table (OTU_counts_filtered, file = "Gene_count_table.txt", sep= "\t")


#------- Normalize the gene count table based on Gene Length

