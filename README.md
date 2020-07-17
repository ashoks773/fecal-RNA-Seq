# fecal-RNA-Seq
# The exfoliated fecal transcriptome to explore microbiome-host interactions

Step1. Fecal sample collection, RNA extraction, mRNA enrichment + rRNA depletion followed by deep Next Generation Sequencing (~50 million reads)

Step2. Data Filtering (These initial filtering steps were adopted from samsa2 pipeline)

A) --> Merging paired-end reads using PEAR (This step is not required if you have Single end reads)

	- Install pear from 
	https://cme.h-its.org/exelixis/web/software/pear/doc.html
	- Run pear using following command
	pear -f test_R1.fastq -r test_R2.fastq -j 350 -o test	

You will get 4 output of which "assembled.fastq" will be Final merged file to be used
Note: In this command you can try multiple options 
-j for number of threads, -v for min overlap, -q for quality threshold, -y for memory to be used

B) --> Quality filtering using Trimmomatic

	- Install Trimmomatic from 
	http://www.usadellab.org/cms/?page=trimmomatic
	- Run Trimmomatic using following command
	java -jar trimmomatic-0.36.jar SE -phred33 test.assembled.fastq test.cleaned.fastq SLIDINGWINDOW:4:20 MINLEN:90
	
Output will be "test.cleaned.fastq"
Note: You can play with multiple options depending upon your quality and length of reads

C) --> Removal of ribosomal reads with SortMeRNA
	
	- Install SortMeRNA  packages from 
	https://bioinfo.lifl.fr/RNA/sortmerna/
	- Run SortMeRNA using following command
	~/sortmerna-2.1/sortmerna --ref ~/sortmerna-2.1/rRNA_databases/silva-bac-16s-id90.fasta,~/sortmerna-2.1/index/silva-bac-16s-db --reads test.cleaned.fastq --aligned test.cleaned.fastq.ribosomes --other test.ribodepleted --fastx --num_alignments 0 --log -v
    
Output will be "test.ribodepleted.fastq"

Step3. Merged, Cleaned, Ribodepleted reads will be mapped on Host genome to get Host-Gene expression profiles

	- Install kallisto from 
	http://pachterlab.github.io/kallisto/download
	- Download Ref Genome in this case Human genome from
	https://www.ncbi.nlm.nih.gov/genome/guide/human/ (GRCh38.cdna.all.fa)
	- Run Kallisto
	kallisto index -i GRCh38.cdna.all.fa_KallistoIndex GRCh38.cdna.all.fa
	kallisto quant -i GRCh38.cdna.all.fa_KallistoIndex -o test --pseudobam --single -l 180 -s 20 test.ribodepleted.fastq -t 120

Note: parameters such as -l=Estimated average fragment length, -s=Estimated SD of fragement lenght, -t=number of threds
The counts and Tpm values of each transcript are in the "test" folder which can be used for the comparative analysis


Step4. Convert Transcript IDs to GeneIDs. If you have a single host for example Human then you have to run only following two steps. First step is to convert your transcript IDs in to the Gene IDs. To select the representative GeneIDs based on the maximum expression (here based on Estimated Gene Counts)

	for i in *tsv; do perl Convert_Tid_Gid_for_singleHost.pl Homo_sapiens.GRCh38.cdna.all.fa "$i"; done;
	for i in *Gid.txt; do sort -r -n -k5 < "$i" | awk '!x[$1 FS $1]++' | sort -k1 | cut -f1,5,6 > "$i.Representative.txt"; done;
	
	# But If user has samples from multiple hosts on which reads were mapped then follow these steps to select the orthologus genes only for the downstream expression analysis - In this case we have fecal samples from Human, Chimpanzee and Gorilla. Depending upon number of hosts the script "Convert_Tid_Gid" should be modified. 1) conver TIDs to GIDs, 2) Make a single file contains HumanTID, HumanGID, ChimpGID, GorillaGID (this file can be generated via running Make_Othologus_Set.pl program on Human chimps orthologs and human gorilla orhtologs files downloaded from Mart), 3) Pick the representative GIDs
	
	for i in *tsv; do perl Convert_Tid_Gid.pl Homo_sapiens.GRCh38.cdna.all.fa Pan_troglodytes.Pan_tro_3.0.cdna.all.fa Gorilla_gorilla.gorGor4.cdna.all.fa "$i"; done;
	perl Make_Othologus_Set.pl Human_Chimps_From_Mart.txt Human_Gorilla_From_Mart.txt
	for i in *Othologus.txt; do sort -r -n -k6 < "$i" | awk '!x[$1 FS $1]++' | sort -k1 | cut -f1,6,7 > "$i.Representative.txt"; done;


Step5. To get Non-host reads (unmapped fraction to the host genome) run following commands

	samtools view -u -f 4 -F 256 test/pseudoalignments.bam > test.unmapped.bam
	samtools sort -n test.unmapped.bam -o test.unmapped.sorted.bam
	bedtools bamtofastq -i test.unmapped.sorted.bam -fq test.unmapped.fq

Step6. Use Unmapped reads (non-host reads) to counts of microbes, their functions and pathways
  
  To be continued .......
