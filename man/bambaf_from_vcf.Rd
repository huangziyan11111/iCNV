% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bambaf_from_vcf.R
\name{bambaf_from_vcf}
\alias{bambaf_from_vcf}
\title{Get BAM baf information from vcf}
\usage{
bambaf_from_vcf(dir = ".", vcf_list, chr = NULL, projname = "")
}
\arguments{
\item{dir}{The directory to all the vcf stored; default is right in this folder. Type character. Defualt '.'}

\item{vcf_list}{All the vcf names stored in vcf.list; could use command:"ls *.vcf > vcf.list" to generate. Type character.}

\item{chr}{Specify the chromosome you want to generate. Must be of int from 1-22. If not specify, this function will generate all chromosomes. Defualt NULL}

\item{projname}{Name of the project. Type character. Default ''}
}
\value{
void
}
\description{
If your vcf follow the format in the example, you could use this function to 
extract NGS baf from vcf files. Remember to load library before hands.
Save 6 lists, each list has N entry. N = # of individuals (or vcf file)
ngs_baf.nm: name of the bamfiles; ngs_baf.chr: the chromosome; ngs_baf.pos: the position of the variants; 
ngs_baf: the BAF of the variants; ngs_baf.id: the ID of the variants; filenm:the file name
}
\examples{
dir <- system.file("extdata", package="iCNV")
bambaf_from_vcf(dir,'bam_vcf.list',projname='icnv.demo.')
bambaf_from_vcf(dir,'bam_vcf.list',chr=22,projname='icnv.demo.')
}
